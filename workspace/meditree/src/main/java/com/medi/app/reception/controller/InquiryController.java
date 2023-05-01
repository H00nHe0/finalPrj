package com.medi.app.reception.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("treat")
public class InquiryController {

	//환자조회
	@GetMapping("patientInquiry")
	public String inquiry() {
		return "member/treat/patientInquiry";
	}
	
	//환자상세조회
	@GetMapping("patientInquiryDetail")
	public String inquiryDetail() {
		return "member/treat/patientInquiryDetail";
	}
	
	//환자정보수정
	@GetMapping("patientInquiryEdit")
	public String patientInquiryEdit() {
		return "member/treat/patientInquiryEdit";
	}
	
}
