package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.MailService;
import models.Email;
//
@Controller
@RequestMapping("/mailForm01.do")

public class MailController01 {
	@Autowired(required = false)
	private MailService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		return "mailForm01";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String send(Email smail, Model d) {
		/*System.out.println("제목:" + smail.getSubject());
		System.out.println("내용:" + smail.getContent());
		System.out.println("수신자:" + smail.getReceiver());*/
		service.sendMail(smail);
		d.addAttribute("isSnd", "Y");
		return "mailForm01";
	}


	/*@RequestMapping(path="/sendKey.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String accountSendKeyHandle(@RequestParam String email) {
		boolean result = joinService.sendAuthKey(email);
		System.out.println("{\"result\":"+result+"}");
		
		return "{\"result\":"+result+"}";
	}*/


}

