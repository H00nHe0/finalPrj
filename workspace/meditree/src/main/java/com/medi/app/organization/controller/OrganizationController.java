package com.medi.app.organization.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("organization")
public class OrganizationController {

	@GetMapping("chartView")
	public void chartView(){
		
	}
}
