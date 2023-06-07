package com.medi.app.approval.vo;

import java.util.List;

import com.medi.app.common.file.FileVo;

import lombok.Data;

@Data
public class ApprVo {
	
	private String no;
	private String formTitle;
	private String content;
	private String info;
	private String enrollDate;
	private String status;
	private String delyn;
	private String modifyDate;
	private List<FileVo> attList;
	
}
