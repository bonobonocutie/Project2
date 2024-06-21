package com.exam.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.exam.dto.MemberDTO;
import com.exam.service.MemberService;

@Controller
@SessionAttributes(names= {"login"})
public class LoginController {
	
	MemberService memberService;
	
	public LoginController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping(value={"/login"})
	public String loginForm() {
		return "loginForm";
	}
	
//	@PostMapping(value={"/login"})
//	public String login(@RequestParam Map<String, String> m,
//						ModelMap model) {
//		
//		MemberDTO dto = memberService.login(m);
//		
//		if(dto != null) {
//			// 세션에 저장
//			ModelMap name = model.addAttribute("login", dto); 
//			return "redirect:main";
//		}
//		
//		model.addAttribute("errorMessage", "아이디 및 비번 확인 필요."); // request scope에 저장 
//		return "loginForm";
//	}
	
	@PostMapping(value={"/login_fail"})
	public String failPage(ModelMap model) {
		model.addAttribute("errorMessage", "아이디 및 비번 확인 필요."); // request scope에 저장 
		return "loginForm";
	}
	
	@GetMapping(value={"/login_success"})
	public String successPage(ModelMap model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO login = (MemberDTO)auth.getPrincipal();
//		System.out.println(login);
		
		model.addAttribute("login",login);
		
//		MemberDTO dto = memberService.login(m);
//		model.addAttribute("login", dto); 
//		
//		System.out.println(dto);
		
		return "redirect:main";
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:main";
	}
	
}
