package com.medi.app.organization.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.organization.service.OrganizationService;


@Controller
@RequestMapping("organization")
public class OrganizationController {
	private final OrganizationService os;

	@Autowired
	public OrganizationController(OrganizationService os) {
		this.os = os;
	}

	// 어찌어찌 노가다로 ajax로 바꾸긴함.
	// 고쳐야 할거 -> jsp파일 스크립트 코드 너무 노가다여서 방안 물어보기(반복문같은)
	// 노가다로 할때 td 늘려놨던거 반복문안되면 써야 하는데 값없을때 사진도 안뜨게 ??
	@GetMapping("chartView")
	public void chartView(MemberVo vo, Model model) {


	}

	// 내과
	@PostMapping(value = "surgery", produces = "application/text; charset=utf8")
	@ResponseBody
	public String surgery(Model model, String major) {

		System.out.println(major);
		try {
			List<MemberVo> mvoList = os.selectSurgery(major);

			if (mvoList != null) {
				model.addAttribute("mvoList", mvoList);
				System.out.println(mvoList);
				Gson gson = new Gson();
				String json = gson.toJson(mvoList);
				System.out.println(json);
				return json;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "organization/chartView"; 

	}

	// 정신과
	@PostMapping(value = "generalMedicine", produces = "application/text; charset=utf8")
	@ResponseBody
	public String generalMedicine(Model model, String major) {

		try {
			List<MemberVo> mvoList = os.generalMedicine(major);

			if (mvoList != null) {
				model.addAttribute("mvoList", mvoList);
				Gson gson = new Gson();
				String json = gson.toJson(mvoList);

				return json;
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return "organization/chartView"; 

	}

	// 이비인후과
	@PostMapping(value = "psychiatry", produces = "application/text; charset=utf8")
	@ResponseBody
	public String psychiatry(Model model, String major) {

		try {
			List<MemberVo> mvoList = os.psychiatry(major);

			if (mvoList != null) {
				model.addAttribute("mvoList", mvoList);
				Gson gson = new Gson();
				String json = gson.toJson(mvoList);

				return json;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "organization/chartView";

	}

	// 산부과
	@PostMapping(value = "ent", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ent(Model model, String major) {

	    try {
	        List<MemberVo> mvoList = os.ent(major);

	        if (mvoList != null) {
		        model.addAttribute("mvoList", mvoList);			
				  Gson gson = new Gson(); String json = gson.toJson(mvoList);

	            return json;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "organization/chartView";
			

				}

}
