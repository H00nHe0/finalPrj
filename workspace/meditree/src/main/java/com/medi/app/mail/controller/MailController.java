package com.medi.app.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mail")
public class MailController {

	@GetMapping("list")
	public String getMailList() {
		return "mail/mail-list";
	}
	@GetMapping("write")
	public String write() {
		return "mail/mail-send";
	}
	@GetMapping("delete")
	public String deleteBox() {
		return "mail/mail-delete-box";
	}
	@GetMapping("detail")
	public String detail() {
		return "mail/mail-detail";
	}
}
