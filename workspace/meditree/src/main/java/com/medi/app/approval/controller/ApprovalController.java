package com.medi.app.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("appr")
public class ApprovalController {
	
	@GetMapping("apprEnrollForm")
	public String apprEnrollForm() {
		return "/appr/apprEnrollForm";
	}
	
	@GetMapping("apprFullList")
	public String apprFullList() {
		return "/appr/apprFullList";
	}
	
	@GetMapping("apprStandbyDetail")
	public String apprStandbyDetail() {
		return "/appr/apprStandbyDetail";
	}
	
	@GetMapping("apprStandbyList")
	public String apprStandbyList() {
		return "/appr/apprStandbyList";
	}
	
	@GetMapping("formDetailView")
	public String formDetailView() {
		return "/appr/formDetailView";
	}
	
	@GetMapping("formInsertView")
	public String formInsertView() {
		return "/appr/formInsertView";
	}
	
	@GetMapping("formListView")
	public String formListView() {
		return "/appr/formListView";
	}

}
