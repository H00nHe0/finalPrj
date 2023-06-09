package com.medi.app.electronicSign.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.electronicSign.service.EleSignService;
import com.medi.app.electronicSign.vo.EleSignVo;
import com.medi.app.member.vo.MemberVo;

@Controller
@RequestMapping("eleSign")
public class ElectronicSignController {
	
	private final EleSignService ess;

	public ElectronicSignController(EleSignService ess) {
		this.ess = ess;
	}
	
	//전체 기안한 리스트 목록 조회(관리자든 사용자든 둘다 볼 수 있음)
	@GetMapping("list")
	public String list(Model model , @RequestParam(defaultValue = "1") int page) {
		int listCount = ess.getEleSignListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<EleSignVo> elevoList = ess.getEleSignList(pv);
		
		//화면
		model.addAttribute("pv", pv);
		model.addAttribute("elevoList", elevoList);
		return "eleSign/sign-list";
	}
	
	//[사용자] 기안문 작성하기(화면)
	@GetMapping("write")
	public String write(HttpSession session, Model model) {
		
		return "eleSign/sign-write";
	}
	
	//[사용자] 기안문 작성하기
	@PostMapping("write")
	public String write(EleSignVo vo, HttpSession session, HttpServletRequest req) throws Exception {
		
		//서비스
		int result = ess.write(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "결재를 요청 하였습니다.");
		}else {
			session.setAttribute("alertMsg", "결재 요청에 실패 하였습니다.");
		}
		
		return "redirect:/eleSign/list";
	}
	
	//[사용자] 기안문 작성하기 안에 결재양식 리스트 조회하기(ajax)
	@ResponseBody
	@RequestMapping(value="list", produces="application/json; charset=UTF-8")
	public String selectFormList(Model model) {
		
		List<ApprVo> apvoList = ess.getApprList();
		model.addAttribute("apvoList", apvoList);
		return new Gson().toJson(apvoList);	
	}
	
	//[사용자] 결재양식 디테일 불러오기 (ajax)
	@ResponseBody
	@RequestMapping(value="detail", produces="application/json; charset=UTF-8")

	public String selectFormDetail(String num) {
		
		EleSignVo f = ess.selectFormDetail(num);
		return new Gson().toJson(f);
	}
	
	//[사용자] 작성한 기안문 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model, @SessionAttribute MemberVo loginMember) {
		
		String no = loginMember.getNo();
		String name = loginMember.getName();
		String title = loginMember.getTitle();
		
		EleSignVo vo = ess.getEleSign(num);
		
		if(vo == null) {
			model.addAttribute("errorMsg", "작성한 기안문 조회를 실패하였습니다.");
			return "common/error";
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("path","resources/upload/sign");
		return "eleSign/sign-detail";
	}
	
	//[사용자] 작성한 기안문 수정하기
	@PostMapping("edit")
	public String edit(EleSignVo vo, HttpSession session, MultipartFile f) {
		
		int result = ess.edit(vo);
		
		if(result != 1) {
			throw new IllegalStateException("수정 실패 ..");
		}
		session.setAttribute("alertMsg", "수정에 성공하였습니다.");
		
		return "redirect:/eleSign/detail?num=" + vo.getNo();
	}
	
	//[사용자] 작성한 기안문 삭제하기
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		
		int result = ess.delete(num);
		
		if(result != 1) {
			throw new Exception("결재문 삭제 중 에러가 발생했습니다.");
		}
		
		return "redirect:/eleSign/list?page=1";
	}
	
	//[관리자] 사용자가 작성한 기안문 승인하기
	@GetMapping("approve")
	public String approve(String num, HttpSession session) throws Exception {
		
		int result = ess.approve(num);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "승인 하였습니다.");
		}else {
			session.setAttribute("alertMsg", "승인을 실패 하였습니다.");
		}
		
		return "redirect:/eleSign/list?pae=1";
	}
	
	//[관리자] 사용자가 작성한 기안문 반려하기
	@PostMapping("disapprove")
	public String disapprove(String num, HttpSession session) throws Exception {
		
		int result = ess.disapprove(num);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "반려 하였습니다.");
		}else {
			session.setAttribute("alertMsg", "반려를 실패 하였습니다.");
		}
		
		return "redirect:/eleSign/list?pae=1";
	}
	
	
}
