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
	
	private String enrollStatus;

}
