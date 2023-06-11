package com.medi.app.reservation.vo;

import lombok.Data;

@Data
public class ReservationVo {

	
	private String no;
	private String type;
	private String useYn;
	private String note;
	
	//입원실 예약 처리용 vo
	private String admNo;
	private String admStart;
	private String admFinish;
	private String notice;
	private String paNo;
	private String emNo;
	private String prNo;
	private String price;
	private String namelist;
	private String count;
	private String date;
	private String workingDay;
	private String name;
	
	//수술실 예약처리용 vo
	private String srmNo;
	private String suDate;
	private String suStart;
	private String suEnd;
	private String dept;
	private String list;
	private String doctor;
	private String rmNo;
	private String acNo;
	private String title;
	
	//무엇인가 잘못됨
	private String content;
	private String calStart;
	private String calEnd;
	private String deleteYn;
}
