package com.medi.app.reception.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		System.out.println("겟메핑으로 진료과 조회서비스시작");
		List<Map<String, String>> mvoList = ps.getDepartmentList();
		List<MemberVo> evoList = ps.getDoctorList();
		
		//진료과 화면
		//진료과목선택 및 진료의 선택
		model.addAttribute("mvoList", mvoList);
		//System.out.println("mvo리스트담김");
		model.addAttribute("evoList", evoList);
		//System.out.println("evo리스트 담김");
		System.out.println("mvoList!!! = "+mvoList);
		System.out.println("evoList!!! = "+evoList);

		
		return "/member/reception";
				}
	
	//접수 
	@PostMapping("reception")
	public String enroll(PatientVo vo , HttpServletRequest req , HttpSession session , Model model) throws Exception {
		//서비스
		int result = ps.enroll(vo);
		
		
		if(result != 1) {
			//에러메세지 담아서
			session.setAttribute("alertMsg", "환자등록 실패");
			return "common/error";
		}

	    // 현재 날짜를 구하고 패턴을 변경
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	    String currentDate = dateFormat.format(new Date());
	    
	    // PatientVo 객체의 enrollStatus와 paDate를 설정
//	    vo.setEnrollStatus("첫 방문");
//	    vo.setPaDate(currentDate+" (첫 방문)");
//	    
//		PatientVo pvo = new PatientVo();
		session.setAttribute("alertMsg", "환자등록 성공");
//		session.setAttribute("pvo", vo);
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
	public void receiveManage() {

	}

	
	@GetMapping("rsvnWaiting") 
	public void rsvnWaiting(){
	 
	}
	
	@GetMapping("roomCheck")
	public void roomCheck() {
		
	}
	
	
	@GetMapping("rsvnOperatingRm")
	public void rsvnOperatingRm() {
		
	}

}
