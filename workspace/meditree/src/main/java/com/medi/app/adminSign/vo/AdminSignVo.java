package com.medi.app.adminSign.vo;

import com.medi.app.mySign.vo.MySignVo;

import lombok.Data;

@Data
public class AdminSignVo {
	
	private String no;
	private String title;
	private String content;
	private String enroll_date;
	private String status;
	private String delyn;
	private String modifyDate;
	private MySignVo mvo;

}
