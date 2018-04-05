package controllers;

import java.io.IOException;
import java.security.Timestamp;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mongodb.WriteResult;

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

	@RequestMapping({"/main.do","/index.do"})
	public String mainpage(HttpServletRequest req, Map map) throws IOException {
		gson = new Gson();

		req.setAttribute("postList", postlist.getAllPostList());
		postlist.ingreMapreduce();
		return "mainpage";
	}

	@RequestMapping("/search.do")
	public String search(HttpServletRequest req, @RequestParam Map<String, String> map) {
		HttpSession session = req.getSession();
		SimpleDateFormat simple = new SimpleDateFormat("YYYY");
		
		int age = Integer.parseInt(simple.format(new Date(System.currentTimeMillis())));
		if ((session.getAttribute("auth")) != null && ((Map) session.getAttribute("auth")).get("BIRTH")!=null )
			age = (int) (((Map) session.getAttribute("auth")).get("BIRTH"));
		String gender = "U";
		if ((session.getAttribute("auth")) != null && ((Map) session.getAttribute("auth")).get("GENDER")!=null)
			gender = (String) (((Map) session.getAttribute("auth")).get("GENDER"));

		postlist.serchListUpdate(map, gender, age);
		;
		req.setAttribute("postList", postlist.searchPostList(map));

		return "mainpage";
	}

	@RequestMapping(path = "/keywordlist.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String keywordList(@RequestParam String term) {

		gson = new Gson();

		return gson.toJson(postlist.recentSearchKeywords(term));

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
		map.put("ingredient", ingredientDao.getIngredientById(pid));
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

	@RequestMapping("/dropout.do")
	public String dropoutpage() {
		return "dropoutpage";
	}
}