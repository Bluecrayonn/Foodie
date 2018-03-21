package models.post;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import models.postListDAO;

@Repository
public class postListImpl implements postListDAO {

	@Autowired
	SqlSessionFactory factory;

	public String keywordParser(String keywords) {
		System.out.println("[postListController] : parsing keywords Array into string");

		String[] array = keywords.split(" ");
		String result = "";

		for (int cnt = 0; cnt < array.length; cnt++) {

			result += array[cnt];
			if (cnt < array.length - 1)
				result += "|";
		}
		System.out.println("[postListController] : parsing result =>"+result);

		return result;
	}

	public List<Map> searchPostList(Map map) {
		SqlSession session = factory.openSession();
		System.out.println(map.toString());
		if (map.get("keywords") != null) {
			String keywords = keywordParser((String) map.get("keywords"));
			map.put("keywords", keywords);
		}
		System.out.println(map.toString());
		try {
			System.out.println("[postListController] :entering try box");

			List<Map> result = session.selectList("social.searchPost",map);

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

}
