package controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import services.MailService;
import models.EmailDTO;
//
@Controller
@RequestMapping("/mail")
public class MailController01 {
	
	@Autowired(required = false)
	private MailService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		return "mailForm01";
	}
	
	
	
	@RequestMapping("/emailauthkey.do")
	@ResponseBody
	public String sendAuthKey(@ModelAttribute EmailDTO smail, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String result = service.sendAuthMail(smail);
		if(result.equals("sendfail")) {
			return "sendfail";
			
		}else {
			String authkey = result.split(":")[1];
			String email = result.split(":")[2];
			session.setAttribute("emailAuth:"+email,authkey);
			return "sendsucc";
		}
		
		
 	}
	@RequestMapping(path="/emailauthkeyconfirm.do",produces="application/plain;charset=utf-8")
	@ResponseBody
	public String confirmAuthKey(@RequestParam Map<String,String> map,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String sessionAuth = (String) session.getAttribute("emailAuth:"+map.get("email"));
 		String receivedAuth = map.get("authKey");
		boolean result = service.checkAuthMail(sessionAuth, receivedAuth);
		if(result) {
			return "confirmOk";
		}else {
			return "confirmFail";
		}
		
		
 	}

	/*@RequestMapping(method = RequestMethod.POST)
	public String send(EmailDTO smail, Model d) {
		System.out.println("제목:" + smail.getSubject());
		System.out.println("내용:" + smail.getContent());
		System.out.println("수신자:" + smail.getReceiver());
		service.sendAuthMail(smail);
		d.addAttribute("isSnd", "Y");
		return "mailForm01";
	}*/
}
