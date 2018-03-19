package controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import models.follow.FollowAddImpl;

@Controller
@RequestMapping("/social")
public class FollowControllers {
	
	@Autowired
	FollowAddImpl followadd;

	@RequestMapping("/addFollow.do")
	@ResponseBody
	public String followHandle(@RequestParam Map<String,Object> map) {
		
		 
		followadd.addFollowing(Long.parseLong((String)map.get("targetId")), Long.parseLong((String) map.get("ownerId")));
		
		
		return "";
	}
	
	
	
}
