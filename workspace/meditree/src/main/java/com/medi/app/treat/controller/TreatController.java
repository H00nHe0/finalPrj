package com.medi.app.treat.controller;

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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.medi.app.common.page.PageVo;
import com.medi.app.jinryo.vo.JinryoVo;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.tmHistory.vo.TmHistoryVo;
import com.medi.app.treat.service.PatientInquiryService;
import com.medi.app.treat.service.TreatService;
import com.medi.app.treat.vo.DrugVo;

@Controller
@RequestMapping("treat")
public class TreatController {

	private final TreatService ts;

	@Autowired
	public TreatController(TreatService ts) {
		this.ts = ts;
	}

	// 진료처방(화면)
	@GetMapping("prescription")
	public String prescription(HttpSession session, JinryoVo jvo, Model model) {

		// 로그인중인 의료진 사번
		String emNo = ((MemberVo) session.getAttribute("loginMember")).getNo();

		// 현재 진료중인 환자
		JinryoVo nowPatient = ts.selectNowPatient(jvo, emNo);


		// 진료중인 환자의 과거진료내역 가져오기
		String chartNo = nowPatient.getPaNo();
		List<TmHistoryVo> tmvoList = ts.getNowChart(chartNo);

		// 약 조회
		List<DrugVo> drvoList = ts.getDrugList();

		model.addAttribute("nowPatient", nowPatient);
		model.addAttribute("tmvoList", tmvoList);
		model.addAttribute("drvoList", drvoList);

		return "treat/prescription";
	}

	// 진료입력
	@PostMapping("prescription")
	public String prescription(TmHistoryVo vo, HttpServletRequest request , String no , HttpSession session) {

		String tmContent = request.getParameter("tmContent");

		// JSP에서 선택된 라디오 버튼 값 가져오기
		String checkHospital = request.getParameter("checkHospital");
		String checkSurgery = request.getParameter("checkSurgery");
		// 서비스
		int result = ts.insertTm(vo);
		int result2 = ts.treatmentCompleted(no);

		session.setAttribute("alertMsg", "진료처방이 완료되었습니다.");
		return "redirect:/treat/waiting";
	}
	// 진료대기목록
	@GetMapping("waiting")
	public String waiting(Model model, HttpSession session, @SessionAttribute MemberVo loginMember, JinryoVo vo) {

		String emNo = loginMember.getNo();
		vo.setEmNo(emNo);

		// 서비스
		List<JinryoVo> jvoList = ts.getWaitingList(emNo);

		// 화면
		model.addAttribute("jvoList", jvoList);

		return "treat/waitingList";
	}

	
	  @RequestMapping("drugName") public String drugName(@RequestParam String drug) { 
		  return "treat/prescription";
	  }
}
