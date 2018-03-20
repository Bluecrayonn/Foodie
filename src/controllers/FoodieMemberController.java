package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import models.FoodieMember;
import models.FoodieMemberMapper;


@Controller
@RequestMapping("/join")
public class FoodieMemberController {

	@Autowired
	FoodieMemberMapper foodieMemberService; //서비스 객체
	//의존성을 낮추기위해 타입을 FoodieMemberMapper로 불러오고 실제 사용하는건 services패키지에 있는 FoodieMemberImpl
	
	
	@RequestMapping("/inputForm.do")
	public String insetMember(Model model) {
		model.addAttribute("inputMember", new FoodieMember());
		return "inputMember";
		
	}
	
	@RequestMapping("/insertOk")
	public String insertOk(@Valid FoodieMember foodieMember, BindingResult result ) {
	 
		//JPA @Valid 어노테이션을 통해 유효성체크하고 에러가 있으면 BindingResultUtils를 이용하여 처리
	
		if(result.hasErrors()) {
			System.out.println("회원가입 과정에서 에러가 발생하였습니다.");
			return "redirect:inputForm";
		}else{
			foodieMemberService.insertMember(foodieMember);
			//에러가 없으면 DB에 저장
			return "joinOk";
	
	}
	
	
	}
}
