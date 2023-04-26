package com.medi.app.treat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("treat")
public class TreatController {

	//진료대기목록
	@GetMapping("waiting")
	public String waiting() {
		return "member/treat/waitingList";
	}
	
	//진료처방
	@GetMapping("prescription")
	public String prescription() {
		return "member/treat/prescription";
	}
		
		
}
