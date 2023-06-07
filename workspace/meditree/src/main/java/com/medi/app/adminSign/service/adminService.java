package com.medi.app.adminSign.service;

import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medi.app.adminSign.dao.AdminSignDao;
import com.medi.app.adminSign.vo.AdminSignVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mySign.vo.MySignVo;

@Service
public class adminService {
	
	private final AdminSignDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public adminService(AdminSignDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}



	//결재대기 목록조회
	public List<AdminSignVo> getAdminSignList(PageVo pv) {
		return dao.getAdminSignList(sst, pv);
	}

	//결재대기 목록 페이지카운트
	public int getAdminSignListCnt() {
		return dao.getAdminSignListCnt(sst);
	}

	//사용자가 기안한 리스트 불러오기 (ajax)
	public List<MySignVo> getMySignList() {
		return dao.getMySignList(sst);
	}

	//사용자가 기안한 문서 자세히 불러오기 (ajax)
	public AdminSignVo selectSignDetail(String num) {
		return dao.selectSignDetail(sst, num);
	}

	//기안한 양식들 가져오기
	public ArrayList<Form> selectSignList() {
		return dao.selectSignList(sst);
	}

	//사용자가 기안한 양식 자세히보기
	public AdminSignVo getAdminSign(String num) {
		return dao.getAdminSign(sst, num);
	}

	//기안승인하기
	public int insertList(AdminSignVo vo) throws Exception {
		return dao.insertList(sst, vo);
	}

	//반려처리하기
	public int disapproval(AdminSignVo vo) {
		return dao.disapproval(sst, vo);
	}



}
