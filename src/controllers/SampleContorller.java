package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/foodie")
public class SampleContorller {
	
	@RequestMapping("/main.do")
	public String mainpage() {
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
