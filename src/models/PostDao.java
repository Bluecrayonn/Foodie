package models;

import java.util.Iterator;
import java.util.Map;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PostDao {
	@Autowired 
	MongoTemplate template;
	@Autowired
	SqlSessionFactory factory;
	
	public boolean writePost(Map param) {
		// 재료 저장
		//template.insert(map, "ingredients");
		
		// 포스트 글내용 따로 저장
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			// insert, update, delete 맵핑시 resultType 설정이 불가
			// 모두 int가 return
			// select 시에는 resultType 혹은 resultMap이 필수
			
			// 몽고 데이터만 남기고 rdb용은 따로 뺌
			// title, writer, elapsedtime, mainimg, content
			//param.remove(key)
			System.out.println(param.get("thumbnail"));
			PostDto dto = new PostDto(1
					,(String)param.remove("title")
					,(String)param.remove("editorcontent")
					,(String)param.remove("mainimage")
					,Integer.parseInt((String)param.remove("elapsedtime")));
			// INT ID = SELECT POST_SEQ.NEXTVAL FROM DUAL
			// 
			r = session.insert("post.write", dto);
			if (r != 0) {
				//몽고작업
				
			}
//			Iterator<String> iter = param.keySet().iterator();
//			while(iter.hasNext()) {
//			}
		} finally {
			session.close();
		}
		return r>0?true:false;
	}
}
