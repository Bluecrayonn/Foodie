package controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import models.follow.SocialAddImpl;

@Controller
@RequestMapping("/social")
public class SocialControllers {
	
	@Autowired
	SocialAddImpl followadd;

	@RequestMapping("/addFollow.do")
	@ResponseBody
	public String followHandle(@RequestParam Map<String,Object> map) {
		
		 
		followadd.addFollowing(Long.parseLong((String)map.get("targetId")), Long.parseLong((String) map.get("ownerId")));
		
		
		return "";
	}
	
	
	
	
	@RequestMapping("/addFollowRDB.do")
	@ResponseBody
	public String followAddHandle(@RequestParam Map<String,Object> map) {
		
		 
 		followadd.addFollowingRDB(map);
		
		return "";
	}
	@RequestMapping("/removeFollowRDB.do")
	@ResponseBody
	public String followRemoveHandle(@RequestParam Map<String,Object> map) {
		
		 
 		followadd.removeFollowingRDB(map);
		
		return "";
	}
	@RequestMapping("/addBookmarkRDB.do")
	@ResponseBody
	public String BookmarkAddHandle(@RequestParam Map<String,Object> map) {
		
		 
 		followadd.addBookmarksRDB(map);
		
		return "";
	}
	@RequestMapping("/removeBookmarkRDB.do")
	@ResponseBody
	public String BookmarkRemoveHandle(@RequestParam Map<String,Object> map) {
		
		 
 		followadd.removeBookmarksRDB(map);
		
		return "";
	}
	
	
}
