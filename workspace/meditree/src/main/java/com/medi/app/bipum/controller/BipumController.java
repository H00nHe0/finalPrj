package com.medi.app.bipum.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medi.app.bipum.service.bipumService;
import com.medi.app.bipum.vo.BipumVo;
import com.medi.app.common.file.FileUploader;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mediDevice.service.MediDeviceService;
import com.medi.app.mediDevice.vo.MediDeviceVo;
import com.medi.app.member.vo.MemberVo;

@Controller
@RequestMapping("bipum")
public class BipumController {
	
	private final bipumService bs;
	
	@Autowired
	public BipumController(bipumService bs) {
		this.bs = bs;
	}
	
	//비품 목록조회
	@GetMapping("list")
	public String list(Model model ,@RequestParam(defaultValue = "1") int page) {
		int listCount = bs.getBipumListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<BipumVo> bvoList = bs.getBipumList(pv);
		
		//화면
		model.addAttribute("pv",pv);
		model.addAttribute("bvoList", bvoList);
		return "bipum/list";
	}
	
	//비품 등록하기 화면
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
		 
		return "bipum/write";
	}
	
	//비품 등록하기(관리자만)
	@PostMapping("write")
	public String write(BipumVo vo, List<MultipartFile> f, HttpSession session, HttpServletRequest req) throws Exception {
		System.out.println(f);
		System.out.println(f.get(0));
		//데이터 준비(파일)
		String path = req.getServletContext().getRealPath("/resources/upload/bipum/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);

		//데이터 준비 (이름 리스트)
		List<FileVo> fvoList = new ArrayList<FileVo>();
		int size = changeNameList.size();
		for (int i = 0; i < size; i++) {
			FileVo fvo = new FileVo();
			fvo.setOriginName(originNameList.get(i));
			fvo.setChangeName(changeNameList.get(i));
			fvoList.add(fvo);
		}
		
		int result = bs.write(vo ,fvoList);
		if(result <= 0) {
			throw new Exception("비품 등록 실패");
		}
		session.setAttribute("alertMsg", "비품 등록 완료");
		
		return "redirect:/bipum/list";
	}
	
	//비품 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model) {
		
		BipumVo vo = bs.getBipum(num);
		
		if(vo == null) {
			model.addAttribute("errorMsg", "비품 조회를 실패하였습니다.");
			return "common/error";
		}
		
		model.addAttribute("vo", vo);
		return "bipum/detail";
	}

	//비품 수정하기(관리자만)
	@PostMapping("edit")
	public String edit(BipumVo vo, Model model, HttpSession session) {
//		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		String id = null;
//		if(loginMember != null) { //로그인멤버가 NULL이 아닐때만 꺼내오는 조건 
//			id = loginMember.getId();
//		}
		//String id = loginMember.getId();
		
		//ADMIN이 아닐 때 
//		if(!"ADMIN".equals (id)) {
//			model.addAttribute("errorMsg", "잘못된 요청입니다 ...");
//			return "common/error";
//		}
		
		int result = bs.edit(vo);
		
		if(result != 1) {
			model.addAttribute("errorMsg", "비품 수정을 실패하였습니다.");
			return "common/error";
		}
		session.setAttribute("alertMsg", "수정을 성공하였습니다.");
		return "redirect:/bipum/detail?num=" + vo.getNo();
	}
	
	//비품 삭제하기(관리자만)
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		
		int result = bs.delete(num);
		
		if(result != 1) {
			throw new Exception("비품 삭제 중 에러가 발생했습니다.");
		}
				
		return  "redirect:/bipum/list?page=1";
	}
	

}










