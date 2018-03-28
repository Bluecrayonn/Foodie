package models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.DBCollectionFindOptions;

@Repository
public class CommentDAO {

	@Autowired
	MongoTemplate template;

	public String getComment(long postId) {
		
		/*Criteria criteria=new Criteria("POST_ID");
		criteria.is(postId);

		Query query = new Query(criteria);
		List result=  template.find(query, HashMap.class,"comment");
 		
		System.out.println(result.toString());*/
		
		
		DBCollection mt = template.getCollection("comment");
		DBCursor list = mt.find(new BasicDBObject("POST_ID", postId),new BasicDBObject("comments", 1).append("_id", 0));
 		
		System.out.println(list.toString());
		System.out.println(list.toArray().toString());
		System.out.println(list.length());
		mt.find(new BasicDBObject("POST_ID", postId));

		System.out.println(list.toString());
		

		return list.toArray().toString();
	}

	public String addComment(Map<String, Object> map, long userId) {

		long today = System.currentTimeMillis();
		long postId = Long.parseLong((String) map.get("postId"));
		UUID uuid = UUID.randomUUID();
		map.put("comment_id", uuid.toString());
		
		
		map.remove("postId");
		map.put("WRITE_DATE", today);

		DBCollection mt = template.getCollection("comment");

		DBCursor cursor = mt.find(new BasicDBObject("POST_ID", postId));
		int a = cursor.length();
		System.out.println(a);
		if (a == 0) {
			mt.insert(new BasicDBObject("POST_ID", postId).append("comments", new ArrayList<Map>()));
			mt.update(new BasicDBObject("POST_ID", postId),
					new BasicDBObject("$push", new BasicDBObject("comments", map)));
		} else {
			mt.update(new BasicDBObject("POST_ID", postId),
					new BasicDBObject("$push", new BasicDBObject("comments", map)));

		}
		// mt.update(new BasicDBObject("POST_ID", postId),
		// new BasicDBObject("$push", new BasicDBObject("comments",map)));

		// mt.insert(new BasicDBObject("POST_ID", postId).append("comments", new
		// ArrayList<Map>()));

		return null;
	}

	public String editComment(long postId, long userId) {
		DBCollection mt = template.getCollection("comment");

		System.out.println(mt.find(new BasicDBObject("POST_ID",postId).append("USER_ID", 1)).toArray().toString());;
		return null;
	}

	public String removeComment() {

		return null;
	}

	public String modifyComment(String pid, String cid, String msg) {
		Query query = new Query();
			query.addCriteria(Criteria.where("POST_ID").is(pid));
			query.addCriteria(Criteria.where("comments.id").is(cid));

			List list = template.find(query, Map.class, "comment");
			System.out.println(list);

			Update update = new Update();
			update.set("comments.$.text", msg);
		WriteResult result = template.updateMulti(query, update, "comment");
		return result.toString();
	}

}
