package com.medi.app.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	//메인화면
	@RequestMapping("/member/main")
	public String main() {
		log.trace("main called");
		return "member/main";
	}
}