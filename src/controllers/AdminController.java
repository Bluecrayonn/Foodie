package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import models.AdminDAO;

@Controller
@RequestMapping("/administ")
public class AdminController {

	@Autowired
	AdminDAO admin;
	
	@RequestMapping("/ages.do")
	public String ageKeywordHandler(@RequestParam int ages) {
		
		admin.genderReduce();
		return  "mainpage";
	}
}
