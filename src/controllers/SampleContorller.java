package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/foodie")
public class SampleContorller {
	
	
	
	@RequestMapping("/index.do")
	public String sample() {
		return "index";
	}
	@RequestMapping("/main.do")
	public String sample2() {
		return "mainpage";
	}
	@RequestMapping("/profile.do")
	public String sample4() {
		return "profilepage";
	}
}
