package models;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;

@Repository
public class IngredientDao {
	@Autowired 
	@Qualifier("basic")
	MongoTemplate template;
	
	public List<LinkedHashMap> searchStartsWith(String syllable) {
		Query query = new Query(Criteria.where("ingredients").elemMatch(Criteria.where("name").regex("^(?i)"+syllable)));
		List<LinkedHashMap> result = template.find(query, LinkedHashMap.class, "ingredients");
		return result;
	}
	
	public List<LinkedHashMap> getIngredientById(int postId){
		Query query = new Query(Criteria.where("post_id").is(postId));
		LinkedHashMap result = template.findOne(query, LinkedHashMap.class, "ingredients");
		if (result.containsKey("ingredients")) {
			return (List<LinkedHashMap>)result.get("ingredients");
		} else {
			return null;
		}
	}
}
