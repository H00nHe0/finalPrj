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
	@GetMapping("detail")
	public String detail() {
		return "board/board-detail";
	}
	@GetMapping("edit")
	public String edit() {
		return "board/board-edit";
	}
}
