package com.medi.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@GetMapping("list")
	public String getBoardList() {
		
		return "board/board-list";
	}
	
	@GetMapping("write")
	public String write() {
		return "board/board-write";
	}
}
