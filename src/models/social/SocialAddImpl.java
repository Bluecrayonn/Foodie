package models.social;

import java.util.List;
import java.util.Map;
 
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;

import models.SocialAddDAO;

//follow list/bookmark 를 rdb 랑 mongo 둘다 사용하는것이 좋지 않을까?
//자주 불러와야 하는 항목인만큼 rbd를 이용하는건 힘들것 같은데 음. 
//배열관리가 가능하기 때문에 자주 불려오는건mongodb에 저장하고 rdb에도 저장하면 될듯 하구만
//저장할때는 $push, 지울때는 $pull 이용할것.
//RDBMS 랑 연계해서 이용하는 이유는 seq로 지정된 아이디를 이용하기 위해서임
//MONGO에서 주는것보다는 나을것 같음. 

@Repository
public class SocialAddImpl implements SocialAddDAO {

	@Autowired
	SqlSessionFactory sqlfactory;
	@Autowired
	MongoTemplate mongoTemplate;

	@Override // ADDFOLLOWING
	public List<Map> addFollowing(long targetId, long ownerId) {

		DBCollection mt = mongoTemplate.getCollection("follow");
		mt.update(new BasicDBObject("ACCOUNT_ID", ownerId),
				new BasicDBObject("$push", new BasicDBObject("TARGET_ID", targetId)));

		return null;
	}

	@Override // REMOVE FOLLOWING
	public List<Map> removeFollowing(long targetId, long ownerId) {
		DBCollection mt = mongoTemplate.getCollection("follow");
		mt.update(new BasicDBObject("ACCOUNT_ID", ownerId),
				new BasicDBObject("$pull", new BasicDBObject("TARGET_ID", targetId)));

		return null;
	}

	@Override // ADD BOOKMARK
	public List<Map> addBookmarks(long postId, long userId) {
		DBCollection mt = mongoTemplate.getCollection("follow");
		mt.update(new BasicDBObject("ACCOUNT_ID", userId),
				new BasicDBObject("$push", new BasicDBObject("BOOKMARK_ID", postId)));
		return null;
	}

	@Override // REMOVE BOOKMARK
	public List<Map> removeBookmarks(long postId, long userId) {
		DBCollection mt = mongoTemplate.getCollection("follow");
		mt.update(new BasicDBObject("ACCOUNT_ID", userId),
				new BasicDBObject("$pull", new BasicDBObject("BOOKMARK_ID", postId)));
		return null;
	}

	@Override
	public int addFollowingRDB(Map map) {
		// map= targetId, ownerId

		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.addFollowing", map);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}

	}
 	public int addFollowingCountUpRDB(Long accountId) {
		// map= targetId, ownerId

		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.countUpFollowing", accountId);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}

	}
	public int addFollowingCountDownRDB(Long accountId) {
		// map= targetId, ownerId

		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.countDownFollowing", accountId);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}

	}

	@Override
	public int removeFollowingRDB(Map map) {
		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.removeFollowing", map);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}
 	}

	@Override
	public int addBookmarksRDB(@RequestParam Map map) {
		//postId , userId
		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.addBookmarks", map);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}
		 
	}

	@Override
	public int removeBookmarksRDB(Map map) {
		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.removeBookmarks", map);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}
 	}
	public int bookMarkCountUpRDB(String postId) {
		// map= targetId, ownerId

		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.countUpBookmark", postId);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}

	}
	public int bookMarkCountDownRDB(String accountId) {
		// map= targetId, ownerId

		SqlSession sqlsession = sqlfactory.openSession();

		try {

			int result = sqlsession.insert("social.countDownBookmark", accountId);
			System.out.println(result);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {

			sqlsession.close();

		}

	}


}
