package com.medi.app.bipum.vo;

import java.util.List;

import com.medi.app.common.file.FileVo;

import lombok.Data;

@Data
public class BipumVo {
	
	private String no;
	private String name;
	private String content;
	private String enrollDate;
	private String delyn;
	private String amount;
	private List<FileVo> attList;
	

}
