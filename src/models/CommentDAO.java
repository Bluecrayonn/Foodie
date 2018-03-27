package models;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;

@Repository
public class CommentDAO {
	
	
	@Autowired
	MongoTemplate template;

	public String addComment(Map<String,Object> map,long userId) {
		
		long today = System.currentTimeMillis();
		long postId = Long.parseLong((String)map.get("postId"));
		map.remove("postId");
		map.put("WRITE_DATE", today);
		
		DBCollection mt = template.getCollection("comment");
		
		DBCursor cursor = mt.find(new BasicDBObject("POST_ID",postId));
		int a =cursor.length();
		System.out.println(a);
		if(a == 0) {
			mt.insert(new BasicDBObject("POST_ID", postId).append("comments", new ArrayList<Map>()));
			mt.update(new BasicDBObject("POST_ID", postId),
					new BasicDBObject("$push", new BasicDBObject("comments",map)));
		}else {
			mt.update(new BasicDBObject("POST_ID", postId),
					new BasicDBObject("$push", new BasicDBObject("comments",map)));
			
		}
		//mt.update(new BasicDBObject("POST_ID", postId),
				//new BasicDBObject("$push", new BasicDBObject("comments",map)));
		
		//mt.insert(new BasicDBObject("POST_ID", postId).append("comments", new ArrayList<Map>()));

		return null;
	}

	public String editComment() {

		return null;
	}

	public String remiveComment() {

		return null;
	}

}
