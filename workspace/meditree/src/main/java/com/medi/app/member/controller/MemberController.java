package com.medi.app.member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.medi.app.member.service.MemberService;
import com.medi.app.member.vo.MemberVo;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private final MemberService ms;
	
	@Autowired
	public MemberController(MemberService ms) {
		this.ms = ms;
	}
	
	//직원가입 화면
	@GetMapping("join")
	public void join() {
	
	}
	
	//직원가입
	@PostMapping("join")
	public String join(MemberVo vo , HttpServletRequest req , HttpSession session , Model model) throws Exception {
		
		
		//부서번호가져와서 사원번호앞 2자리넣어주기
		String department = vo.getDeptNo();
		
		String prefix = department;
		Random random = new Random();
		int suffix = random.nextInt(9000) + 1000;
		String empNo = prefix + suffix;
		
		vo.setNo(empNo);
		System.out.println(vo.getNo());
		
		//서비스
		int result = ms.join(vo);
		
		
		if(result != 1) {
			/* model.addAttribute("errorMsg" , "직원가입 실패.."); */
			return "common/error";
		}
		
		
		session.setAttribute("alertMsg", "직원가입 성공");
		return "redirect:/member/main";
		
	}
	
	//아이디 중복확인
	@RequestMapping("id-check")
	public String idCheck(String no) {
		return "";
	}
	

}
