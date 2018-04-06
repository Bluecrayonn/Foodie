package models.profile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public List<Map> getBookmarkidList(long userId) {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.bookmarktitle",userId);
 			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Map> getFollowingidList(long userId) {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.Followingtitle",userId);
 			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Map> getFolloweridList(long userId) {
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.Followertitle",userId);
 			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	public String profileImgChange(HttpServletRequest request, MultipartFile f,long userId) throws IllegalStateException, IOException {
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + File.separator + "profile_image";
		String orgFileName = f.getOriginalFilename();
		int lastIdx = orgFileName.lastIndexOf('.');
		String extension = orgFileName.substring(lastIdx, orgFileName.length());
		String dest = uploadPath + "/" + String.valueOf(System.currentTimeMillis()) + extension;
		File target = new File(dest);
		f.transferTo(target);
		
		
		HashMap hs = new HashMap<>();
		hs.put("profile_img", target.getName());
		hs.put("account_id",userId);
		
		
		SqlSession session = factory.openSession();
		try {
			List<Map> result = session.selectList("profile.profileimgchange",hs);
 		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return target.getName();
	}
}
