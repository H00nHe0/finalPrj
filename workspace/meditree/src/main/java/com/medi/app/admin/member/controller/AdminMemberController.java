package com.medi.app.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.medi.app.admin.member.service.AdminMemberService;
import com.medi.app.common.file.FileUploader;
import com.medi.app.common.page.PageVo;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.vo.PatientVo;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {
	
	private final AdminMemberService ams;
	
	@Autowired
	public AdminMemberController(AdminMemberService ams) {
		this.ams = ams;
	}

	@GetMapping("list")
	public String list(Model model , HttpSession session , @RequestParam(defaultValue = "1") int page, @RequestParam Map<String, String> searchMap) {
		
		// 데이터
		int listCount = ams.getCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		//서비스
		List<MemberVo> list = ams.getMemberList(pv, searchMap);
		
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("pv", pv);
		model.addAttribute("voList" , list);
		
		//화면작업 == 문자열 내보내기
		return "admin/member/list";
	}
	@GetMapping("list2")
	public String list2(Model model , HttpSession session , @RequestParam(defaultValue = "1") int page, @RequestParam Map<String, String> searchMap) {
		
		// 데이터
		int listCount = ams.getCnt2(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		//서비스
		List<MemberVo> list2 = ams.getMemberList2(pv, searchMap);
		
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("pv", pv);
		model.addAttribute("voList2" , list2);
		
		//화면작업 == 문자열 내보내기
		return "admin/member/list2";
	}
	
	//회원번호로 조회
	@GetMapping("one/{no}")
	public String getMemberByNo(@PathVariable String no , Model model , MultipartFile profile, HttpSession session) {
		
		
		
		MemberVo vo = ams.getMemberByNo(no);
		
		model.addAttribute("vo" , vo);
		return "admin/member/detail";
	}
	
	//회원탈퇴
	@RequestMapping("quit/{no}")
	public String quit(HttpSession session , @PathVariable String no , Model model) {
		
		
		//서비스
		int result = ams.quit(no);
		System.out.println(no);
		System.out.println(result);
		
		//화면
		if(result == 1) {
			session.setAttribute("alertMsg", "퇴사처리 되었습니다");
		}else {
			session.setAttribute("alertMsg", "회원탈퇴 실패...");
		}
		return "redirect:/member/main";
		
	}
	
	//회원수정 화면
	@GetMapping("edit/{no}")
	public String edit(@PathVariable String no , Model model) {
		
		MemberVo vo = ams.getMemberByNo2(no);
		
		model.addAttribute("vo" , vo);
		return "admin/member/edit";
	}
	
	//수정
	@PostMapping("edit")
	public String edit(MemberVo vo, HttpSession session) throws Exception {
		
		int result = ams.edit(vo);

		if (result == 0) {
			throw new Exception("수정 실패 ...");
		}

		session.setAttribute("alertMsg", "수정하기 성공!");
		
		return "redirect:/admin/member/list";
	}
	
	
	

	
	
}
