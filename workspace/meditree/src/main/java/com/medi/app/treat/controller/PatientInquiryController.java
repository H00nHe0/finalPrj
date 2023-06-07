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
import com.medi.app.tmHistory.vo.TmHistoryVo;

@Controller
@RequestMapping("patientInquiry")
public class PatientInquiryController {

	private final PatientInquiryService ps;

	@Autowired
	public PatientInquiryController(PatientInquiryService ps) {
		this.ps = ps;
	}

	// 환자조회
	@GetMapping("list")
	public String getPatientList(@RequestParam(defaultValue = "1") int page,
			@RequestParam Map<String, String> searchMap, Model model) {

		// 데이터
		int listCount = ps.getCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		// 서비스
		List<PatientVo> pvoList = ps.getPatientList(pv, searchMap);

		// 화면
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("pv", pv);
		model.addAttribute("pvoList", pvoList);
		return "patientInquiry/list";
	}

	// 환자상세조회 + //환자 진료내역 조회(상세조회페이지랑 같이있음)
	@GetMapping("detail")
	public String inquiryDetail(@RequestParam(defaultValue = "1") int page  , String no , Model model) {

		int listCount = ps.getCnt2(no);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
		PatientVo vo = ps.getPatientInquiry(no);
		List<TmHistoryVo> tmvoList = ps.getPatientChart(no , pv);
		
		if (vo == null) {
			model.addAttribute("errorMsg", "조회실패....");
			return "common/error";
		}
		
		model.addAttribute("pv", pv);
		model.addAttribute("tmvoList", tmvoList);
		model.addAttribute("vo", vo);
		return "patientInquiry/detail";
	}

	
	//환자정보수정 화면
	@GetMapping("edit") 
	public String InquiryEdit(String no, Model model) { 
		
		PatientVo vo = ps.getPatientInquiry2(no);
		
		if (vo == null) {
			model.addAttribute("errorMsg", "조회실패....");
			return "common/error";
		}

		model.addAttribute("vo", vo);
		
		return "patientInquiry/edit"; 
		}
	 

	// 정보수정
	@PostMapping("edit")
	public String InquiryEdit(PatientVo vo, HttpSession session) throws Exception {

		int result = ps.updatePatientInquiry(vo);

		if (result == 0) {
			throw new Exception("수정 실패 ...");
		}

		session.setAttribute("alertMsg", "수정하기 성공!");
		//session.setAttribute("no", vo.getNo());
		return "redirect:/patientInquiry/detail?no=" + vo.getNo();

	}
	
	//처방전 조회
	@GetMapping("prescription")
	public String InquiryPrescription(String no , Model model) {
		
		// 처방전 -> 진료 정보 조회
		TmHistoryVo vo = ps.selectPrescription(no);
		
		model.addAttribute("vo", vo);
		
		return "patientInquiry/prescription";
	}
	

	

}
