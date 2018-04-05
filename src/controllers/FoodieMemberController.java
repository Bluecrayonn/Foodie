package controllers;

import java.util.Map;



import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import models.FoodieMember;
import models.FoodieMemberMapper;
import models.login.LoginImpl;
import services.FoodieMemberImpl;

@Controller
@RequestMapping("/account")
public class FoodieMemberController {

	@Autowired
	LoginImpl loginimpl;
	@Autowired
	FoodieMemberMapper foodieMemberService; // 서비스 객체
	// 의존성을 낮추기위해 타입을 FoodieMemberMapper로 불러오고 실제 사용하는건 services패키지에 있는
	// FoodieMemberImpl
	@Autowired
	FoodieMemberImpl foodimemberimpl;

	@RequestMapping("/inputForm.do")
	public String insetMember(Model model) {
		model.addAttribute("foodieMember", new FoodieMember());
		// chap04_spring_mvc 수업
		// controllers.args -> AlphaController 중 Model, Map, ModelMap 참고
		return "inputForm";

	}

	@RequestMapping("/emailcheck.do")
	@ResponseBody
	public String emailCheckHandler(@RequestParam String email) {
		// chap04_spring_mvc 수업
		// controllers.args -> AlphaController 중 Model, Map, ModelMap 참고
		int result_email = loginimpl.emailCheck(email);
		String result = null;
		if(result_email==2) {
			result="exists";
		}else if(result_email ==1) {
			result="possible";
		}
		return result;

	}

	@RequestMapping("/welcome.do")
	public String welcomeHandler() {
		// chap04_spring_mvc 수업
		// controllers.args -> AlphaController 중 Model, Map, ModelMap 참고
		return "welcome";

	}

	/*
	 * FoodieMember foodiedMember = new FoodieMember();
	 * foodiedMember.setEmail((String)model.get("email"));
	 * foodiedMember.setNickname((String)model.get("password"));
	 * foodiedMember.setPwd((String)model.get("nick"));
	 * 
	 * foodieMemberService.insertMember(foodiedMember); return "inputForm";
	 */

	// model.addAttribute("foodieMember", new FoodieMember());

	// foodieMember객체가 submit을 통해 /inserOk (inputForm.jsp)으로 넘어감
	// 이때 foodieMember객체를 유효성체크하고 그 결과를 BindingResult에서 처리함

	@RequestMapping("/insertOk.do")
	public String insertOk(@ModelAttribute @Valid FoodieMember foodieMember, BindingResult result) {

		// JPA @Valid 어노테이션을 통해 유효성체크하고 에러가 있으면 BindingResult를 이용하여 처리
		
		if (result.hasErrors()) {
			System.out.println("회원가입 과정에서 에러가 발생하였습니다.");
			return "redirect:/foodie/main.do";
		} else {
			foodieMemberService.insertMember(foodieMember);
			// 에러가 없으면 DB에 저장
			return "welcomepage";

		}
		
	}
	//이거는 패스워드찾기
	@RequestMapping("/passwordFind.do")
	@ResponseBody
	public String passwordFindHandler(@RequestParam Map map) {
		
		String email = (String)map.get("email");
		String newPassword = (String)map.get("new-password");
		
		//여기서 DAO 가서 하는거 만들거임
		String result =foodimemberimpl.resetPassword(email, newPassword);
	
		return result;
	}
	
	//여기는 기존의 패스워드 바꾸는 곳임
	//
	@RequestMapping("/passwordRenew.do")
	public String passwordRenewHandler(@RequestParam Map map) {

	
		return null;
	}

	/*
	 * @RequestMapping("/modifyMember/{nickname}") //get방식으로 파라미터를 얻어오는 것이 아니라 스프링에서
	 * 제공하는 방법으로 nickname값을 얻어옴 public String modifyMember(@PathVariable String
	 * nickname, Model model) { //PathVariable 어노테이션을 이용하여 nickname값을 인자로 받아 model에
	 * 넘겨줌 model.addAttribute("foodieMember", foodieMemberService);
	 * //FoodieMemberMapper 클래스의 변수명인 foodieMemberService를 값으로 foodieMember를 이름으로 해서
	 * 모델객체로 넘김 }
	 */

}
