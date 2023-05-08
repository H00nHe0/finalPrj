package com.medi.app.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("member")
public class MemberController {
	
	//회원가입 화면
	@GetMapping("join")
	public void join() {
	
	}
	
	//회원가입
	@PostMapping("join")
	public void join(HttpServletRequest req) {
		
		//데이터
		
		
		//서비스
		
	}
	

}
