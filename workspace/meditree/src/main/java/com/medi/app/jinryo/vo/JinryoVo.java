package com.medi.app.jinryo.vo;

import lombok.Data;

@Data
public class JinryoVo {
	
	private String no;
	private String jiDay;
	private String jiTime;
	private String dept;
	private String symptom;
	private String cxlYn;
	private String paNo;
	private String rmNo;
	
	//환자테이블 칼럼
	private String paName;
	private String rrn;
	private String paGender;
	
	//진료룸 테이블 칼럼
	private String emNo;
	private String empNo;
	private int age;
	
	

}
