package com.medi.app.approval.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.medi.app.approval.service.ApprService;
import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;

@Controller
@RequestMapping("appr")
public class ApprovalController {
	
	private final ApprService as;
	
	@Autowired
	public ApprovalController(ApprService as) {
		this.as = as;
	}
	
	//관리자 결재양식 관리 목록 조회
	@GetMapping("list")
	public String list(Model model , @RequestParam(defaultValue = "1") int page) {
		int listCount = as.getApprListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<ApprVo> apvoList = as.getApprList(pv);
		
		//화면
		model.addAttribute("pv", pv);
		model.addAttribute("apvoList", apvoList);
		return "appr/list";
	}

	//관리자 결재양식 작성하기(화면)
	@GetMapping("write")
	public String write(HttpSession session, Model model) {
		return "/appr/write";
	}
	
	//관리자 결재양식 작성하기
	@PostMapping("write")
	public String write(ApprVo vo , HttpSession session) {
		
		int result = as.write(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "양식을 등록 하였습니다.");
		}else {
			session.setAttribute("alertMsg", "양식 등록에 실패 하였습니다.");
		}
		
		return "redirect:/appr/list";
	}
	
	//결재양식 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model) {
		
		ApprVo vo = as.getAppr(num);
		if(vo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error";
		}
		
		model.addAttribute("vo", vo);
		return "/appr/detail";
	}
	
	//결재양식 수정하기
	@PostMapping("edit")
	public String edit(ApprVo vo, Model model, HttpSession session) {
		
		int result = as.edit(vo);
		
		if(result != 1) {
			model.addAttribute("errorMsg", "수정에 실패하였습니다.");
			return "common/error";
		}
		
		session.setAttribute("alertMsg", "수정에 성공하였습니다.");
		return "redirect:/appr/detail?num=" + vo.getNo();
	}
	
	//결재양식 삭제하기
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		
		int result = as.delete(num);
		
		if(result != 1) {
			throw new Exception("양식 삭제 중 에러가 발생했습니다.");
		}
		
		return  "redirect:/appr/list?page=1";
	}
	
	//ajax 로 들어오는 파일 업로드 요청 처리
	@PostMapping("upload")
	@ResponseBody
	public String upload(List<MultipartFile> fileList , HttpServletRequest req) throws Exception {
		
		List<String> changeNameList = new ArrayList<String>();
		
		for(MultipartFile f : fileList) {
			//경로 준비
			String path = req.getServletContext().getRealPath("/resources/img/appr/");
			String changeName = UUID.randomUUID().toString();
			String ext = f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf("."));
			//타겟파일 준비
			File target = new File(path + changeName + ext);
			//파일전송
			f.transferTo(target);
			
			changeNameList.add(changeName + ext);
		}
		
		Gson gson = new Gson();
		return gson.toJson(changeNameList);
	}
	
}
