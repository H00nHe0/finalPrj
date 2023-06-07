package com.medi.app.reception.patient.vo;

import lombok.Data;

@Data
public class PatientVo {
	
	private String no;
	private String paName;
	private String paTel;
	private String rrn;
	private String paGender;
	private String caregiver;
	private String address;
	private String paDate;
	private String memo;
	
	//나중에 최근 내원일로 수정하기 + 최근 진료과도 + 최초 등록일 경우 빈칸 말고 최초 내원으로 변경하게 기능//05/17
	private String enrollStatus;
	
	//접수할 때 환자 기본 정보 테이블(PATIENT) RECEIPT(접수)테이블에 INSERT 할때 사용 
	private String wNo;
	private String pay;
	private String symptom;
	private String status;
	private String paNo;
	private String emNo;
	private String deptNo;
	private String name;
	private String deptName;
	private String title;
	private int age;
	
	//수납할때 접수번호 순으로 작업위한 변수
	private String reNo;
	private String jiDate;
	


}
