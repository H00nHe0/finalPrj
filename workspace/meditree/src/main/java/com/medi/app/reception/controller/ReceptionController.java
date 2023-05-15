package com.medi.app.reception.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	

	//접수 화면(to HOON - MAKE DEPARTMENT LIST !!!!)
	@GetMapping("reception")
	public String reception(Model model,MemberVo mvo) {
		
		//진료과 조회
		System.out.println("겟메핑으로 진료과 조회서비스시작");
		List<MemberVo> mvoList = ps.getDoctorList(mvo);
		/* List<MemberVo> mvoList = ps.getDeptList(mvo, searchMap); */
		/* List<Map<String, String>> cvoList = ps.getCategoryList(); */
		
		//진료과 화면
		/* model.addAttribute("cvoList", cvoList); */
		model.addAttribute("mvoList", mvoList);
		System.out.println("mvoList!!! = "+mvoList);
		/*
		 * model.addAttribute("searchMap" , searchMap);
		 * System.out.println("searchMap = "+searchMap);
		 */
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
		model.addAttribute("searchMap" , searchMap);
		model.addAttribute("pv" , pv);

		return "member/simplePatientCheck";
		
	}
	//patient select
	@PostMapping(value ="selectName", produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectName(Model model, String paName) {
		System.out.println("got data ="+paName);

	    try {
	        PatientVo vo = ps.getPaInfo(paName);

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
	
	//수정 짱많이 필요~~~ 환자정보랑 진료과 선택한거랑 의사 선택한거 한꺼번에 업데이트하고 넘겨야됨
	@PostMapping("sendToWaiting")
	public String sendToWaitng(@RequestParam Map<String , String> searchMap, Model model, String num) {
		//서비스
		List<PatientVo> pvoList = ps.sendToWaitng(searchMap);
		
		//화면
		model.addAttribute("pvoList" , pvoList);
		model.addAttribute("searchMap" , searchMap);
		
		
		return "/member/reception";
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
	
	
	@GetMapping("rsvnInpatientRm")
	public void rsvnInpatientRm() {
		
	}
	@GetMapping("rsvnOperatingRm")
	public void rsvnOperatingRm() {
		
	}

}
