package controllers;






import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import models.FoodieMember;
import models.FoodieMemberMapper;

@Controller
@SessionAttributes("foodieMember") // 수정하고자하는 객체가 foodieMember
// 수정처리에서 왔다갔다 하는 과정에서 데이터를 보호하기 위해 @SessionAttrinbutes 어노테이션을 사용함
public class FoodieMemberController {

	@Autowired
	FoodieMemberMapper foodieMemberService; // 서비스 객체
	// 의존성을 낮추기위해 타입을 FoodieMemberMapper로 불러오고 실제 사용하는건 services패키지에 있는
	// FoodieMemberImpl
//
	@RequestMapping("/inputForm.do")
	public String insetMember(Model model) {
		model.addAttribute("foodieMember", new FoodieMember());
		// chap04_spring_mvc 수업
		// controllers.args -> AlphaController 중 Model, Map, ModelMap 참고
		return "inputForm";

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
	public String insertOk(@Valid FoodieMember foodieMember, BindingResult result) {

		// JPA @Valid 어노테이션을 통해 유효성체크하고 에러가 있으면 BindingResult를 이용하여 처리

		if (result.hasErrors()) { // FoodieMember에 존재하는 여러개의 필드를 모두 검사함
			System.out.println("회원가입 과정에서 에러가 발생하였습니다.");
			return "inputForm";
		} else {
			foodieMemberService.insertMember(foodieMember);
			// 에러가 없으면 DB에 저장
			return "joinOk";

		}
	}

	

//여기가 회원탈퇴 index
	@RequestMapping("/deleteMember.do")
	public void deleteMember(Model model) {
		model.addAttribute("foodieMember", new FoodieMember());
	}

	
	

		@RequestMapping(value = "/dlMember.do", method = RequestMethod.GET)
		public String deleteMember(@ModelAttribute FoodieMember foodieMember, @RequestParam("nickname") String nickname, Model model) 
				throws Exception{
			
			if (foodieMemberService.getMember(nickname) != null) {
				model.addAttribute("foodieMember", foodieMemberService.getMember(nickname));
		
				
				return "redirect://deleteOk.do";
				//return "sendOk";
				// view를 통해 컨트롤러에 있는 다른메소드로 넘어가는 기존의 방법 대신에
				// 리다이렉트를 통해 직접 이동하게 변경 ( sendOk.jsp 삭제)

			} else { 
				return "deleteFail";
			}

		}

	 



	@RequestMapping("/deleteSend.do")
	public String send() {

		// 삭제버튼을 누를시 해당 닉네임이 존재하지 않으면 deleteFail.jsp에서 경고창을 띄우고 다시
		// 회원삭제창(deleteMember.jsp)로 이동하기 위함
		return "deleteMember";
	}

	@RequestMapping("/deleteOk.do") //유효성 체크 
	public String deleteOk(@Valid FoodieMember foodieMember, BindingResult result) {
		if (result.getFieldErrorCount(foodieMember.getNickname()) > 0) {
			System.out.println("회원탈퇴 과정에서 오류가 발생하였습니다.");
		
		return "deleteMember"; 
	}else{ //실제로 회원삭제 처리하는 부분
		foodieMemberService.deleteMember(foodieMember.getNickname());
		return "deleteOk";
		
	}
}

}