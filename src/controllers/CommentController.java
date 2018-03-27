package controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import models.CommentDAO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	CommentDAO comment;

	@RequestMapping("/add.do")
	@ResponseBody
	public String addCommentHandler(@RequestParam Map< String, Object> map,HttpServletRequest req) {
		//POST_ID, ACCOUNT_ID, TEXT 
		HttpSession session = req.getSession();
		//long userId=(long) ((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		long userId=1;
		map.put("userId", userId);
		
		comment.addComment(map, userId);

		return null;
	}
	
	@RequestMapping("/edit.do")
	@ResponseBody
	public String editCommentHandler() {
		return null;
	}
	
	
	@RequestMapping("/remove.do")
	@ResponseBody
	public String removeCommentHandler() {
		return null;
	}

}
