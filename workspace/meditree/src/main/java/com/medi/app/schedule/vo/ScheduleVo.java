package com.medi.app.schedule.vo;

import lombok.Data;

@Data
public class ScheduleVo {

	private String no;
	private String title;
	private String content;
	private String calStart;
	private String calEnd;
	private String deleteYn;
}
