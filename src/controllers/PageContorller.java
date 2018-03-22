package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/foodie")
public class PageContorller {
	
	@RequestMapping("/main.do")
	public String mainpage() {
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
	@RequestMapping("/detail.do")
	public String searchpage() {
		return "searchpage";
	}
	@RequestMapping("/detailrecipe.do")
	public String detailpage() {
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