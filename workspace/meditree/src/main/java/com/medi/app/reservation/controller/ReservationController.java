package com.medi.app.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.reservation.service.ReservationService;
import com.medi.app.reservation.vo.ReservationVo;

@Controller
@RequestMapping("member")
public class ReservationController {

	private final ReservationService rs;

	@Autowired
	public ReservationController(ReservationService rs) {
		this.rs = rs;
	}
	//입원실 예약 화면
	@GetMapping("rsvnInpatientRm")
	public void rsvnInpatientRm(Model model,MemberVo mvo) {
		List<ReservationVo> rmList = rs.getPRmList();
		model.addAttribute("rmList", rmList);
		List<ReservationVo> rmList2 = rs.get2PRmList();
		model.addAttribute("rmList2", rmList2);
		System.out.println(rmList);
		List<MemberVo> evoList = rs.getDoctorList();
		model.addAttribute("evoList", evoList);
	}	
	//수숳실 예약 화면
	@GetMapping("rsvnOperatingRm")
	public void rsvnOperatingRm(Model model,MemberVo mvo) {
		List<ReservationVo> sRmList = rs.getSRmList();
		model.addAttribute("sRmList", sRmList);
		System.out.println(sRmList);
		List<MemberVo> evoList = rs.getDoctorList();
		model.addAttribute("evoList", evoList);
	}	
	//수술실
	@PostMapping(value ="rsvnScreenS.sRm", produces = "application/text; charset=utf8")
	@ResponseBody
	public String rsvnScreenS(String paNo, Model model) {
		PatientVo vo = rs.rsvnScreenS(paNo);
		
		model.addAttribute("vo", vo);
		System.out.println("예약화면으로 넘어가는 vo:"+vo);		
		
        Gson gson = new Gson();
        String str = gson.toJson(vo);
        
        return str;
	}
	//수술실 예약 정보 받아서 보여주기
	@PostMapping(value = "putWaitingSPatient.op",produces = "application/text; charset=utf8")
	@ResponseBody
	public String putWaitingSPatient(String paNo, Model model) {
		System.out.println("paNo : "+ paNo);
		PatientVo pvo = rs.putWaitingSPatient(paNo);
		
		model.addAttribute("pvo", pvo);
		System.out.println("pvo : "+ pvo);
		
		Gson gson = new Gson();
		String str = gson.toJson(pvo);
		
		return str;
		
	}
	//수술실
	@PostMapping(value ="rsvnScreen.pRm", produces = "application/text; charset=utf8")
	@ResponseBody
	public String rsvnScreen(String paNo, Model model) {
		System.out.println(paNo);
		PatientVo vo = rs.rsvnScreen(paNo);
		
		model.addAttribute("vo", vo);
		System.out.println("예약화면으로 넘어가는 vo:"+vo);
		
		
		Gson gson = new Gson();
		String str = gson.toJson(vo);
		
		
		return str;
	}
	//입원실 예약 정보 받아서 보여주기
	@PostMapping(value = "putWaitingPatient.st",produces = "application/text; charset=utf8")
	@ResponseBody
	public String putWaitingPatient(String paNo, Model model) {
		System.out.println(paNo);
		PatientVo pvo = rs.putWaitingPatient(paNo);
		
		model.addAttribute("pvo", pvo);
		System.out.println("pvo : "+ pvo);
		
		Gson gson = new Gson();
        String str = gson.toJson(pvo);

        return str;
		
	}
	
	
	
	//예약한 환자정보 DB에 저장
	@PostMapping(value ="sentToDB.pRm", produces = "application/text; charset=utf8")
	@ResponseBody
	public String sendInfoToPRm(ReservationVo rvo, Model model) {
		model.addAttribute("rvo", rvo);
		System.out.println("rvo: "+rvo);
		int result = rs.sendInfoToPRm(rvo);
		int statusF = rs.changeToFinish(rvo);
		return result > 0 && statusF > 0 ? "success" : "fail";
	}
	
	//수술실 예약정보 캘린더에 표시
	@PostMapping(value ="sendToCalendar.sRm", produces = "application/text; charset=utf8")
	@ResponseBody
	public String sendToCalendar(ReservationVo calendarData, Model model) {
		model.addAttribute("calendarData", calendarData);
		System.out.println("calendarData: "+calendarData);
		int result = rs.sendToCalendar(calendarData);
		int statusF = rs.changeToSFinish(calendarData);
		return result > 0 && statusF > 0 ? "success" : "fail";
	}
		
	
	
	
}
