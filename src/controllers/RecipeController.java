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

import com.google.gson.Gson;

import models.PostDao;
import models.profile.profileimpl;

@Controller
@RequestMapping("/profile")
public class RecipeController {
	@Autowired
	profileimpl profileimpl;
	Gson gson;
	
	@RequestMapping("/recipe_List.do") 
	public String searchHandle(HttpServletRequest req,@RequestParam Map map) {
		HttpSession session = req.getSession();
		((Map)session.getAttribute("auth")).get("ACCOUNT_ID");
		req.setAttribute("profilelist", profileimpl.getRecipeidList());
		return "profilepage";
	}
}
