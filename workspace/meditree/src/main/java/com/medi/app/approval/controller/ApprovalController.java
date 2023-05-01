package com.medi.app.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	//목록조회
	@GetMapping("formList")
	public String list() {
		return "/approval/formList";
	}
	
	@GetMapping("formManage")
	public String formManage() {
		return "/approval/formManage";
	}
	
	@GetMapping("businessDetail")
	public String businessDetail() {
		return "/approval/businessDetail";
	}
	

}
