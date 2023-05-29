package com.medi.app.schedule.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	public int insertEventToDB(ScheduleVo svo) {
		return sDao.insertEventToDB(sst, svo);
		
	}

	public int deleteEventFromDB(String title) {
		return sDao.deleteEventFromDB(sst, title);
	}

}
