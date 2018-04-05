package models.post;

import java.io.IOException;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.MapReduceOptions;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
 import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
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
	@Qualifier("basic")
	MongoTemplate template;

	@Autowired
	@Qualifier("reduce")
	MongoTemplate reduceTemplate;

	public String keywordParser(String keywords) {
 
		String[] array = keywords.split(" ");
		String result = "";

		for (int cnt = 0; cnt < array.length; cnt++) {

			result += array[cnt];
			if (cnt < array.length - 1)
				result += "|";
		}
 
		return result;
	}

	public List<Map> searchPostList(Map map) {
		

		SqlSession session = factory.openSession();
		String[] keywordArray = ((String) map.get("keywords")).split(" ");
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

 		try {
 
			List<Map> result = session.selectList("social.searchPost", map);

 			return result;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;
	}

	public void serchListUpdate(Map map,String gender,int age) {
		map.put("gender",gender);
		map.put("age", age);

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
		keywordMap.put("gender",gender);
		keywordMap.put("age",age);
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
 			} else {
 				collection3 = template
						.getCollection("search_log_" + new Date(pastTime).toString());
			}

			break;
		case "1h":
			term = "60*60*1000";
			pastTime = currTime - 60 * 60 * 1000;
			if (date.toString().equals(new Date(currTime - 60 * 60 * 1000).toString())) {
 			} else {
 				collection3 = template.getCollection("search_log_" + new Date(pastTime).toString());
			}
			break;
		case "30m":
			term = "60*30*1000";
			pastTime = currTime - 60 * 30  * 1000;
			if (date.toString().equals(new Date(currTime - 60 * 30 * 1000).toString())) {
 			} else {
 				collection3 = template.getCollection("search_log_" + new Date(pastTime).toString());
			}
			break;
		case "10m":
			term = "60*10*1000";
			pastTime = currTime - 60 * 10  * 1000;
			if (date.toString().equals(new Date(currTime - 60 * 10 * 1000).toString())) {
 			} else {
 				collection3 = template.getCollection("search_log_" + new Date(currTime - 60 * 10 * 1000).toString());
			}
			break;
		default:
			break;
		}

		String mapFunction = " function() {\r\n" + 
				"   \r\n" + 
				"var d = new Date();"+
				"  \r\n" + 
				" for (var idx in this.keywords ) {\r\n" + 
				" if(this.time_line > d -"+term+" ){"+
				"                           var key = this.keywords[idx];\r\n" + 
				"                           var value = {\r\n" + 
				"                           total : 1,\r\n" + 
				"                           F:0,\r\n" + 
				"                           M:0,\r\n" + 
				"                           U:0,\r\n" + 
				"                           s20:0,\r\n" + 
				"                           s30:0,\r\n" + 
				"                           s40:0,\r\n" + 
				"                           s50:0,\r\n" + 
				"                           s60:0,\r\n" + 
				"                           sUnk:0\r\n" + 
				"\r\n" + 
				"                           };\r\n" + 
				"                           var fullYear = new Date().getFullYear();\r\n" + 
				"                           if(this.gender==\"M\"){\r\n" + 
				"                             value.M = 1;\r\n" + 
				"                           }else if(this.gender==\"F\"){\r\n" + 
				"                             value.F = 1;\r\n" + 
				"                           }else if(this.gender==\"U\"){\r\n" + 
				"                             value.U = 1;\r\n" + 
				"                           }\r\n" + 
				"                           if(fullYear -this.age<20){\r\n" + 
				"                           value.sUnk=1;\r\n" + 
				"                           }else if(fullYear - this.age<30 && fullYear - this.age>=20){\r\n" + 
				"                             value.s20=1;\r\n" + 
				"                           }else if(fullYear - this.age<40 && fullYear - this.age>=30){\r\n" + 
				"                             value.s30=1;\r\n" + 
				"                           }else if(fullYear - this.age<50 && fullYear - this.age>=40){\r\n" + 
				"                             value.s40=1;\r\n" + 
				"                           }else if(fullYear - this.age<60 && fullYear - this.age>=50){\r\n" + 
				"                             value.s50=1;\r\n" + 
				"                           }else{\r\n" + 
				"                             value.s60=1;\r\n" + 
				"                           }\r\n" + 
				"                           emit(key, value);\r\n" + 
				"}"+
				"                       };\r\n" + 
				"  \r\n" + 
				"   \r\n" + 
				"                        \r\n" + 
				" \r\n" + 
				"  \r\n" + 
				"  \r\n" + 
				"                      \r\n" + 
				"                    };";
		String reduceFunction = "function(key, countObjVals) {\r\n" + 
				"                    var reducedVal =  {\r\n" + 
				"                           total : 0,\r\n" + 
				"                           F:0,\r\n" + 
				"                           M:0,	\r\n" + 
				"                           U:0,\r\n" + 
				"                           s20:0,\r\n" + 
				"                           s30:0,\r\n" + 
				"                           s40:0,\r\n" + 
				"                           s50:0,\r\n" + 
				"                           s60:0,\r\n" + 
				"                           sUnk:0\r\n" + 
				"                           };\r\n" + 
				"                     for (var idx = 0; idx < countObjVals.length; idx++) {\r\n" + 
				"                         reducedVal.total  += countObjVals[idx].total ;\r\n" + 
				"                         reducedVal.F  += countObjVals[idx].F ;\r\n" + 
				"                         reducedVal.M  += countObjVals[idx].M ;\r\n" + 
				"                         reducedVal.U  += countObjVals[idx].U ;\r\n" + 
				"                         \r\n" + 
				"                         reducedVal.s20  += countObjVals[idx].s20 ;\r\n" + 
				"                         reducedVal.s30  += countObjVals[idx].s30 ;\r\n" + 
				"                         reducedVal.s40  += countObjVals[idx].s40 ;\r\n" + 
				"                         reducedVal.s50  += countObjVals[idx].s50 ;\r\n" + 
				"                         reducedVal.s60  += countObjVals[idx].s60 ;\r\n" + 
				"                         reducedVal.sUnk  += countObjVals[idx].sUnk ;\r\n" + 
				"                          \r\n" + 
				"                     };\r\n" + 
				"\r\n" + 
				"                     return reducedVal;\r\n" + 
				"                  };   ";
		

		// 여기선 맵리듀스를 한번 해주고 그 숫자대로 정렬해여 표시할 것임.
		// Mapreduce 작업을 할 대상은 search_log_ ~.. 에 있는 파일들
		// 단위는 선택 가능하게 할것. 10분,30분, 1시간,등....
		// 혹은 10초 단위로 증가량이 많은 데이터를 출력할 수도 있음
		// 어떻게 하는 것이 좋을것인가.
		if(reduceTemplate.getCollection("search_log_reduce_tot_" + date.toString())==null) {
			reduceTemplate.createCollection("search_log_reduce_tot_" + date.toString());
		}
		if(reduceTemplate.getCollection("search_log_reduce_temp_" + date.toString())==null) {
			reduceTemplate.createCollection("search_log_reduce_temp_" + date.toString());
		}

		DBCollection collection2_temp = reduceTemplate.getCollection("search_log_reduce_temp_" + date.toString());
		
		if (collection2_temp == null) {
			reduceTemplate.createCollection("search_log_reduce_" + date.toString());
		}

		// 이렇게 할 경우. 문제가 발생하는데....
		// 전체 하루동안의 mapreduce 를 하기 위해서는
		// gkskdml collection 을 따로 만들어 주어야 한다.
		MapReduceResults<HashMap> mapReeduceResult = template
				.mapReduce("search_log_" + date.toString(), mapFunction, reduceFunction,
						new MapReduceOptions().outputDatabase("mapReduce")
								.outputCollection("search_log_reduce_temp_" + date.toString()).outputTypeReplace(),
						HashMap.class);
		template
		.mapReduce("search_log_" + date.toString(), mapFunction, reduceFunction,
				new MapReduceOptions().outputDatabase("mapReduce")
						.outputCollection("search_log_reduce_tot_" + date.toString()).outputTypeMerge(),
				HashMap.class);
		if (collection3 != null) {
			template
			.mapReduce("search_log_" + new Date(pastTime).toString(), mapFunction, reduceFunction,
					new MapReduceOptions().outputDatabase("mapReduce")
							.outputCollection("search_log_reduce_temp_" + date.toString()).outputTypeMerge(),
					HashMap.class);
			template
			.mapReduce("search_log_" + new Date(pastTime).toString(), mapFunction, reduceFunction,
					new MapReduceOptions().outputDatabase("mapReduce")
							.outputCollection("search_log_reduce_tot_" + date.toString()).outputTypeMerge(),
					HashMap.class);

		}
		DBCursor redCursor = collection2_temp.find().sort(new BasicDBObject("value", -1)).limit(10);
		System.out.println(redCursor.toString());
		List<Map> result = new ArrayList<>();
		List<DBObject> resultList = redCursor.toArray();
		for (DBObject obj : resultList) {
			result.add(obj.toMap());
 			System.out.println(obj.toString());
		}
		System.out.println(result.toString());
		return result;
	}

	@Override
	public List<Map> getAllPostList() {
		SqlSession session = factory.openSession();

		try {
  
			List<Map> result = session.selectList("social.getPost");

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
 	 

		 

		 

	}

}
