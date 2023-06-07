package com.medi.app.weeklymenu.dao;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.weeklymenu.vo.WMenuVo;

@Repository
public class WeeklyMenuDao {

	//환자식 조회
	public WMenuVo getWeeklyPmenu(SqlSessionTemplate sst, LocalDate startOfWeek, LocalDate endOfWeek) {
		Map<String, Object> menuMap = new HashMap<>();
		menuMap.put("startOfWeek", startOfWeek);
		menuMap.put("endOfWeek", endOfWeek);
		return sst.selectOne("weeklyMenu.getWeeklyPmenu",menuMap);
	}

	//직원식 조회
	public WMenuVo getWeeklyEmenu(SqlSessionTemplate sst, LocalDate startOfWeek, LocalDate endOfWeek) {
		Map<String, Object> menuMap = new HashMap<>();
		menuMap.put("startOfWeek", startOfWeek);
		menuMap.put("endOfWeek", endOfWeek);
		return sst.selectOne("weeklyMenu.getWeeklyEmenu",menuMap);
	}

	//식단표 작성
	public int write(SqlSessionTemplate sst, WMenuVo vo) {
		return sst.insert("weeklyMenu.write",vo);
	}

	//식단표 수정
	public int edit(SqlSessionTemplate sst, WMenuVo vo) {
		return sst.update("weeklyMenu.edit",vo);
	}
}
