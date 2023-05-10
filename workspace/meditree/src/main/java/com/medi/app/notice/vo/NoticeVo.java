package com.medi.app.notice.vo;

import java.util.List;

import com.medi.app.common.file.FileVo;

import lombok.Data;

@Data
public class NoticeVo {
	
	private String no;
	private String title;
	private String content;
	private String enrollDate;
	private String hit;
	private String writerNo;
	private String status;
	private String modifyDate;
	private List<FileVo> attList;
	
	
}
