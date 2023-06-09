package com.medi.app.member.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVo {

   
   
	
	
	private String no;
	private String pwd;
	private String name;
	private String tel;
	private String email;
	private String address;
	private MultipartFile profile;
	private String profileName;
	private String birth;
	private String gender;
	private String signYn;
	private String deptNo;
	private String positionNo;
	private String quitYn;
	private String enrollDate;
	private int leaveRemain;
	private int useRemain;
	
	//department 테이블 칼럼변수
	private String title;
	//position 테이블 칼럼변수
	private String potitle;
	
	
	private String quitStatus;  
	
	
	
}