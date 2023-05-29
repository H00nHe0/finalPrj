package com.medi.app.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.medi.app.schedule.vo.ScheduleVo;

@Repository
public class ScheduleDao {

	public List<ScheduleVo> selectHosCalendarList(SqlSessionTemplate sst) {

		List<ScheduleVo> calendar = sst.selectList("schedule.hosCalendarList");
		return calendar;
	}

	public int insertEventToDB(SqlSessionTemplate sst, ScheduleVo svo) {

		return sst.insert("schedule.insertEventToDB", svo);
	}

	public int deleteEventFromDB(SqlSessionTemplate sst, String title) {

		return sst.update("schedule.deleteEventFromDB", title);
	}

}
