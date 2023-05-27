package com.medi.app.mySign.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medi.app.common.page.PageVo;
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
		return "/mySign/sign-write";
	}
	
	//기안문 작성하기
	@PostMapping("write")
	public String write(MySignVo vo, HttpSession session) {
		
		int result = mss.write(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "기안을 작성하였습니다.");
		}else {
			session.setAttribute("alertMsg", "기안 작성에 실패 하였습니다.");
		}
		
		return "redirect:/mysign/sign-list";
	}
	
	


}
