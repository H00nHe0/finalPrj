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
	// 노가다로 할때 td 늘려놨던거 반복문안되면 써야 하는데 값없을때 사진도 안뜨게 ??
	@GetMapping("chartView")
	public void chartView(MemberVo vo, Model model) {

	}
	// 일반내과
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
	// 수술실간로사
	@PostMapping(value = "emer", produces = "application/text; charset=utf8")
	@ResponseBody
	public String emer(Model model, String major) {

	    try {
	        List<MemberVo> mvoList = os.emer(major);

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

	// 일반실간로사
	@PostMapping(value = "pRm", produces = "application/text; charset=utf8")
	@ResponseBody
	public String pRm(Model model, String major) {

	    try {
	        List<MemberVo> mvoList = os.pRm(major);

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
	
	@PostMapping(value = "receipt", produces = "application/text; charset=utf8")
	@ResponseBody
	public String receipt(Model model, String major) {

	    try {
	        List<MemberVo> mvoList = os.receipt(major);

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
	
	@PostMapping(value = "management", produces = "application/text; charset=utf8")
	@ResponseBody
	public String management(Model model, String major) {

	    try {
	        List<MemberVo> mvoList = os.management(major);

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
