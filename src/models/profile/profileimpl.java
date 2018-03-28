package models.profile;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import models.ProfileListDao;
import models.postListDAO;

@Repository
public class profileimpl implements ProfileListDao {

	@Autowired
	SqlSessionFactory factory;
	
	@Override
	public List<Map> getRecipeidList(long userId) {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.recipetitle",userId);
			System.out.println(result.toString());
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	/*@Override
	public List<Map> getCommentidList() {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.bookmarktitle");
			System.out.println(result.toString());
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}*/
	
	@Override
	public List<Map> getBookmarkidList() {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.bookmarktitle");
			System.out.println(result.toString());
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Map> getFollowingidList() {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.Followtitle");
			System.out.println(result.toString());
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Map> getFolloweridList() {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.Followtitle");
			System.out.println(result.toString());
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
}
