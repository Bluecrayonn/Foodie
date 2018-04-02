package models.post;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.hibernate.dialect.identity.SybaseAnywhereIdentityColumnSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.ArrayOperators.Filter;
import org.springframework.data.mongodb.core.aggregation.TypedAggregation;
import org.springframework.data.mongodb.core.mapreduce.MapReduceOptions;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MapReduceCommand;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;

import Map_reduce.ReduceObject;
import models.postListDAO;

@Repository
public class postListImpl implements postListDAO {

	@Autowired
	SqlSessionFactory factory;

	@Autowired
	@Qualifier("basic")
	MongoTemplate template;

	@Autowired
	@Qualifier("reduce")
	MongoTemplate reduceTemplate;

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
		String[] keywordArray = ((String) map.get("keywords")).split(" ");
		System.out.println(map.toString());
		if (map.get("keywords") != null) {
			String keywords = keywordParser((String) map.get("keywords"));
			map.put("keywords", keywords);
		}

		// 몽고디비 재료 구문
		DBCollection collection = template.getCollection("ingredients");

		// $in 에 정규식 구문을 넣어 포함된 재료를 모두 가지고 오는 방법을 취하자. 너무 음...ㅡ ,. ㅡ
		DBCursor cursor = collection
				.find(new BasicDBObject("ingredients.name", new BasicDBObject("$in", keywordArray)));
		List<DBObject> list = cursor.toArray();
		List<Long> ing_post_list = new LinkedList<>();

		if (list.size() > 0) {
			for (DBObject obj : list) {
				System.out.println(obj.get("post_id"));
				ing_post_list.add((long) ((Integer) obj.get("post_id")));

			}
			map.put("ingredients", ing_post_list);
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

	public void serchListUpdate(Map map) {

		String[] keywordArray = ((String) map.get("keywords")).split(" ");
		List<String> keywordList = new ArrayList<>(Arrays.asList(keywordArray));
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdate = new SimpleDateFormat("yy_MM_dd_hh_mm_ss");
		System.out.println(date.toString());
		if (template.getCollection("search_log_" + date.toString()) == null) {
			DBCollection collection = template.createCollection("search_log_" + date.toString());
		}
		template.getCollection("search_log_" + date.toString());
		HashMap<String, Object> keywordMap = new HashMap<>();
		keywordMap.put("time_line", System.currentTimeMillis());
		keywordMap.put("keywords", keywordList);
		template.insert(keywordMap, "search_log_" + date.toString());

	}

	public List<Map> recentSearchKeywords(String term) {
		long currTime = System.currentTimeMillis();
		long pastTime = 0;
		String pastTerm = null;
		DBCollection collection3 = null;
		
		Date date = new Date(currTime);
		DBCollection collection = template.getCollection("search_log_" + date.toString());

		// 날짜가 넘어간 경우 두가지 collection 에서 reducing 해주기 위해서 설정
		switch (term) {
		case "1d":
			term = "60*60*24*1000";
			pastTime = currTime - 60 * 60 * 24 * 1000;
		
			if (date.toString().equals(new Date(pastTime).toString())) {
				System.out.println("그래도 오늘");
			} else {
				System.out.println("다른날이군!");
				collection3 = template
						.getCollection("search_log_" + new Date(pastTime).toString());
			}

			break;
		case "1h":
			term = "60*60*1000";
			pastTime = currTime - 60 * 60 * 1000;
			if (date.toString().equals(new Date(currTime - 60 * 60 * 1000).toString())) {
				System.out.println("그래도 오늘");
			} else {
				System.out.println("다른날이군!");
				collection3 = template.getCollection("search_log_" + new Date(pastTime).toString());
			}
			break;
		case "30m":
			term = "60*30*1000";
			pastTime = currTime - 60 * 30  * 1000;
			if (date.toString().equals(new Date(currTime - 60 * 30 * 1000).toString())) {
				System.out.println("그래도 오늘");
			} else {
				System.out.println("다른날이군!");
				collection3 = template.getCollection("search_log_" + new Date(pastTime).toString());
			}
			break;
		case "10m":
			term = "60*10*1000";
			pastTime = currTime - 60 * 10  * 1000;
			if (date.toString().equals(new Date(currTime - 60 * 10 * 1000).toString())) {
				System.out.println("그래도 오늘");
			} else {
				System.out.println("다른날이군!");
				collection3 = template.getCollection("search_log_" + new Date(currTime - 60 * 10 * 1000).toString());
			}
			break;
		default:
			break;
		}

		String mapFunction = " function() {\r\n" + 
				"						var d = new Date();\r\n" + 
				"                       for (var idx = 0; idx < this.keywords.length; idx++) {\r\n" + 
				"                         if(this.time_line > d - " +term+ " ){\r\n" + 
				"                           var key = this.keywords[idx];\r\n" + 
				"                           \r\n" + 
				"                           var count = \r\n" + 
				"                                          1\r\n" + 
				"                                        \r\n" + 
				"                                       ;\r\n" + 
				"                          \r\n" + 
				"                           emit(key, count);\r\n" + 
				"                         }\r\n" + 
				"                       }\r\n" + 
				"                    };";
		String reduceFunction = " function(keySKU, countObjVals) {\r\n" + 
				"                     reducedVal = 0;\r\n" + 
				"\r\n" + 
				"                     for (var idx = 0; idx < countObjVals.length; idx++) {\r\n" + 
				"                         reducedVal += countObjVals[idx];\r\n" + 
				"                          \r\n" + 
				"                     }\r\n" + 
				"\r\n" + 
				"                     return reducedVal;\r\n" + 
				"                  };";
		

		// 여기선 맵리듀스를 한번 해주고 그 숫자대로 정렬해여 표시할 것임.
		// Mapreduce 작업을 할 대상은 search_log_ ~.. 에 있는 파일들
		// 단위는 선택 가능하게 할것. 10분,30분, 1시간,등....
		// 혹은 10초 단위로 증가량이 많은 데이터를 출력할 수도 있음
		// 어떻게 하는 것이 좋을것인가.

		DBCollection collection2 = reduceTemplate.getCollection("search_log_reduce_" + date.toString());
		if (collection2 == null) {
			reduceTemplate.createCollection("search_log_reduce_" + date.toString());
		}

		// 이렇게 할 경우. 문제가 발생하는데....
		// 전체 하루동안의 mapreduce 를 하기 위해서는
		// gkskdml collection 을 따로 만들어 주어야 한다.
		MapReduceResults<HashMap> mapReeduceResult = template
				.mapReduce("search_log_" + date.toString(), mapFunction, reduceFunction,
						new MapReduceOptions().outputDatabase("mapReduce")
								.outputCollection("search_log_reduce_" + date.toString()).outputTypeReplace(),
						HashMap.class);
		if (collection3 != null) {
			template
			.mapReduce("search_log_" + new Date(pastTime).toString(), mapFunction, reduceFunction,
					new MapReduceOptions().outputDatabase("mapReduce")
							.outputCollection("search_log_reduce_" + date.toString()).outputTypeMerge(),
					HashMap.class);

		}
		DBCursor redCursor = collection2.find().sort(new BasicDBObject("value", -1)).limit(10);
		System.out.println(redCursor.toString());
		List<Map> result = new ArrayList<>();
		List<DBObject> resultList = redCursor.toArray();
		for (DBObject obj : resultList) {
			result.add(obj.toMap());
			System.out.println("아시밤쾅");
			System.out.println(obj.toString());
		}
		System.out.println(result.toString());
		return result;
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
 		System.out.println(results.hashCode());
		System.out.println(results.getCounts());

		for (ReduceObject map1 : results) {
			System.out.println(map1.toString());
		}

		 

	}

}
