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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.medi.app.common.file.FileUploader;
import com.medi.app.member.service.MemberService;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.schedule.controller.ScheduleController;
import com.medi.app.schedule.service.ScheduleService;

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
		
		//파일업로드
		String path = req.getServletContext().getRealPath("/resources/img/member/");
		String changeName = FileUploader.upload(vo.getProfile() , path);
		vo.setProfileName(changeName);
		
		//부서번호가져와서 사원번호앞 2자리넣어주기
		String department = vo.getDeptNo();
		String prefix = department;
		Random randomN = new Random();
		int suffix = randomN.nextInt(9000) + 1000;
		String empNo = prefix + suffix;
		vo.setNo(empNo);
		
		// 이메일 (랜덤알파벳3자리 + 사번)@meditree.com 형식으로 만들어주기
        char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();

        StringBuilder randomAlphabets = new StringBuilder();
        Random randomA = new Random();
        for (int i = 0; i < 3; i++) {
            int randomIndex = randomA.nextInt(alphabet.length);
            randomAlphabets.append(alphabet[randomIndex]);
        }
        String newEmail = randomAlphabets.toString() + empNo + "@meditree.com";
        vo.setEmail(newEmail);
		
		//서비스
		int result = ms.join(vo);
		if(result != 1) {
			return "common/error";
		}
		session.setAttribute("alertMsg", "직원가입 성공");
		return "redirect:/member/main";
	}
	
	//아이디 중복확인
	@RequestMapping("id-check")
	public String idCheck(String no , Model model) {
		
		int result = ms.checkId(no);
		
		if(result > 0) {
			model.addAttribute("errorMsg" , "아이디가 중복입니다.");
			return "common/error";
		}else {
			return "redirect:/member/main";
		}
		
	}
	
	//로그인
	@PostMapping("login")
	public String login(MemberVo vo , HttpSession session) {
		
		//서비스
		MemberVo loginMember = ms.login(vo);
		
		
		//화면
		session.setAttribute("loginMember", loginMember);

		// ScheduleController 객체 생성 및 멤버 변수 전달 byHoon
	    ScheduleController calendar = new ScheduleController(loginMember);

	    if(loginMember == null) {
	    	session.setAttribute("alertMsg", "로그인 실패하였습니다");
	    	return "redirect:/home";
	    }else {
	    	session.setAttribute("alertMsg", "로그인되었습니다.");
	    	return "redirect:/member/main";
	    }

	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session , Model model) {
		model.addAttribute("alertMsg", "로그아웃 되었습니다.");
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		session.invalidate();
		return "redirect:/home";
	}

	
	//정보수정 화면
	@GetMapping("edit")
	public String edit(HttpSession session , Model model) {
		/*
		 * if(session.getAttribute("loginMember") == null) {
		 * model.addAttribute("errorMsg" , "로그인 먼저 해주세요"); return "common/error"; }
		 */
		return "member/edit";
	}
	
	//정보수정
	@PostMapping("edit")
	public String edit(MemberVo vo , Model model , HttpSession session , HttpServletRequest req, MultipartFile profile) throws Exception  {
		
		if(!profile.isEmpty()) {
			String path = session.getServletContext().getRealPath("/resources/img/member/");
			String changeName = FileUploader.upload(profile, path);
			String originName = profile.getOriginalFilename();
			vo.setProfileName(changeName);
		}
		
		//서비스
		MemberVo updatedMember = ms.edit(vo);
		
		 if(updatedMember == null) {
			 model.addAttribute("alertMsg" ,"정보수정실패..."); 
			 return "common/error"; 
		 }
		model.addAttribute("loginMember", updatedMember);
		session.setAttribute("alertMsg", "다시 로그인 해주셔야 새롭게 정보가 등록됩니다.");
		return "redirect:/member/main";
		
	}
	

}
