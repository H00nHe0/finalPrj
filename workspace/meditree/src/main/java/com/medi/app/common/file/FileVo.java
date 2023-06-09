package com.medi.app.common.file;

import lombok.Data;

@Data
public class FileVo {
	
	private String no;
	private String originName;
	private String changeName;
	 
	private long size; // 파일 크기 변수
	private String filePath; // 파일 경로 변수

	    // getter와 setter 메서드
	    public long getSize() {
	        return size;
	    }
	    public void setSize(long size) {
	        this.size = size;
	    }
	    public String getFilePath() {
	        return filePath;
	    }
	    public void setFilePath(String filePath) {
	        this.filePath = filePath;
	    }
	
}
