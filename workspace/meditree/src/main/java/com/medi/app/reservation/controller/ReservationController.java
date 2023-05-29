package com.medi.app.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.reservation.service.ReservationService;

@Controller
@RequestMapping("member")
public class ReservationController {

	private final ReservationService rs;

	@Autowired
	public ReservationController(ReservationService rs) {
		this.rs = rs;
	}
	
	@GetMapping("rsvnInpatientRm")
	public void rsvnInpatientRm(Model model,MemberVo mvo) {
		
		List<MemberVo> evoList = rs.getDoctorList();
		model.addAttribute("evoList", evoList);

	}

	@PostMapping(value ="rsvnScreen.pRm", produces = "application/text; charset=utf8")
	@ResponseBody
	public String rsvnScreen(String paNo, Model model) {
		PatientVo vo = rs.rsvnScreen(paNo);
		
		model.addAttribute("vo", vo);
		System.out.println("예약화면으로 넘어가는 vo:"+vo);

		
        Gson gson = new Gson();
        String str = gson.toJson(vo);

        
        return str;
	}
	//테이블에서 회원 한명당 수술 한번 하게 조정해서 다시 해보기
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
	
	
	@PostMapping(value = "putWaitingPatient.st",produces = "application/text; charset=utf8")
	@ResponseBody
	public String putWaitingPatient(String paNo, Model model) {
		PatientVo pvo = rs.putWaitingPatient(paNo);
		
		model.addAttribute("pvo", pvo);
		System.out.println("pvo : "+ pvo);
		
		Gson gson = new Gson();
        String str = gson.toJson(pvo);

        
        return str;
		
	}
	
	
}
