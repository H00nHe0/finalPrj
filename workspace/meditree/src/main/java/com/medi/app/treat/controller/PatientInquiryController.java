package com.medi.app.treat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medi.app.common.page.PageVo;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.treat.service.PatientInquiryService;
import com.medi.app.reception.patient.vo.PatientVo;

@Controller
@RequestMapping("patientInquiry")
public class PatientInquiryController {
	
	private final PatientInquiryService ps;
	
	@Autowired
	public PatientInquiryController(PatientInquiryService ps) {
		this.ps = ps;
	} 

	//환자조회
	@GetMapping("list")
	public String getPatientList(@RequestParam(defaultValue = "1") int page ,@RequestParam Map<String , String> searchMap, Model model) {
		
		//데이터
		int listCount = ps.getCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		//서비스
		List<PatientVo> pvoList = ps.getPatientList(pv, searchMap);
		
		//화면
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);
		model.addAttribute("pvoList" , pvoList);
		return "patientInquiry/list";
	}
	
	
	
	
	//환자상세조회
	@GetMapping("detail")
	public String inquiryDetail(String no , Model model) {
		
		PatientVo vo = ps.getPatientInquiry(no);
		
		if(vo == null) {
			model.addAttribute("errorMsg" , "조회실패....");
			return "common/error";
		}
		
		model.addAttribute("vo" , vo);
		return "patientInquiry/detail";
	}
	
	
	//환자정보수정 화면
	@GetMapping("edit")
	public String InquiryEdit() {
		return "patientInquiry/edit";
	}
	
	//정보수정
	@PostMapping("edit")
	public String InquiryEdit(PatientVo vo , RedirectAttributes ra) throws Exception{
		
		int result = ps.updatePatientInquiry(vo);
				
		if(result != 1) {
			throw new Exception("수정 실패 ...");
		}
		
		ra.addFlashAttribute("alertMsg" , "수정하기 성공!");
		ra.addAttribute("no" , vo.getNo());
		return "redirect:/patientInquiry/detail";
		
	}
	
}
