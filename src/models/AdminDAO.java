package models;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	
	@Autowired
	@Qualifier("basic")
	MongoTemplate template;
	
	public String genderReduce() {
		Set<String> collectionNames = template.getCollectionNames();
		String regex="search_";
		for(String str : collectionNames) {
			System.out.println(str);
			System.out.println(str.startsWith("search_log_"));
		}
		
		
		
		
		return null;
	}

}
