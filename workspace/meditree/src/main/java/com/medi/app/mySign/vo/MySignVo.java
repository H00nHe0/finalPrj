package com.medi.app.mySign.vo;

import java.util.List;

import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.file.FileVo;

import lombok.Data;

@Data
public class MySignVo {
	
	private String no;
	private String signTitle;
	private String content;
	private String apprTitle;
	private String enrollDate;
	private String status;
	private String delyn;
	private String modifyDate;
	private List<FileVo> attList;
	private ApprVo avo;
}
