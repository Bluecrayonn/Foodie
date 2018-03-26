package controllers;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import models.IngredientDao;
import models.PostDao;
import models.post.postListImpl;

@Controller
@RequestMapping("/foodie")
public class PageContorller {
	@Autowired
	postListImpl postlist;
	@Autowired
	PostDao postDao;
	@Autowired
	IngredientDao ingredientDao;
	Gson gson;
	@RequestMapping("/main.do")
	public String mainpage(HttpServletRequest req,Map map) {
		gson = new Gson();
		
		req.setAttribute("postList", postlist.getAllPostList( ));
		return "mainpage";
	}
	@RequestMapping("/search.do")
	public String search(HttpServletRequest req,@RequestParam Map<String,String> map)	{
		req.setAttribute("postList", postlist.searchPostList(map));
		return "mainpage";
	}
	@RequestMapping("/welcome.do")
	public String welcomepage() {
		return "welcomepage";
	}
	@RequestMapping("/profile.do")
	public String profilepage() {
		return "profilepage";
	}
	@RequestMapping("/profilemodify.do")
	public String profilemodifypage() {
		return "profilemodifypage";
	}
	
	// 진입시 parameter로 post_id를 넣어줍니다.
	@RequestMapping("/detail.do")
	public String detailpage(@RequestParam int pid, ModelMap map) {
		map.put("post", postDao.getOnePost(pid));
		map.put("ingredient",ingredientDao.getIngredientById(pid));
		System.out.println(ingredientDao.getIngredientById(pid));
		return "detailpage";
	}
	@RequestMapping("/writerecipe.do")
	public String writerecipepage() {
		return "detailpage";
	}
	@RequestMapping("pwreset.do")
		public String pwresetpage() {
			return "pwresetpage";
		}
	@RequestMapping("admin.do")
	public String adminpage() {
		return "adminpage";
	}
}