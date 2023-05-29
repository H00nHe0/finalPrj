package com.medi.app.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.medi.app.schedule.service.ScheduleService;
import com.medi.app.schedule.vo.ScheduleVo;



@Controller
@RequestMapping("member")
public class ScheduleController {
	
	
	private final ScheduleService ss;

	@Autowired
	public ScheduleController(ScheduleService ss) {
		this.ss = ss;
	}
	
	@GetMapping("schedule")
	public void schedule() {
		
	}

	@GetMapping("pSchedule")
	public void pSchedule() {
		
	}
	@PostMapping(value ="list.hosCalendar", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectHosCalendarList() {
		List<ScheduleVo> hosCalendar = ss.selectHosCalendarList();
		return new Gson().toJson(hosCalendar);
	}
	
	@PostMapping(value = "insertEventToDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertEventToDB(ScheduleVo svo, Model model) {
		model.addAttribute("svo",svo);
		//System.out.println(svo);
		int result =ss.insertEventToDB(svo);
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	
	@PostMapping(value = "deleteEventFromDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteEventFromDB(String title) {
		System.out.println(title);
		int result = ss.deleteEventFromDB(title);
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}

	
}
