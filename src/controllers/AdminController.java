package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import models.AdminDAO;

@Controller
@RequestMapping("/administ")
public class AdminController {

	@Autowired
	AdminDAO admin;
	
	Gson gson;
	
	@RequestMapping(path="/ages.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String ageKeywordHandler(@RequestParam String keywords) {
		
		
		gson = new Gson();

		return  gson.toJson(admin.genderReduce(keywords));
	}
	
	
	
	
	@RequestMapping(path="/genders.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String genderKeywordHandler(@RequestParam String keywords) {
		
	 
		gson = new Gson();

		return  gson.toJson(admin.genderReduce(keywords));
	}
	@RequestMapping(path="/weekkeywords.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String keywordDistinctHandler() {
		
		gson = new Gson();

		return gson.toJson(admin.keywordDistinct());
	}
}
