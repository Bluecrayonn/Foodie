package controllers;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(path="/recipe_List.do",produces="/charset=utf-8")
	@ResponseBody
	public String ListHandle(HttpServletRequest req,@RequestParam Map map) {
		HttpSession session = req.getSession();
		gson = new Gson();
		//((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		//req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return gson.toJson(profileimpl.getRecipeidList());	
	}
}
