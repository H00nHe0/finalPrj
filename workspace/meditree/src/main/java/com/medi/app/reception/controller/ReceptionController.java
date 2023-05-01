package com.medi.app.reception.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class ReceptionController {

	@GetMapping("reception")
	public String reception() {

		return "/member/reception";
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
	
	@GetMapping("simplePatientCheck")
	public void simplePatientCheck(){
		 
	}
	
	@GetMapping("rsvnInpatientRm")
	public void rsvnInpatientRm() {
		
	}
	@GetMapping("rsvnOperatingRm")
	public void rsvnOperatingRm() {
		
	}
}
