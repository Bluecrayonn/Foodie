package controllers;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import models.CommentDAO;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	CommentDAO comment;

	Gson gson = new Gson();

	@RequestMapping("/add.do")
	@ResponseBody
	public String addCommentHandler(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		// POST_ID, ACCOUNT_ID, TEXT
		HttpSession session = req.getSession();
		long userId=(long)((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		map.put("uid", userId);

		comment.addComment(map, userId);

		return null;
	}

	@RequestMapping(path = "/get.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getCommentHandler(String pid) {
		long postId = Long.parseLong(pid);

		return gson.toJson(comment.getComment(postId));
	}

	@RequestMapping("/remove.do")
	@ResponseBody
	public String removeCommentHandler() {
		return null;
	}

	@RequestMapping("/edit.do")
	@ResponseBody
	public String editCommentHandler(@RequestParam String pid, 
									 @RequestParam String cid, 
									 @RequestParam String msg) {
		String result = comment.editComment(pid, cid, msg);
		return result;
	}

}
