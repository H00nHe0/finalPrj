package com.medi.app.schedule.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.medi.app.member.vo.MemberVo;
import com.medi.app.reservation.vo.ReservationVo;
import com.medi.app.schedule.vo.ScheduleVo;

@Repository
public class ScheduleDao {

	public List<ScheduleVo> selectHosCalendarList(SqlSessionTemplate sst) {

		List<ScheduleVo> calendar = sst.selectList("schedule.hosCalendarList");
		return calendar;
	}

	public List<ScheduleVo> selectPCalendarList(SqlSessionTemplate sst,String emNo) {
		List<ScheduleVo> calendar = sst.selectList("schedule.pCalendarList", emNo);
		return calendar;
	}
	
	public int insertEventToDB(SqlSessionTemplate sst, ScheduleVo svo) {

		return sst.insert("schedule.insertEventToDB", svo);
	}

	public int deleteEventFromDB(SqlSessionTemplate sst, String title, int emNo) {
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("title", title);
	    parameterMap.put("emNo", emNo);
		return sst.update("schedule.deleteEventFromDB", parameterMap);
	}

	public int insertPEventToDB(SqlSessionTemplate sst, ScheduleVo svo) {
		return sst.insert("schedule.insertPEventToDB", svo);
	}

//	public int deletePEventFromDB(SqlSessionTemplate sst, String title, int emNo) {
//		return sst.update("schedule.deletePEventFromDB", title);
//	}
	public int deletePEventFromDB(SqlSessionTemplate sst, String title, int emNo) {
	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("title", title);
	    parameterMap.put("emNo", emNo);
	    return sst.update("schedule.deletePEventFromDB", parameterMap);
	}

	public List<ScheduleVo> selectPRoomCalendarList(SqlSessionTemplate sst) {
		List<ScheduleVo> calendar = sst.selectList("schedule.selectPRoomCalendarList");
		return calendar;
	}
	public List<ScheduleVo> selectSRoomCalendarList(SqlSessionTemplate sst) {
		List<ScheduleVo> calendar = sst.selectList("schedule.selectSRoomCalendarList");
		return calendar;
	}

	public int insertPRSVNEventToDB(SqlSessionTemplate sst, ScheduleVo svo) {
		return sst.insert("schedule.insertPRSVNEventToDB", svo);
	}
	public int insertSRSVNEventToDB(SqlSessionTemplate sst, ReservationVo rvo) {
		return sst.insert("schedule.insertSRSVNEventToDB", rvo);
	}

	



}
