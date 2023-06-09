package com.medi.app.weeklymenu.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	//환자식 화면
	@GetMapping("pmenu")
	public String pmenu(Model model) {
		
		// 현재 날짜와 시간 정보 가져오기
        LocalDate currentDate = LocalDate.now();
        // 현재 날짜의 요일 가져오기
        DayOfWeek currentDayOfWeek = currentDate.getDayOfWeek();
        // 해당 주의 시작일과 종료일 계산하기
        LocalDate startOfWeek = currentDate.minusDays(currentDayOfWeek.getValue() - 1);
        LocalDate endOfWeek = startOfWeek.plusDays(5);
        
        
        // 해당 주의 식단표 조회
        WMenuVo pMenu = wms.getWeeklyPmenu(startOfWeek, endOfWeek);
        
        model.addAttribute("pMenu", pMenu);
		return "weekly-menu/pmenu";
	}
	
	//직원식 화면
	@GetMapping("emenu")
	public String emenu(Model model) {
		
		// 현재 날짜와 시간 정보 가져오기
        LocalDate currentDate = LocalDate.now();
        // 현재 날짜의 요일 가져오기
        DayOfWeek currentDayOfWeek = currentDate.getDayOfWeek();
        // 해당 주의 시작일과 종료일 계산하기
        LocalDate startOfWeek = currentDate.minusDays(currentDayOfWeek.getValue() - 1);
        LocalDate endOfWeek = startOfWeek.plusDays(5);
        
        // 해당 주의 식단표 조회
        WMenuVo eMenu = wms.getWeeklyEmenu(startOfWeek, endOfWeek);
        
        model.addAttribute("eMenu", eMenu);
		return "weekly-menu/emenu";
	}
	
	//식단표 작성(화면)
	@GetMapping("write")
	public String write() {
		return "weekly-menu/write";
	}
	
	//식단표 작성(기능)
	@PostMapping("write")
	public String write(WMenuVo vo, HttpSession session) {
		int result = wms.write(vo);
		if (result != 1) {
			throw new IllegalStateException("식단표 작성 실패");
		}
		session.setAttribute("alertMsg", "식단표 작성 성공");
		return "redirect:/weekly/pmenu";
	}
	
	//식단표 수정
	@PostMapping("edit")
	public String edit(WMenuVo vo, HttpSession session) {
		
		int result = wms.edit(vo);
		if (result != 1) {
			throw new IllegalStateException("식단표 수정 실패");
		}
		session.setAttribute("alertMsg", "식단표 수정 성공");
		return "redirect:/weekly/pmenu";
		
	}
}
