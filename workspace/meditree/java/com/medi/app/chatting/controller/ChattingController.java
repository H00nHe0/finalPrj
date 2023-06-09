package com.medi.app.chatting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medi.app.chatting.service.ChattingService;
import com.medi.app.member.vo.MemberVo;

@Controller
@RequestMapping("chatting")
public class ChattingController {

	private final ChattingService cs;
	
	@Autowired
	public ChattingController(ChattingService cs) {
		this.cs = cs;
	}
	
	//채팅목록 조회
	@GetMapping("list")
	public String chattingList(Model model) {
		List<MemberVo> list = cs.getMemberList();
		model.addAttribute("voList",list);
		return "chatting/chatting-list";
	}

	//채팅창 보여주기
	@GetMapping("window")
	public String chatWindow() {
		return "chatting/chat-window";
	}
	
	//채팅창 보내기?
}
