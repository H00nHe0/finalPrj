package com.medi.app.mail.vo;

import java.util.List;

import com.medi.app.common.file.FileVo;

import lombok.Data;

@Data
public class MailVo {

	private String no;
	private String title;
	private String writer;
	private String writerName;
	private String receiver;
	private String receiverName;
	private String content;
	private String status;
	private String enrollDate;
	private List<FileVo> attList;
	
}
