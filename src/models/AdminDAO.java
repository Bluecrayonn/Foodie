package models;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.MapReduceOptions;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

@Repository
public class AdminDAO {
	
	
	@Autowired
	@Qualifier("basic")
	MongoTemplate template;
	@Autowired
	@Qualifier("reduce")
	MongoTemplate reduceTemplate;
	
	
	public List<String> keywordDistinct(){
		Set<String> collectionNames = template.getCollectionNames();
		List<String> distinct = new LinkedList<>();
		for(String collection : collectionNames) {
			if(collection.startsWith("search_log_")) {

		 	distinct.addAll( template.getCollection(collection).distinct("keywords"));
			}
		}

		System.out.println(distinct);
		
		return distinct;
	}
	
	public List<Map> genderReduce(String keywords) {
		Set<String> collectionNames = reduceTemplate.getCollectionNames();
		List result = new LinkedList<>();
		List<DBObject> cursorList = new LinkedList<>();
		
		
		
		for(String str : collectionNames) {
			System.out.println(str);
			System.out.println(str.startsWith("search_log_reduce_tot_"));
			
			if(str.startsWith("search_log_reduce_tot_")) {
				cursorList.addAll(reduceTemplate.getCollection(str).find(new BasicDBObject("_id", keywords)).toArray());
  			}
		}
		
 		for(DBObject obj : cursorList) {
			System.out.println(obj.toString());
			result.add(obj.toMap());
		}
		//temp 드랍해줌 
 		System.out.println(result);
		
		
		return result;
	}
	public List<Map> ageReduce(String keywords){
		
		Set<String> collectionNames = template.getCollectionNames();
 		String mapFunction="function() {\r\n" + 
 				"   \r\n" + 
 				"  \r\n" + 
 				" \r\n" + 
 				"  \r\n" + 
 				"   \r\n" + 
 				"                           var key = this.gender;\r\n" + 
 				"                           var value = 1;\r\n" + 
 				"                           emit(key, value);\r\n" + 
 				"                    \r\n" + 
 				" \r\n" + 
 				"  \r\n" + 
 				"  \r\n" + 
 				"                      \r\n" + 
 				"                    };";
 		
 		String reduceFunction="function(key, countObjVals) {\r\n" + 
 				"                    var reducedVal = 0;\r\n" + 
 				"\r\n" + 
 				"                     for (var idx = 0; idx < countObjVals.length; idx++) {\r\n" + 
 				"                         reducedVal  += countObjVals[idx] ;\r\n" + 
 				"                          \r\n" + 
 				"                     };\r\n" + 
 				"\r\n" + 
 				"                     return reducedVal;\r\n" + 
 				"                  };    ";
 		
 		Query query = new Query();
 		
 		Criteria crit1 = new Criteria("keywords").elemMatch(new Criteria().is("소"));
 		DBCollection foodie=template.getCollection("foodie");
  		

 		query.addCriteria(crit1);
 		MapReduceResults<HashMap> reduceResult  = null;
 		if(template.getCollection("temp.reduce.age")==null) {
 			template.createCollection("temp.reduce.age");
 		}
 		
		
		
		for(String str : collectionNames) {
 			
			if(str.startsWith("search_log_")) {
				//MapReduceResults<HashMap> result = template.mapReduce(query, str, mapFunction, reduceFunction,new MapReduceOptions().outputCollection("temp.reduce").outputTypeMerge(), HashMap.class);
				template.getCollection(str).mapReduce(mapFunction, reduceFunction, "temp.reduce.age", new BasicDBObject("keywords",new BasicDBObject("$elemMatch", new BasicDBObject("$eq", "소"))));
			}
		}
		DBCursor cursor = template.getCollection("temp.reduce.age").find();
		
		List<DBObject> list =  cursor.toArray();
		List<Map> result = new LinkedList<>();
		for(DBObject obj : list) {
			result.add(obj.toMap());
		}
		//temp 드랍해줌 
		template.getCollection("temp.reduce.age").drop();
 		
		
		return result;
		
		
		
 				
	}

}
