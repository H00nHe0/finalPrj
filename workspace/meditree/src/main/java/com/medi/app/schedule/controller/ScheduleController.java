package com.medi.app.schedule.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

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
import com.medi.app.member.vo.MemberVo;
import com.medi.app.reservation.service.ReservationService;
import com.medi.app.reservation.vo.ReservationVo;
import com.medi.app.schedule.service.ScheduleService;
import com.medi.app.schedule.vo.ScheduleVo;

@Controller
@RequestMapping("member")
public class ScheduleController {
	
	//로그인한 멤버정보로 자신의 일정만확인할수 있도록.
	private ScheduleService ss;
	private MemberVo loginMember;
	
	@Autowired
	public ScheduleController(ScheduleService ss) {
		this.ss = ss;

	}
	public MemberVo getLoginMember() {
		return loginMember;
	}
	public void setLoginMember(MemberVo loginMember) {
		this.loginMember = loginMember;
	}

	public ScheduleController(MemberVo loginMember) {

		this.loginMember = loginMember;
	}
	
	@GetMapping("schedule")
	public void schedule() {
		
	}
	@GetMapping("pSchedule")
	public void pSchedule() {
		
	}
	
	@GetMapping("manageSchedule")
	public void manageSchedule() {
		
	}
	
	@PostMapping(value ="list.pCalendar", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectPCalendarList(HttpSession session, String emNo) {

	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	    System.out.println(loginMember);
	    
		List<ScheduleVo> pCalendar = ss.selectPCalendarList(emNo);
		return new Gson().toJson(pCalendar);
	}

	@PostMapping(value ="list.hosCalendar", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectHosCalendarList() {
		List<ScheduleVo> hosCalendar = ss.selectHosCalendarList();
		return new Gson().toJson(hosCalendar);
	}
				
	
	@PostMapping(value = "insertEventToDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertEventToDB(ScheduleVo svo, Model model, HttpSession session) {
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	    System.out.println(loginMember);
		model.addAttribute("svo",svo);
		//System.out.println(svo);
		int result =ss.insertEventToDB(svo);
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	
	@PostMapping(value = "deleteEventFromDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteEventFromDB(String title, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		System.out.println(title);
		 int emNo = Integer.parseInt(loginMember.getNo()); // 문자열을 정수로 변환
		 int result = ss.deleteEventFromDB(title, emNo);// 변환된 정수 값을 매퍼 메서드에 전달

		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	@PostMapping(value = "insertPEventToDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertPEventToDB(ScheduleVo svo, Model model,HttpSession session) {
	    MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		model.addAttribute("svo",svo);
		int result =ss.insertPEventToDB(svo);
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	
	@PostMapping(value = "deletePEventFromDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deletePEventFromDB(String title, HttpSession session) {
		//System.out.println(title);
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		//System.out.println(loginMember.getNo());
		 int emNo = Integer.parseInt(loginMember.getNo()); // 문자열을 정수로 변환
		 int result = ss.deletePEventFromDB(title, emNo); // 변환된 정수 값을 매퍼 메서드에 전달
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	
	
	//입원실 예약관련 캘린더
	//입원실 예약정보(캘린더) insert to DB
	@PostMapping(value = "insertPRSVNEventToDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertPRSVNEventToDB(ScheduleVo svo, Model model) {
		model.addAttribute("svo",svo);
		int result =ss.insertPRSVNEventToDB(svo);
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	//수술실 예약정보 insert to DB
	@PostMapping(value = "insertSRSVNEventToDB", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertSRSVNEventToDB(ReservationVo rvo, Model model) {
		model.addAttribute("rvo",rvo);
		System.out.println("수술실 예약정보 insert to DB : "+rvo);
		int result =ss.insertSRSVNEventToDB(rvo);
		//System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	
	@PostMapping(value ="list.pRoomCalendar", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectPRoomCalendarList() {
	    
		List<ScheduleVo> pRoomCalendar = ss.selectPRoomCalendarList();
		return new Gson().toJson(pRoomCalendar);
	}
	
	@PostMapping(value ="list.sRoomCalendar", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectSRoomCalendarList() {
	    
		List<ScheduleVo> sRoomCalendar = ss.selectSRoomCalendarList();
		return new Gson().toJson(sRoomCalendar);
	}
}
