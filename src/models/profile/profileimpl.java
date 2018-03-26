package models.profile;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import models.ProfileListDao;
import models.postListDAO;

public class profileimpl implements ProfileListDao {

	@Autowired
	SqlSessionFactory factory;
	
	@Override
	public List<Map> getRecipeidList() {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.recipetitle");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}
