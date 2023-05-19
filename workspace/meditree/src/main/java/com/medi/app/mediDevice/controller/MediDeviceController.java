package com.medi.app.mediDevice.controller;

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
import com.medi.app.mediDevice.service.MediDeviceService;
import com.medi.app.mediDevice.vo.MediDeviceVo;
import com.medi.app.notice.vo.NoticeVo;

@Controller
@RequestMapping("mediDevice")
public class MediDeviceController {
	
	private final MediDeviceService mds;
	
	@Autowired
	public MediDeviceController(MediDeviceService mds) {
		this.mds = mds;
	}

	//의료기기 목록조회
	@GetMapping("list")
	public String list(Model model ,@RequestParam(defaultValue = "1") int page) {
		int listCount = mds.getMediDeviceListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<MediDeviceVo> mdvoList = mds.getMediDeviceList(pv);
		
		//화면
		model.addAttribute("pv",pv);
		model.addAttribute("mdvoList", mdvoList);
		return "/mediDevice/list";
	}

	//의료기기 작성하기 화면(관리자만)
	@GetMapping("write")
	public String write(HttpSession session, Model model) {
		//(관리자만 로그인했을 때 작성/로그인멤버 생성하고 실행하기)
		//MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		//if(loginMember == null) { //로그인 멤버가 null이면 에러발생
		//	model.addAttribute("errorMsg","잘못된 접근입니다."); 
		//	return "common/error-page"; 
		//}
		//String id = loginMember.getId(); 
		//boolean isAdmin = "ADMIN".equals(id);
		 
		//if(!isAdmin) { 
		//	model.addAttribute("errorMsg","잘못된 접근입니다."); 
		//	return "common/error-page"; 
		//}
		 
		return "/mediDevice/write";
	}
	
	//의료기기 작성하기(관리자만)
	@PostMapping("write")
	public String write(MediDeviceVo vo, HttpSession session) {
		
		int result = mds.write(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "의료기기를 등록 하였습니다.");
		}else {
			session.setAttribute("alertMsg", "의료기기 등록 실패 하였습니다.");
		}
		
		return "redirect:/mediDevice/list";
	}
	
	
	//의료기기 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model) {
		
		MediDeviceVo vo = mds.getMediDevice(num);
		
		if(vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error";
		}
		
		model.addAttribute("vo", vo);
		return "/mediDevice/detail";
	}
	
	//의료기기 수정하기 (관리자만)
	@PostMapping("edit")
	public String edit(MediDeviceVo vo, Model model, HttpSession session) {
//		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		String id = null;
//		if(loginMember != null) {
//			id = loginMember.getId();
//		}
		//String id = loginMember.getId();
		
		//ADMIN이 아닐 때 
//		if(!"ADMIN".equals (id)) {
//			model.addAttribute("errorMsg", "잘못된 요청입니다 ...");
//			return "common/error";
//		}
		
		int result = mds.edit(vo);
		
		if(result != 1) {
			model.addAttribute("errorMsg", "수정에 실패하였습니다.");
			return "common/error";
		}
		
		session.setAttribute("alertMsg", "수정에 성공하였습니다.");
		return "redirect:/mediDevice/detail?num=" + vo.getNo();
	}
	
	//의료기기 삭제하기(관리자만)
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		
		int result = mds.delete(num);
		
		if(result != 1) {
			throw new Exception("의료기기 삭제 중 에러가 발생했습니다.");
		}
		
		return  "redirect:/mediDevice/list?page=1";
	}
	
}