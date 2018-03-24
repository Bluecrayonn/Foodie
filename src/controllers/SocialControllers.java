package controllers;

import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import models.social.SocialAddImpl;
import models.social.SocialInfoImpl;

/*
 * RequestParam 부분은 시험을 위해서 지정해놓은 부분. 
 * 따라서 최종 버전에서는 올바른 형태로 고쳐주어야 한다.
 * 바꿀 필요가 없다면 바꾸지 않아도 상관없다.
 * 
 */
@Controller
@RequestMapping("/social")
public class SocialControllers {

	@Autowired
	SocialAddImpl followadd;
	@Autowired
	SocialInfoImpl socialInfo;

	Gson gson = new Gson();

	@RequestMapping("/addFollow.do")
	@ResponseBody
	public String followHandle(@RequestParam Map<String, Object> map) {

		followadd.addFollowing(Long.parseLong((String) map.get("targetId")),
				Long.parseLong((String) map.get("ownerId")));

		return "";
	}

	@RequestMapping("/addFollowRDB.do")
	@ResponseBody
	public String followAddHandle(@RequestParam Map<String, Object> map) {

		followadd.addFollowingRDB(map);
		followadd.addFollowingCountUpRDB((String) map.get("targetId"));
		followadd.addFollowing(Long.parseLong((String) map.get("targetId")),
				Long.parseLong((String) map.get("ownerId")));

		return "";
	}

	@RequestMapping("/removeFollowRDB.do")
	@ResponseBody
	public String followRemoveHandle(@RequestParam Map<String, Object> map) {

		followadd.removeFollowingRDB(map);
		followadd.addFollowingCountDownRDB((String) map.get("targetId"));
		followadd.removeFollowing(Long.parseLong((String) map.get("targetId")),
				Long.parseLong((String) map.get("ownerId")));

		return "";
	}

	
	@RequestMapping("/addBookmarkRDB.do")
	@ResponseBody
	public String BookmarkAddHandle(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		String postId = (String) map.get("postId");
		BigDecimal bigdecimal = (BigDecimal) ((Map) req.getSession().getAttribute("auth")).get("ACCOUNT_ID");
		int accountId = bigdecimal.intValue();
		System.out.println("[[BookmarkAddHandler] : received postID : "+postId);
		
		List<Map> bookmarks = socialInfo.getBookmarks(accountId);
		map.put("userId", accountId);
		for (Map map1 : bookmarks) {
			System.out.println("[BookmarkAddHandler] : "+map1.get("POST_ID"));
			System.out.println("[BookmarkAddHandler] : "+map1.get("POST_ID").getClass().toString());
			
			if ((long)map1.get("POST_ID")==Long.parseLong(postId)) {
				System.out.println("[BookmarkAddHandler] : "+map1.get("POST_ID") + "already exists");
				followadd.removeBookmarksRDB(map);
				followadd.bookMarkCountDownRDB((String) map.get("postId"));
				return "removedone";
			}
		}

		System.out.println("[BookmarkAddhandle]" + map.toString());
		
		followadd.addBookmarksRDB(map);
		followadd.bookMarkCountUpRDB(postId);

		return "adddone";
	}

	
	@RequestMapping("/removeBookmarkRDB.do")
	@ResponseBody
	public String BookmarkRemoveHandle(@RequestParam Map<String, Object> map) {

		followadd.removeBookmarksRDB(map);
		followadd.bookMarkCountDownRDB((String) map.get("postId"));
		return "";
	}

	// List 불러오는 구간입니다.
	// return 은 json 으로 변환해서 올릴 예정 입니다.

	
	@RequestMapping("/followingList.do")
	@ResponseBody
	public String followingListHandler(@RequestParam Map<String, Object> map) {

		List<Map> result = socialInfo.getFollowing(Long.parseLong((String) map.get("ownerId")));
		Map count = new HashMap<>();
		count.put("totalCount", result.size());
		result.add(count);

		return gson.toJson(result);
	}

	@RequestMapping("/followerList.do")
	@ResponseBody
	public String followerListHandler(@RequestParam Map<String, Object> map) {

		List<Map> result = socialInfo.getFollower(Long.parseLong((String) map.get("targetId")));
		Map count = new HashMap<>();
		count.put("totalCount", result.size());
		result.add(count);

		return gson.toJson(result);
	}

	@RequestMapping("/bookmarkList.do")
	@ResponseBody
	public String BookmarkListHandler(HttpServletRequest req) {
		HttpSession session = req.getSession();

		if (session.getAttribute("auth") == null)
			return "fail";

		System.out.println(((Map) session.getAttribute("auth")).get("ACCOUNT_ID") instanceof Long);

		BigDecimal bigdecimal = (BigDecimal) ((Map) session.getAttribute("auth")).get("ACCOUNT_ID");
		long ownerId = bigdecimal.longValue();
		List<Map> result = socialInfo.getBookmarks(ownerId);

		Map count = new HashMap<>();
		count.put("totalCount", result.size());
		result.add(count);

		return gson.toJson(result);
	}

}
