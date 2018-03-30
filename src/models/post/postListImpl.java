package models.post;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.ScriptOperations;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.data.mongodb.core.mapreduce.MapReduceOptions;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.script.ExecutableMongoScript;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.CommandResult;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import Map_reduce.ReduceObject;
import models.postListDAO;

@Repository
public class postListImpl implements postListDAO {

	@Autowired
	SqlSessionFactory factory;
	@Autowired
	MongoTemplate template;

	public String keywordParser(String keywords) {
		System.out.println("[postListController] : parsing keywords Array into string");

		String[] array = keywords.split(" ");
		String result = "";

		for (int cnt = 0; cnt < array.length; cnt++) {

			result += array[cnt];
			if (cnt < array.length - 1)
				result += "|";
		}
		System.out.println("[postListController] : parsing result =>" + result);

		return result;
	}

	public List<Map> searchPostList(Map map) {
		
		
		SqlSession session = factory.openSession();
		System.out.println(map.toString());
		if (map.get("keywords") != null) {
			String keywords = keywordParser((String) map.get("keywords"));
			map.put("keywords", keywords);
		}
		String[] keywordArray = ((String) map.get("keywords")).split(" ");

		// 몽고디비 재료 구문
		DBCollection collection = template.getCollection("ingredients");
		DBCursor cursor = collection
				.find(new BasicDBObject("ingredients.name", new BasicDBObject("$in", keywordArray)));
		List<DBObject> list = cursor.toArray();
		if (list.size() > 0) {
			for (DBObject obj : list) {
				System.out.println(obj.get("post_id"));
			}
		}
		// List<String> distinctList = collection.distinct("ingredients.name");

		System.out.println(map.toString());
		try {
			System.out.println("[postListController] :entering try box");

			List<Map> result = session.selectList("social.searchPost", map);

			System.out.println("[postListController] : result =>" + result.toString());
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	@Override
	public List<Map> getAllPostList() {
		SqlSession session = factory.openSession();

		try {
			System.out.println("[postListController] :entering try box");

			List<Map> result = session.selectList("social.getPost");

			System.out.println("[postListController] : result =>" + result.toString());
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	@Override
	public List<Map> getDatePostList() {
		SqlSession session = factory.openSession();

		try {
			List<Map> result = session.selectList("social.getPostbyDate");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	@Override
	public List<Map> getBookmarksPostList() {
		SqlSession session = factory.openSession();

		try {
			List<Map> result = session.selectList("social.getPostbyBookmark");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	public void ingreMapreduce() throws IOException {

		MapReduceResults<ReduceObject> results = template.mapReduce("ingredients", "classpath:Map_reduce/ingre_map.js",
				"classpath:Map_reduce/ingre_reduce.js",
				new MapReduceOptions().outputCollection("Mapout1").outputTypeMerge(), ReduceObject.class);
		System.out.println("아시발꿈");
		System.out.println(results.hashCode());
		System.out.println(results.getCounts());

		for (ReduceObject map1 : results) {
			System.out.println(map1.toString());
		}

		/*
		 * GroupByResults<ReduceObject> t = template.group("ingredients",
		 * GroupBy.keyFunction("classpath:Map_reduce/ingre_map.js").initialDocument(
		 * "{count:0}").reduceFunction( "classpath:Map_reduce/ingre_reduce.js"),
		 * ReduceObject.class);
		 * 
		 * 
		 * for(ReduceObject map : t) { System.out.println(map.toString()); }
		 */

	}

}
