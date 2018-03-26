package controllers;

 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

import models.social.SocialInfoImpl;
import services.login.LoginService;

@Controller
@RequestMapping("/authentication")
public class LoginController {
	
	
	@Autowired
	LoginService loginservice;
	@Autowired
	SocialInfoImpl followInfoImpl;
 	
	Gson gson = new Gson();
	
	
	@RequestMapping(path="/login.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String loginHandler(@RequestParam Map<String, String> map,HttpServletRequest context) {
		
		HttpSession session = context.getSession();
		//계정 email 뽑아오기
 		
		String email=  map.get("email");
		//검사결과 0: 성공 / 1: 아이디없음/2:패스워드 불일치
		int result = loginservice.confirmEmail(map);
		System.out.println("[loginHandler] auth result "+result);
		Map json  = new HashMap<>();
		
		if(result==0) {
			
 			session.setAttribute("auth", loginservice.setAuth(email));
 			
	 		System.out.println(map.toString());
		}
		
		json.put("auth", result);
		
		return gson.toJson(json);
		
	}
	
	@RequestMapping("logout.do")
	public String logoutHandler(HttpServletRequest   context) {
		
		
		
		context.getSession().removeAttribute("auth");
		
		//이부분에는 메인화면의 tiles 좌표가 들어갑니다.
		return "redirect:/foodie/main.do";
	}

	
	/*@RequestMapping("/dummy.do")
	public void dummyHandler(HttpServletRequest context)	{
		System.out.println(context.getSession().getAttribute("super"));
	}*/

}
