package com.medi.app.mediDevice.vo;

import lombok.Data;

@Data
public class MediDeviceVo {
	
	private String no;
	private String name;
	private String type;
	private String content;
	private String rDate;
	private String status;
	private String location;
	
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	
}
