package com.medi.app.mediDevice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mediDevice")
public class MediDeviceController {
	
	//목록조회
	@GetMapping("list")
	public String list() {
		return "/mediDevice/list";
	}
	
	//작성하기(화면)
	@GetMapping("write")
	public String write() {
		return "/mediDevice/write";
	}
	
	//상세조회
	@GetMapping("detail")
	public String detail() {
		return "/mediDevice/detail";
	}



}
