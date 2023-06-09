package com.medi.app.schedule.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.member.vo.MemberVo;
import com.medi.app.reservation.vo.ReservationVo;
import com.medi.app.schedule.dao.ScheduleDao;
import com.medi.app.schedule.vo.ScheduleVo;

@Service
@Transactional
public class ScheduleService {
	private final SqlSessionTemplate sst;
	private final ScheduleDao sDao;
	
	@Autowired
	public ScheduleService(SqlSessionTemplate sst, ScheduleDao sDao) {
		this.sst = sst;
		this.sDao = sDao;
	}

	public List<ScheduleVo> selectHosCalendarList() {

		return sDao.selectHosCalendarList(sst);
	}

	public List<ScheduleVo> selectPCalendarList(String emNo) {
		return sDao.selectPCalendarList(sst, emNo);
	}
	
	public int insertEventToDB(ScheduleVo svo) {
		return sDao.insertEventToDB(sst, svo);
		
	}

	public int deleteEventFromDB(String title, int emNo) {
		return sDao.deleteEventFromDB(sst, title, emNo);
	}
	
	public int insertPEventToDB(ScheduleVo svo) {
		return sDao.insertPEventToDB(sst, svo);
	}

	public int deletePEventFromDB(String title, int emNo) {
		return sDao.deletePEventFromDB(sst, title, emNo);
	}

	public List<ScheduleVo> selectPRoomCalendarList() {
		return sDao.selectPRoomCalendarList(sst);
	}
	
	public List<ScheduleVo> selectSRoomCalendarList() {
		return sDao.selectSRoomCalendarList(sst);
	}

	public int insertPRSVNEventToDB(ScheduleVo svo) {
		return sDao.insertPRSVNEventToDB(sst, svo);
	}
	public int insertSRSVNEventToDB(ReservationVo rvo) {
		return sDao.insertSRSVNEventToDB(sst, rvo);
	}



}
