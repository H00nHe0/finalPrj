package com.medi.app.mySign.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.medi.app.adminSign.service.adminService;
import com.medi.app.adminSign.vo.AdminSignVo;
import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.mySign.service.MySignService;
import com.medi.app.mySign.vo.MySignVo;

@Controller
@RequestMapping("mySign")
public class MySignController {
	
	private final MySignService mss;

	@Autowired
	public MySignController(MySignService mss) {
		this.mss = mss;
	}
	
	//나의 기안 리스트 목록 조회
	@GetMapping("list")
	public String list(Model model , @RequestParam(defaultValue = "1") int page) {
		int listCount = mss.getMySignListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<MySignVo> signvoList = mss.getMySignList(pv);
		
		//화면
		model.addAttribute("pv", pv);
		model.addAttribute("signvoList", signvoList);
		return "mySign/sign-list";
	}
	
	//기안문 작성하기(화면)
	@GetMapping("write")
	public String write(HttpSession session, Model model) {

		return "mySign/sign-write";
	}
	
	//기안문 작성하기(결재요청)
	@PostMapping("write")
	public String write(MySignVo vo, MultipartFile f, HttpSession session, HttpServletRequest req, AdminSignVo avo) throws Exception {
		
		int result = mss.write(vo);
		int result2 = mss.insertToAdmin(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "결재를 요청 하였습니다.");
		}else {
			session.setAttribute("alertMsg", "결재 요청에 실패 하였습니다.");
		}
		
		return "redirect:/mySign/list";
	}
	
	//사용자 결재양식 리스트 조회 (ajax)
	@ResponseBody
	@RequestMapping(value="list", produces="application/json; charset=UTF-8")
	public String selectFormList(Model model) {
		
		List<ApprVo> apvoList = mss.getApprList();
		model.addAttribute("apvoList", apvoList);
		//ArrayList<Form> list = mss.selectFormList();
		return new Gson().toJson(apvoList);	
		
	}
	
	//사용자 결재양식 디테일 불러오기 (ajax)
	@ResponseBody
	@RequestMapping(value="detail", produces="application/json; charset=UTF-8")
	public String selectFormDetail(String num) {
		
		MySignVo f = mss.selectFormDetail(num);
		return new Gson().toJson(f);
	}

	//작성한 기안문 상세조회
	@GetMapping("signDetail")
	public String signDetail(String num, Model model, @SessionAttribute MemberVo loginMember) {
		
		String no = loginMember.getNo();
		String name = loginMember.getName();
		String title = loginMember.getTitle();
		
		MySignVo vo = mss.getMySign(num);
		
		
		if(vo == null) {
			model.addAttribute("errorMsg", "작성한 기안문 조회를 실패하였습니다.");
			return "common/error";
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("path","resources/upload/MySign");
		return "mySign/sign-detail";
	}
	
	//작성한 기안문 수정하기
	@PostMapping("edit")
	public String edit(MySignVo vo, Model model, HttpSession session) {
		
		int result = mss.edit(vo);
		
		if(result != 1) {
			model.addAttribute("errorMsg", "수정에 실패하였습니다.");
			return "common/error";
		}
		session.setAttribute("alertMsg", "수정에 성공하였습니다.");
		return "redirect:/mySign/signDetail?num=" + vo.getNo();
	}
	
}
