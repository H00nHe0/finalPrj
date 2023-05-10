package com.medi.app.reception.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.medi.app.common.page.PageVo;
import com.medi.app.reception.patient.service.PatientService;
import com.medi.app.reception.patient.vo.PatientVo;



@Controller
@RequestMapping("member")
public class ReceptionController {
	
	private final PatientService ps;

	@Autowired
	public ReceptionController(PatientService x) {
		this.ps = x;
	}
	//접수 화면
	@GetMapping("reception")
	public String reception() {

		return "/member/reception";
	}
	//접수 
	@PostMapping("reception")
	public String enroll(PatientVo vo , HttpServletRequest req , HttpSession session , Model model) throws Exception {
		//서비스
		int result = ps.enroll(vo);
		
		
		if(result != 1) {
			//에러메세지 담아서
			session.setAttribute("alertMsg", "환자등록 실패");
			return "common/error";
		}

	    // 현재 날짜를 구하고 패턴을 변경
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	    String currentDate = dateFormat.format(new Date());
	    
	    // PatientVo 객체의 enrollStatus와 paDate를 설정
//	    vo.setEnrollStatus("첫 방문");
//	    vo.setPaDate(currentDate+" (첫 방문)");
//	    
//		PatientVo pvo = new PatientVo();
		session.setAttribute("alertMsg", "환자등록 성공");
//		session.setAttribute("pvo", vo);
		return "/member/reception";
	}
	
	
	//간편 환자조회
	@GetMapping("simplePatientCheck")
	public String simplePatientCheck(@RequestParam(defaultValue = "1") int page ,@RequestParam Map<String , String> searchMap, Model model, String num) throws Exception{
		//데이터
		int listCount = ps.getCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		

		//서비스
		List<PatientVo> pvoList = ps.getSimplePatientList(pv, searchMap);
		
		//화면
		model.addAttribute("pvoList" , pvoList);
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);
		
		
//		PatientVo vo = ps.getPaInfo(num);
//		if(vo == null) {
//			model.addAttribute("alertMsg", "조회실패");
//			return "common/error-page";
//		}
//		model.addAttribute("vo", vo);
//		

			
		
	
		
		
		return "member/simplePatientCheck";
		
	}

	
	

	@GetMapping("receiveManage")
	public void receiveManage() {

	}

	
	@GetMapping("rsvnWaiting") 
	public void rsvnWaiting(){
	 
	}
	
	@GetMapping("roomCheck")
	public void roomCheck() {
		
	}
	
	
	@GetMapping("rsvnInpatientRm")
	public void rsvnInpatientRm() {
		
	}
	@GetMapping("rsvnOperatingRm")
	public void rsvnOperatingRm() {
		
	}
}
