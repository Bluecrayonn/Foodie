package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import modelsEx.MybatisMember;

@Controller
@RequestMapping("/join")
public class JoinController {

	//@Autowired
	//MybatisMemeberMapper MybatisMemberServie;
	
	@RequestMapping("/inputForm.do")
	public String insetMember(Model model) {
		model.addAttribute("inputMember", new MybatisMember());
		return "inputMember";
		
	}
	@RequestMapping("/inputForm.do")
	public void insetMember1(Model model) {
		model.addAttribute("inputMember", new MybatisMember());
		
	}
	@RequestMapping("/inputForm.do")
	public void insetMembe2r(Model model) {
		model.addAttribute("inputMember", new MybatisMember());
		
	}
	@RequestMapping("/inputForm.do")
	public void insetMembe3r(Model model) {
		model.addAttribute("inputMember", new MybatisMember());
		
	}
	
	
	
	
}
