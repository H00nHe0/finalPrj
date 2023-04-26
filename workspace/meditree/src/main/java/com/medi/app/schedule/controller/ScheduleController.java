package com.medi.app.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class ScheduleController {
	
	@GetMapping("schedule")
	public void schedule() {
		
	}

	@GetMapping("pSchedule")
	public void pSchedule() {
		
	}

}
