package com.medi.app.reception.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import com.medi.app.common.page.PageVo;
import com.medi.app.member.dao.MemberDao;
import com.medi.app.member.service.MemberService;
import com.medi.app.member.vo.DeptVo;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.service.PatientService;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.reservation.vo.ReservationVo;

@Controller
@RequestMapping("member")
public class ReceptionController {
	
	private final PatientService ps;

	@Autowired
	public ReceptionController(PatientService x) {
		this.ps = x;
	}

	//접수 화면
	@GetMapping("reception")
	public String reception(Model model,MemberVo mvo) {

		//진료과 조회
		List<Map<String, String>> mvoList = ps.getDepartmentList();
		List<MemberVo> evoList = ps.getDoctorList();
		
		//진료과 화면
		//진료과목선택 및 진료의 선택
		model.addAttribute("mvoList", mvoList);
		model.addAttribute("evoList", evoList);
		System.out.println("mvoList!!! = "+mvoList);
		System.out.println("evoList!!! = "+evoList);
	
		return "/member/reception";
				}
	
	//접수 로직
	@PostMapping("reception")
	public String enroll(PatientVo vo , HttpServletRequest req , HttpSession session , Model model) throws Exception {
		//서비스
		int result = ps.enroll(vo);	
		
		if(result != 1) {
			//에러메세지 담아서
			session.setAttribute("alertMsg", "환자등록 실패");
			return "common/error";
		}
		List<Map<String, String>> mvoList = ps.getDepartmentList();
		List<MemberVo> evoList = ps.getDoctorList();
		model.addAttribute("mvoList", mvoList);
		model.addAttribute("evoList", evoList);
		
		session.setAttribute("alertMsg", "환자등록 성공");
		session.setAttribute("pvo", vo);
		return "/member/reception";
	}
	
	//간편 환자조회
	@GetMapping("simplePatientCheck")
	public String simplePatientCheck(@RequestParam(defaultValue = "1") int page ,@RequestParam Map<String , String> searchMap, Model model, String num) throws Exception{
		//데이터
		int listCount = ps.getCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		

		//서비스
		List<PatientVo> pvoList = ps.getSimplePatientList(pv, searchMap);
		
		//화면
		model.addAttribute("pvoList" , pvoList);
		//System.out.println(pvoList);
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);

		return "member/simplePatientCheck";
		
	}
	
	//patient select
	@PostMapping(value ="selectName", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectName(Model model, String paNo) {
		System.out.println("got data ="+paNo);

	    try {
	        PatientVo vo = ps.getPaInfo(paNo);

	        if (vo != null) {
	            model.addAttribute("vo", vo);
	            System.out.println("is not null & vo ="+ vo);
	            Gson gson = new Gson();
	            String str = gson.toJson(vo);

	            
	            return str;
	        }
	        System.out.println("is null & vo ="+ vo);
			 return "/member/reception";
				    } catch (Exception e) {
			
				    }

				    return "/member/reception";
				}
	
	
		// 진료 접수
		@ResponseBody
		@RequestMapping("insert.tr")
		public String ajaxInsertTreatment(PatientVo pvo, HttpSession session, Model model) {
			model.addAttribute("pvo", pvo);
			//System.out.println(pvo);
			int result = ps.insertTreatment(pvo);
			//System.out.println(result +"+"+pvo);
			
	
			return result > 0 ? "success" : "fail";
	
		}
		//진료관리 페이지
		@RequestMapping("checkList.tr")
		public String reception(Model model) {
			List<Map<String, String>> deptList = ps.getDepartmentList();
			List<MemberVo> doctorList = ps.getDoctorList();
			
			//System.out.println(deptList);
			//System.out.println(doctorList);
			
			model.addAttribute("deptList", deptList);
			model.addAttribute("doctorList", doctorList);
			
			return "redirect:/member/reception"; 
		}
		
		// 진료 대기, 진료중 환자 조회
		@ResponseBody
		@RequestMapping(value = "treatList.tr")
		public Map<String, Object> returnMap() throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();

			List<MemberVo> wlist = ps.selectWaitingPatient();
			//System.out.println(wlist);
			List<MemberVo> plist = ps.selectIngPatient();

			/* map.put(jsp에서 사용할 이름, 넘길 자바변수); */
			map.put("wlist", wlist);
			map.put("plist", plist);

			return map;
		}
		// 진료중으로 상태변경
		@ResponseBody
		@RequestMapping("change.tr")
		public String changePatientStatus(@RequestParam("changeArray[]") int[] changeArray, Model model) {


			int result = 0;
			for (int no : changeArray) {
				result = ps.changePatientStatus(no);
				PatientVo pv = ps.insertJinryo(no);
				model.addAttribute("pv", pv);
				int insert = ps.insertJinryoIng(pv);
				if(insert != 1) {
					System.out.println("인서트 안됨");
				}

			}

			return result > 0 ? "success" : "fail";
		}
		//선택한 과로 대기 리스트 조회하기
		@ResponseBody
		@RequestMapping(value = "wlist.pt")
		public Map<String, Object> returnDeptMap(String deptNo) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();

			List<MemberVo> wlist = ps.wlistSortByDept(deptNo);
			//System.out.println(wlist);

			/* map.put(jsp에서 사용할 이름, 넘길 자바변수); */
			map.put("wlist", wlist);

			return map;
		}
		//선택한 과로 진료중 리스트 조회하기
		@ResponseBody
		@RequestMapping(value = "plist.pt")
		public Map<String, Object> returnDeptMap2(String deptNo) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();

			List<MemberVo> plist = ps.plistSortByDept(deptNo);
			//System.out.println(plist);

			/* map.put(jsp에서 사용할 이름, 넘길 자바변수); */
			map.put("plist", plist);

			return map;
		}
		
		//예약대기환자 조회
		@ResponseBody
		@RequestMapping(value = "rsvWaitinglist.pt")
		public Map<String, Object> returnrsvWaitingMap() throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();

			List<MemberVo> slist = ps.surgeryWaitingList();
			System.out.println(slist);
			List<MemberVo> plist = ps.proomWaitingList();
			System.out.println(plist);

			
			/* map.put(jsp에서 사용할 이름, 넘길 자바변수); */
			map.put("slist", slist);
			map.put("plist", plist);

			return map;
		}

	@GetMapping("receiveManage")
	public String receiveManage(@RequestParam(defaultValue = "1") int page ,@RequestParam Map<String , String> searchMap, Model model, String num) {
		//데이터
		int listCount = ps.getReceiptCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		//서비스
		List<PatientVo> receiptList = ps.getreceiptList(pv, searchMap);
		
		//화면
		model.addAttribute("receiptList" , receiptList);
		System.out.println(receiptList);
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);
		System.out.println(pv);
		return "member/receiveManage";
	}
	@GetMapping("receiveDonePage")
	public String receiveDonePage(@RequestParam(defaultValue = "1") int page ,@RequestParam Map<String , String> searchMap, Model model, String num) {
		//데이터
		int listCount = ps.getReceiptDoneCnt(searchMap);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		//서비스
		List<MemberVo> payDoneList = ps.payDoneList(pv, searchMap);
		
		//화면
		model.addAttribute("payDoneList" , payDoneList);
		System.out.println(payDoneList);
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);
		System.out.println(pv);
		return "member/receiveDonePage";
	}

	@ResponseBody
	@RequestMapping(value = "changeToReceipt.done")
	public String changeToReceipt(Model model, @RequestParam("selectedNoArr[]") int[] selectedNoArr){
		System.out.println("DB로 넘어가는 no:"+selectedNoArr);
			
		int result = 0;
		for (int no : selectedNoArr) {
			result = ps.changeToReceipt(no);
			System.out.println(result);
	}		
		return result > 0 ? "success" : "fail";
	}
	
	
	
	
	
	@GetMapping("rsvnWaiting") 
	public void rsvnWaiting(){
	 
	}
	
	//입원실 현황페이지
	@GetMapping("roomCheck")
	public void roomCheck(@RequestParam(value = "cDate", defaultValue = "0") String cDate, Model model) throws ParseException {
		// thead에 들어갈 입원실 목록 조회
				ArrayList<ReservationVo> roomList = ps.selectPRoomList();
				model.addAttribute("roomList", roomList);
				
				if (cDate.equals("0")) { // 전달받은 cDate가 없으면 현재달로 입원실 현황 조회

					// 오늘 날짜 구해서 String으로 형변환
					GregorianCalendar cal = new GregorianCalendar();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String nowDate = sdf.format(cal.getTime());
		
					String today2 = sdf.format(cal.getTime()); // 오늘날짜 tr css용

					// 화면에 출력할 현재날짜(yyyy년 mm월)
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월");
					String showDate = sdf2.format(cal.getTime());
					
					SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy년 MM월 dd일 (E요일)");
					String today = sdf3.format(cal.getTime());

					// 전월 날짜 구하기
					cal.add(GregorianCalendar.MONTH, -1);
					String preDate = sdf.format(cal.getTime());

					// 다음 날짜 구하기
					cal.add(GregorianCalendar.MONTH, +2);
					String nextDate = sdf.format(cal.getTime());

					// String으로 형변환한 오늘 날짜 전달해서 이번달 1일~말일 구하기
					ArrayList<ReservationVo> dayList = ps.selectDateList(nowDate);

					// 예약중인 환자 리스트 조회
					ArrayList<ReservationVo> bookingList = ps.selectPRoomBookingList(nowDate);

					model.addAttribute("dayList", dayList);
					model.addAttribute("showDate", showDate);
					model.addAttribute("nowDate", nowDate);
					model.addAttribute("today", today); // fix 용
					model.addAttribute("today2", today2); // 오늘날짜 tr css용
					model.addAttribute("preDate", preDate);
					model.addAttribute("nextDate", nextDate);
					model.addAttribute("bookingList", bookingList);
					System.out.println(bookingList);
				} else {

					// 오늘 날짜 구해서 String으로 형변환
					GregorianCalendar cal = new GregorianCalendar();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String nowDate = cDate;
					String today2 = sdf.format(cal.getTime()); // 오늘날짜 tr css용
					
					// 전달받은 날짜 Date로 변환
					Date tempt = sdf.parse(cDate);
					
					// fix로 보여줄 오늘날짜
					SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy년 MM월 dd일 (E요일)");
					String today = sdf3.format(cal.getTime());
					
					// 전달받은 날짜 대입
					cal.setTime(tempt);
					
					// 화면에 출력할 현재날짜(yyyy년 mm월)
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월");
					String showDate = sdf2.format(cal.getTime());


					
					// 전월 날짜 구하기
					cal.add(GregorianCalendar.MONTH, -1);
					String preDate = sdf.format(cal.getTime());

					// 다음 날짜 구하기
					cal.add(GregorianCalendar.MONTH, +1);
					String nextDate = sdf.format(cal.getTime());

					// String으로 형변환한 오늘 날짜 전달해서 이번달 1일~말일 구하기
					ArrayList<ReservationVo> dayList = ps.selectDateList(nowDate);

					//System.out.println(dayList);
				
	}}
				//수술실 현황페이지
				@GetMapping("sRoomCheck")
				public void sRoomCheck(@RequestParam(value = "cDate", defaultValue = "0") String cDate, Model model) throws ParseException {
					// thead에 들어갈 입원실 목록 조회
							ArrayList<ReservationVo> sRoomList = ps.selectSRoomList();
							model.addAttribute("sRoomList", sRoomList);
							
							if (cDate.equals("0")) { // 전달받은 cDate가 없으면 현재달로 입원실 현황 조회

								// 오늘 날짜 구해서 String으로 형변환
								GregorianCalendar cal = new GregorianCalendar();
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String nowDate = sdf.format(cal.getTime());
					
								String today2 = sdf.format(cal.getTime()); // 오늘날짜 tr css용

								// 화면에 출력할 현재날짜(yyyy년 mm월)
								SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월");
								String showDate = sdf2.format(cal.getTime());
								
								SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy년 MM월 dd일 (E요일)");
								String today = sdf3.format(cal.getTime());

								// 전월 날짜 구하기
								cal.add(GregorianCalendar.MONTH, -1);
								String preDate = sdf.format(cal.getTime());

								// 다음 날짜 구하기
								cal.add(GregorianCalendar.MONTH, +2);
								String nextDate = sdf.format(cal.getTime());

								// String으로 형변환한 오늘 날짜 전달해서 이번달 1일~말일 구하기
								ArrayList<ReservationVo> dayList = ps.selectDateList(nowDate);

								// 예약중인 환자 리스트 조회
								ArrayList<ReservationVo> sBookingList = ps.selectSRoomBookingList(nowDate);
								System.out.println(sBookingList);
								model.addAttribute("dayList", dayList);
								model.addAttribute("showDate", showDate);
								model.addAttribute("nowDate", nowDate);
								model.addAttribute("today", today); // fix 용
								model.addAttribute("today2", today2); // 오늘날짜 tr css용
								model.addAttribute("preDate", preDate);
								model.addAttribute("nextDate", nextDate);
								model.addAttribute("sBookingList", sBookingList);
							} else {

								// 오늘 날짜 구해서 String으로 형변환
								GregorianCalendar cal = new GregorianCalendar();
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String nowDate = cDate;
								String today2 = sdf.format(cal.getTime()); // 오늘날짜 tr css용
								
								// 전달받은 날짜 Date로 변환
								Date tempt = sdf.parse(cDate);
								
								// fix로 보여줄 오늘날짜
								SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy년 MM월 dd일 (E요일)");
								String today = sdf3.format(cal.getTime());
								
								// 전달받은 날짜 대입
								cal.setTime(tempt);
								
								// 화면에 출력할 현재날짜(yyyy년 mm월)
								SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월");
								String showDate = sdf2.format(cal.getTime());


								
								// 전월 날짜 구하기
								cal.add(GregorianCalendar.MONTH, -1);
								String preDate = sdf.format(cal.getTime());

								// 다음 날짜 구하기
								cal.add(GregorianCalendar.MONTH, +2);
								String nextDate = sdf.format(cal.getTime());

								// String으로 형변환한 오늘 날짜 전달해서 이번달 1일~말일 구하기
								ArrayList<ReservationVo> dayList = ps.selectDateList(nowDate);

								//System.out.println(dayList);
							
				}
	
	

}
				}
