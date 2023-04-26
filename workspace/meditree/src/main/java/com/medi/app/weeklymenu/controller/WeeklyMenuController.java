package com.medi.app.weeklymenu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("weekly")
public class WeeklyMenuController {

	@GetMapping("menu")
	public String menu() {
		return "weekly-menu/menu";
	}
}
