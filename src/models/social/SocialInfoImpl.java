package models.social;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import models.SocialInfoDAO;

@Repository
public class SocialInfoImpl implements SocialInfoDAO{

	@Autowired
	SqlSessionFactory sqlFactory;
	
	
	@Override
	public List<Map> getFollower(long accountId) {
		System.out.println("getFollwer : received accountId : "+accountId);
		
		SqlSession sqlsession = sqlFactory.openSession();
		try {
			return  sqlsession.selectList("social.follower", accountId);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			sqlsession.close();
 		}
		return null;
 		
	}

	@Override
	public List<Map> getFollowing(long accountId) {
		System.out.println("getFollewee : received accountId : "+accountId);
		SqlSession sqlsession = sqlFactory.openSession();
		try {
			return  sqlsession.selectList("social.following", accountId);
		}catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			sqlsession.close();
 		}
		return null;
	}

	@Override
	public List<Map> getBookmarks(long accountId) {
		System.out.println("getBookmarks : received accountId : "+accountId);
		SqlSession sqlsession = sqlFactory.openSession();
		try {
			return  sqlsession.selectList("social.bookmarks", accountId);
		}catch(Exception e) {
			e.printStackTrace();
			
		} finally {
			sqlsession.close();
 		}
		return null;
	}

}
