package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import models.FoodieMemberMapper;

@Controller
@RequestMapping("/join")
public class FoodieMemberController {

	FoodieMemberMapper foodieMemberService;
	
}
