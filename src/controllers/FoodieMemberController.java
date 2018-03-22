package controllers;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import models.FoodieMember;
import models.FoodieMemberMapper;





@Controller
@SessionAttributes("foodieMember")
//수정처리에서 왔다갔다 하는 과정에서 데이터를 보호하기 위해 @SessionAttrinbutes 어노테이션을 사용함
public class FoodieMemberController {

	@Autowired
	FoodieMemberMapper foodieMemberService; //서비스 객체
	//의존성을 낮추기위해 타입을 FoodieMemberMapper로 불러오고 실제 사용하는건 services패키지에 있는 FoodieMemberImpl
	
	
	@RequestMapping("/inputForm.do")
	public String insetMember(Model  model) {
			model.addAttribute("foodieMember", new FoodieMember()); 
			//chap04_spring_mvc 수업
			// controllers.args -> AlphaController 중 Model, Map, ModelMap 참고
			return "inputForm";
			
		}
	
		/*FoodieMember foodiedMember = new FoodieMember();
		foodiedMember.setEmail((String)model.get("email"));
		foodiedMember.setNickname((String)model.get("password"));
		foodiedMember.setPwd((String)model.get("nick"));
		
		foodieMemberService.insertMember(foodiedMember);
		return "inputForm";*/
		
		//model.addAttribute("foodieMember", new FoodieMember());
	
	
	
	
	
	
		//foodieMember객체가 submit을 통해 /inserOk (inputForm.jsp)으로 넘어감
		//이때 foodieMember객체를 유효성체크하고 그 결과를 BindingResult에서 처리함
		
	
	@RequestMapping("/insertOk.do")  
	public String insertOk(@Valid FoodieMember foodieMember, BindingResult result ) { 
	 
		//JPA @Valid 어노테이션을 통해 유효성체크하고 에러가 있으면 BindingResult를 이용하여 처리
	
		if(result.hasErrors()) {
			System.out.println("회원가입 과정에서 에러가 발생하였습니다.");
			return "inputForm";   
		}else{
			foodieMemberService.insertMember(foodieMember);
			//에러가 없으면 DB에 저장
			return "joinOk";
	
		}
	}
	
		 
	
	// @RequestMapping을 통해 {nickname}값을 요청을 하면  @PathVariable을 사용하여 String(문자열)인 nickname을 얻어와서 Model 객체를 만듬
	// 이 Model은 foodieMemberService를 변수명으로 하는 FoodieMemberMapper에 존재하는 getMember() 메소드를 통해
	// {nickname} 값이라 적어놓은 해당 nickname 값을 얻어와 model 객체에 담음 
	// 그렇게 되면 modifyForm에서는 이제 foodieMember라고 칭한 model에 담긴 nickname을 얻어올 수 있게 됨
	
	@RequestMapping("/modifyForm.do/{nickname}") 
	//get 방식을 통해 파라미터를불러오는 방법 대신에 spring에서 지원하는 다른방식인 @PathVariable을 사용하여 nickname을 얻어옴
	public String modifyMember(@PathVariable String nickname, Model model){
	//PathVariable 어노테이션을 이용하여 nickname값을 인자로 받아 model에 넘겨줌
	model.addAttribute("foodieMember", foodieMemberService.getMember(nickname));
	// foodieMemberService를 변수명으로 하는 FoodieMemberMapper에 존재하는 getMember() 메소드를 통해
	// {nickname} 값이라 적어놓은 해당 nickname 값을 얻어옴 
	return "modifyForm";
	}
	
	
	//modifyForm에서 submit 버튼을 누르게 되면 action을 통해 modifyOk.jsp로 넘어가게됨
	
	@RequestMapping("/modifyOk.do")
	public String modifyOk(@Valid FoodieMember foodieMember, BindingResult result ) { 
	//form 유효성 체크를 하기 위해 JPA에서 제공하는 @Valid을 사용
		if(result.hasErrors()) {
			System.out.println("회원가입 수정에서 에러가 발생하였습니다.");
			return "modifyForm";   //에러가 발생하면 회원가입 수정으로 이동
		}else{
			foodieMemberService.updateMember(foodieMember); 
			// 에러가 없으면 변수명 foodieMemberService인  FoodieMemberMapper에서 생성해놓은 
			//updateMember() 메소드를 통해 DB에 저장
			return "updateResult";
				
		
			
			
	
		}
	}
}