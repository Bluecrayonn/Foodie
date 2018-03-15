package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class SampleContorller {
	
	
	
	@RequestMapping("/index.do")
	public String sample() {
		return "index";
	}
	@RequestMapping("/index2.do")
	public String sample2() {
		return "sample_index";
	}
	@RequestMapping("/main.do")
	public String sample3() {
		return "main";
	}
	@RequestMapping("/profile.do")
	public String sample4() {
		return "profile";
	}
}
