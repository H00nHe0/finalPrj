package com.medi.app.bipum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("bipum")
public class BipumController {
	
	//목록조회
	@GetMapping("list")
	public String list() {
		return "/bipum/list";
	}
	
	//작성하기(화면)
	@GetMapping("write")
	public String write() {
		return "/bipum/write";
	}
	
	//상세조회
	@GetMapping("detail")
	public String detail() {
		return "/bipum/detail";
	}

}
