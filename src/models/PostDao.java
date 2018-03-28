package models;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mongodb.WriteResult;

@Repository
public class PostDao {
	@Autowired 
	MongoTemplate template;
	@Autowired
	SqlSessionFactory factory;
	
	public LinkedHashMap getOnePost(int postId) {
		SqlSession session = factory.openSession();
		LinkedHashMap post = null;
		try {
			post = session.selectOne("post.selectOneById", postId);
		} finally {
			session.close();
		}
		return post;
	}
	public boolean modifyPost(Map param) {
		// 포스트 글내용과 재료는 따로 저장
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			int postId = Integer.parseInt((String)param.get("pid"));
			PostDto dto = new PostDto(
					postId
					,(int)param.get("writer")
					,(String)param.remove("title")
					,(String)param.remove("editorcontent")
					,(String)param.remove("mainimage")
					,Integer.parseInt((String)param.remove("elapsedtime")));
			// 
			r = session.update("post.modify", dto);
			if (r != 0) {
				LinkedList<String> ig_name = (LinkedList)param.get("ig_name");
				LinkedList<String> ig_amount = (LinkedList)param.get("ig_amount");
				LinkedList<String> ig_unit = (LinkedList)param.get("ig_unit");
				Map<String, Object> obj = new LinkedHashMap<String, Object>();
				LinkedList<LinkedHashMap> ig_list = new LinkedList<>();
				for (int i=0; i<ig_name.size(); i++) {
					LinkedHashMap<String, Object> oneItem = new LinkedHashMap<String, Object>();
					oneItem.put("name", ig_name.get(i));
					oneItem.put("qty", ig_amount.get(i));
					oneItem.put("unit", ig_unit.get(i));
					ig_list.add(oneItem);
				}
				Query query = new Query(Criteria.where("post_id").is(postId));
				Update update=new Update();
				update.set("ingredients",ig_list);
				template.updateFirst(query, update, "ingredients");
			}
		} finally {
			session.close();
		}
		return r>0?true:false;
	}	
	public boolean writePost(Map param) {
		// 포스트 글내용과 재료는 따로 저장
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			// insert, update, delete 맵핑시 resultType 설정이 불가
			// 모두 int가 return
			// select 시에는 resultType 혹은 resultMap이 필수
			
			// 몽고 데이터만 남기고 rdb용은 따로 뺌
			// title, writer, elapsedtime, mainimg, content
			//param.remove(key)
			int postId = session.selectOne("post.givenId");
			System.out.println(postId);
			
			PostDto dto = new PostDto(
					postId
					,(int)param.get("writer")
					,(String)param.remove("title")
					,(String)param.remove("editorcontent")
					,(String)param.remove("mainimage")
					,Integer.parseInt((String)param.remove("elapsedtime")));
			// 
			r = session.insert("post.write", dto);
			if (r != 0) {
				//몽고작업
				//재료가 몇가지인지 뽑아와야함
				LinkedList<String> ig_name = (LinkedList)param.get("ig_name");
				LinkedList<String> ig_amount = (LinkedList)param.get("ig_amount");
				LinkedList<String> ig_unit = (LinkedList)param.get("ig_unit");
				Map<String, Object> obj = new LinkedHashMap<String, Object>();
				obj.put("post_id", postId);
				LinkedList<LinkedHashMap> ig_list = new LinkedList<>();
				for (int i=0; i<ig_name.size(); i++) {
					LinkedHashMap<String, Object> oneItem = new LinkedHashMap<String, Object>();
					oneItem.put("name", ig_name.get(i));
					oneItem.put("qty", ig_amount.get(i));
					oneItem.put("unit", ig_unit.get(i));
					ig_list.add(oneItem);
				}
				obj.put("ingredients", ig_list);
				
				//postid:xx, 
				//ingredients:{
				//	{name:감자,qty:1,unit:kg},
				//	{name:고구마,qty:1,unit:kg},
				//	{name:감자,qty:500,unit:g},
				//	{name:간장,qty:2,unit:큰스푼}
				//}
				//요로케 들어가면 되겠다.
				
				template.insert(obj, "ingredients");
			}
//			Iterator<String> iter = param.keySet().iterator();
//			while(iter.hasNext()) {
//			}
		} finally {
			session.close();
		}
		return r>0?true:false;
	}
	
	public LinkedHashMap mongotest() {
		String pid="1002", cid="11", text="성공";
		Query query = Query.query(Criteria.where("post_id").is(pid).andOperator(Criteria.where("comments.id").is(cid)));
		//Update update = new Update().set("comments.$.text", text);
		
		//WriteResult result = template.updateFirst(query, update, "comment");
		LinkedHashMap result = (LinkedHashMap) template.find(query, LinkedHashMap.class);
		return result;
	}
}
