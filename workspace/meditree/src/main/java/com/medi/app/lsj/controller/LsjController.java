package com.medi.app.lsj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("lsj")
public class LsjController {
	
	@GetMapping("commute")
	public String commute() {
		return "/lsj/commute";
	}
	
	@GetMapping("vacation")
	public String vacation() {
		return "/lsj/vacation";
	}
	
	@GetMapping("salary")
	public String salary() {
		return "/lsj/salary";
	}

}
