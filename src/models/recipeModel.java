package models;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class recipeModel {

	@Autowired
	SqlSessionFactory factory;

	public List<Map> recipeList(long userId) {

		SqlSession session = factory.openSession();
		
		

		try {
			
			List<Map> result = session.selectList("profile.recipe", userId);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return null;

	}

}
