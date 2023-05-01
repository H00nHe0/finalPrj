package com.medi.app.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@GetMapping("list")
	public String getNoticeList() {
		
		return "notice/notice-list";
	}
	
	@GetMapping("write")
	public String write() {
		return "notice/notice-write";
	}
	@GetMapping("detail")
	public String detail() {
		return "notice/notice-detail";
	}
	@GetMapping("edit")
	public String edit() {
		return "notice/notice-edit";
	}
}
