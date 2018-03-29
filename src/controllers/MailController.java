package controllers;

import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import services.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {
	@Autowired
	MailService mailService;

	@RequestMapping("/enter.do")
	public String accountJoinHandle() {
		return "join";
	}

	@RequestMapping("/check.do")
	public String accountCheckHandle(@RequestParam String key) {
		if (Math.random() > 0.65) {
			return "redirect:/";
		} else {

		}
		return "join";
	}

	/*
	 * @RequestMapping(path="/login.do",produces=
	 * "application/json;charset=utf-8")
	 * 
	 * @ResponseBody public String loginHandler(@RequestParam Map<String,
	 * String> map,HttpServletRequest context) {
	 * 
	 * HttpSession session = context.getSession(); //계정 email 뽑아오기 String email=
	 * map.get("email"); //검사결과 0: 성공 / 1: 아이디없음/2:패스워드 불일치 int result =
	 * loginservice.confirmEmail(map);
	 * System.out.println("[loginHandler] auth result "+result); Map json = new
	 * HashMap<>();
	 * 
	 * if(result==0) {
	 * 
	 * session.setAttribute("auth", loginservice.setAuth(email));
	 * 
	 * System.out.println(map.toString()); }
	 * 
	 * json.put("auth", result);
	 * 
	 * return gson.toJson(json);
	 */

	@RequestMapping(path = "/sendKey.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String accountSendKeyHandle(@RequestParam String email, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String[] uuids = UUID.randomUUID().toString().split("-");
		String key = uuids[0] + "-" + uuids[1];
		boolean result = mailService.sendAuthKey(email, key);

		session.setAttribute("result", key);
		System.out.println("{\"result\":" + key + "}");

		return "{\"result\":" + result + "}";
	}

	@RequestMapping("/resultKey.do")
	@ResponseBody
	public String resultKeyHandle(@RequestParam String authKey, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String result = (String) session.getAttribute("result");
		if (result.equals(authKey)) { // authKey는 sidebar.jsp 스크립트 부분에 변수로 지정해놓음
			System.out.println("인증에 성공하였습니다.");
			return "true";
		} else {
			System.out.println("인증에 실패하였습니다.");
			return "false";
		}
		

	}
}
