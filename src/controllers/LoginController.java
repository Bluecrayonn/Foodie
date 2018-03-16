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

import services.login.LoginService;

@Controller
@RequestMapping("/authentication")
public class LoginController {
	
	
	@Autowired
	LoginService loginservice;
	@Autowired
	Gson gson;
	
	
	@RequestMapping("/login.do")
	@ResponseBody
	public String loginHandler(@RequestParam Map<String, String> map,HttpServletRequest context) {
		
		HttpSession session = context.getSession();
		
		
		int result = loginservice.confirmEmail(map);
		
		Map json  = new HashMap<>();
		
		if(result==0) {
			session.setAttribute("auth", map.get("email"));
	 		System.out.println(map.toString());
		}
		
		json.put("authentication", result);
		
		return gson.toJson(json);
		
		
		
	}
	
	@RequestMapping("logout.do")
	public String logoutHandler(HttpServletRequest   context) {
		
		
		
		context.getSession().removeAttribute("auth");
		
		//이부분에는 메인화면의 tiles 좌표가 들어갑니다.
		return "";
	}
	
	
	/*@RequestMapping("/dummy.do")
	public void dummyHandler(HttpServletRequest context)	{
		System.out.println(context.getSession().getAttribute("super"));
	}*/

}
