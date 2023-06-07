package com.medi.app.adminSign.controller;

import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.medi.app.adminSign.service.adminService;
import com.medi.app.adminSign.vo.AdminSignVo;
import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.mySign.vo.MySignVo;

@Controller
@RequestMapping("adminSign")
public class adminSignController {

	private final adminService ads;

	@Autowired
	public adminSignController(adminService ads) {
		this.ads = ads;
	}

	// 결재대기 목록조회
	@GetMapping("adminList")
	public String adminList(Model model, @RequestParam(defaultValue = "1") int page) {
		int listCount = ads.getAdminSignListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<AdminSignVo> advoList = ads.getAdminSignList(pv);

		// 화면
		model.addAttribute("pv", pv);
		model.addAttribute("advoList", advoList);
		return "adminSign/standbyList";
	}

	// 작성하기(화면)
	@GetMapping("insertList")
	public String insertList(HttpSession session, Model model) {
		return "adminSign/standbyWrtie";
	}

	// 기안문 받아와서 승인해주기
	  @PostMapping("insertList") 
	  public String insertList(AdminSignVo vo, HttpSession session, HttpServletRequest req) throws Exception {
		 
	  int result = ads.insertList(vo);
	  
	  if(result == 1) {
		  session.setAttribute("alertMsg", "승인하였습니다."); 
	  }else {
	  		session.setAttribute("alertMsg", "승인 실패.. 다시 시도해주세요"); }
	  
	  return "redirect:/adminSign/adminList"; }


	// 사용자가 기안한 결재양식 리스트 조회 (ajax)
	@ResponseBody
	@RequestMapping(value = "list", produces = "application/json; charset=UTF-8")
	public String selectSignList(Model model) {

		List<MySignVo> signvoList = ads.getMySignList();
		model.addAttribute("signvoList", signvoList);
		System.out.println(signvoList);
		return new Gson().toJson(signvoList);
	}

	// 직원이 작성한 기안문 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model, @SessionAttribute MemberVo loginMember) {

		AdminSignVo vo = ads.getAdminSign(num);

		String no = loginMember.getNo();

		if (vo == null) {
			model.addAttribute("errorMsg", "기안문 조회를 실패하였습니다.");
			return "common/error";
		}

		model.addAttribute("vo", vo);
		return "mySign/signDetail";
	}
	
	//반려하기
	@PostMapping("disapproval")
	public String disapproval(AdminSignVo vo, HttpSession session, HttpServletRequest req) {
		
		int result = ads.disapproval(vo);

		if(result == 1) {
			session.setAttribute("alertMsg", "반려 처리되었습니다.");
			return "redirect:/adminSign/adminList";
		}else {
			session.setAttribute("alertMsg", "결재처리에 실패하였습니다.");
			return "redirect:/adminSign/adminList";
		}
	}

}
