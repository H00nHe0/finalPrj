package com.medi.app.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("chatting")
public class ChattingController {

	@GetMapping("list")
	public String chattingList() {
		return "chatting/chatting-list";
	}

	@GetMapping("window")
	public String chatWindow() {
		return "chatting/chat-window";
	}
}
