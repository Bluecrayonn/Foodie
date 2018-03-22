package controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import models.post.postListImpl;

 

@Controller
@RequestMapping("/foodie")
public class SampleContorller {
	
	@Autowired
	postListImpl postlist;
	
	Gson gson;
	 
	@RequestMapping("/main.do")
	public String mainpage(HttpServletRequest req,Map map) {
		gson = new Gson();
		
		req.setAttribute("postList", postlist.getAllPostList( ));
		return "mainpage";
	}
	
	@RequestMapping("/search.do")
	public String search(HttpServletRequest req,@RequestParam Map<String,String> map)	{
		System.out.println(map);
		System.out.println(map);
		req.setAttribute("postList", postlist.searchPostList(map));
		
		
		return "mainpage";
	}
	
	@RequestMapping("/join.do")
	public String joinpage() {
		return "joinpage";
	}
	@RequestMapping("/detail.do")
	public String detailpage() {
		return "detailpage";
	}
	@RequestMapping("/profile.do")
	public String profilepage() {
		return "profilepage";
	}
}
