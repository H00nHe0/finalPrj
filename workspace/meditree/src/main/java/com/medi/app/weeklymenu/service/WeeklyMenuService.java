package com.medi.app.weeklymenu.service;

import java.time.LocalDate;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.weeklymenu.dao.WeeklyMenuDao;
import com.medi.app.weeklymenu.vo.WMenuVo;

@Service
@Transactional
public class WeeklyMenuService {

	private final WeeklyMenuDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public WeeklyMenuService(WeeklyMenuDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	
	}

	//환자식 조회
	public WMenuVo getWeeklyPmenu(LocalDate startOfWeek, LocalDate endOfWeek) {
		return dao.getWeeklyPmenu(sst,startOfWeek,endOfWeek);
	}

	//직원식 조회
	public WMenuVo getWeeklyEmenu(LocalDate startOfWeek, LocalDate endOfWeek) {
		return dao.getWeeklyEmenu(sst,startOfWeek,endOfWeek);
	}

	//식단표 작성
	public int write(WMenuVo vo) {
		return dao.write(sst,vo);
	}

	//식단표 수정
	public int edit(WMenuVo vo) {
		return dao.edit(sst,vo);
	}
	
}
