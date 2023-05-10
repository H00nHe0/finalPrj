package com.medi.app.weeklymenu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.medi.app.weeklymenu.service.WeeklyMenuService;
import com.medi.app.weeklymenu.vo.WMenuVo;

@Controller
@RequestMapping("weekly")
public class WeeklyMenuController {

	private final WeeklyMenuService wms;
		
	@Autowired
	public WeeklyMenuController(WeeklyMenuService wms) {
		this.wms = wms;
	}
	
	@GetMapping("menu")
	public String menu(Model model) {
		
//		List<WMenuVo> WMenuList = wms.menu();
//		model.addAttribute("WMenuList",WMenuList);
		return "weekly-menu/menu";
	}
	@GetMapping("write")
	public String write() {
		return "weekly-menu/write";
	}
}
