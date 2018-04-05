package controllers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
 import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import models.PostDao;
import models.profile.profileimpl;

@Controller
@RequestMapping("/profile")
public class RecipeController {
	@Autowired
	profileimpl profileimpl;
	Gson gson;
	
	@RequestMapping("/profilepage.do") 

	
	public String searchHandle(HttpServletRequest req,@RequestParam Map map) {
		HttpSession session = req.getSession();
		gson = new Gson();
		//((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		//req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return "profilepage";
	}
	
	@RequestMapping(value = "/recipe_List.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String recipeHandle(HttpServletRequest req,@RequestParam Map map) {
		
		HttpSession session = req.getSession();
		
		
		long userId = (long)((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		gson = new Gson();
		//((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		//req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return gson.toJson(profileimpl.getRecipeidList(userId));	
	}
	
	/*@RequestMapping("/comment_List.do")
	@ResponseBody
	public String commentHandle(HttpServletRequest req,@RequestParam Map map) {
		
		HttpSession session = req.getSession();
		gson = new Gson();
		//((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		//req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return gson.toJson(profileimpl.getCommentidList());	
	}*/
	
	@RequestMapping(value = "/bookmark_List.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String bookmarkHandle(HttpServletRequest req,@RequestParam Map map) {
		
		HttpSession session = req.getSession();
		long userId = (long) ((Map) req.getSession().getAttribute("auth")).get("ACCOUNT_ID");
 		gson = new Gson();
		//((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		//req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return gson.toJson(profileimpl.getBookmarkidList(userId));	
	}
	
	@RequestMapping(value = "/following_List.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String followingHandle(HttpServletRequest req,@RequestParam Map map) {
		
		HttpSession session = req.getSession();
		long userId = (long) ((Map) req.getSession().getAttribute("auth")).get("ACCOUNT_ID");

		gson = new Gson();
		//((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		//req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return gson.toJson(profileimpl.getFollowingidList(userId));	
	}
	
	@RequestMapping(value = "/follower_List.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String followerHandle(HttpServletRequest req,@RequestParam Map map) {
		
		HttpSession session = req.getSession();
		long userId = (long) ((Map) req.getSession().getAttribute("auth")).get("ACCOUNT_ID");

		gson = new Gson();
		//((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		//req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return gson.toJson(profileimpl.getFolloweridList(userId));	
	}
	
	@RequestMapping(value="/profileimage.do", method=RequestMethod.POST)
	@ResponseBody
	public String profileImgChangeHandler(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		long userId = (long) ((Map) request.getSession().getAttribute("auth")).get("ACCOUNT_ID");
		Iterator<String> itr = request.getFileNames(); 
		if(itr.hasNext()) { 
			MultipartFile mpf = request.getFile(itr.next());
			String path = profileimpl.profileImgChange(request, mpf, userId);
			((Map) request.getSession().getAttribute("auth")).put("PROFILE_IMG", path);
			System.out.println(path);
		}
		return "success";
	}
	
	
}
