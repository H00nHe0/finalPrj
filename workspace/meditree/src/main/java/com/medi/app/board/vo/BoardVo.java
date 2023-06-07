package com.medi.app.board.vo;

import java.util.List;

import com.medi.app.common.file.FileVo;

import lombok.Data;

@Data
public class BoardVo {

	private String no;
	private String enrollDate;
	private String empNo;
	private String title;
	private String content;
	private String hit;
	private String status;
	private String writerName;
	private String modifyDate;
	private List<FileVo> attList;
}
