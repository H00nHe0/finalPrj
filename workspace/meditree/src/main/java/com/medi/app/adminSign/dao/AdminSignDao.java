package com.medi.app.adminSign.dao;

import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.adminSign.vo.AdminSignVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mySign.vo.MySignVo;

@Repository
public class AdminSignDao {

	//결재 대기 목록 조회
	public List<AdminSignVo> getAdminSignList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("adminSign.getAdminSignList", null, rb);
	}
	
	//결재 대기 문서들 페이징 처리
	public int getAdminSignListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("adminSign.getAdminSignListCnt");
	}
	
	//사용자가 기안한 양식 목록 불러오기(ajax)
	public List<MySignVo> getMySignList(SqlSessionTemplate sst) {
		return sst.selectList("adminSign.getMySignList");
	}

	//사용자가 기안한 내용 상세 불러오기(ajax)
	public AdminSignVo selectSignDetail(SqlSessionTemplate sst, String num) {
		return sst.selectOne("adminSign.selectSignDetail", num);
	}

	//기안할 양식들 가져오기
	public ArrayList<Form> selectSignList(SqlSessionTemplate sst) {
		return sst.selectOne("adminSign.selectSignList");
	}

	//사용자가 기안한 양식 자세히보기
	public AdminSignVo getAdminSign(SqlSessionTemplate sst, String num) {
		return sst.selectOne("adminSign.getAdminSign", num);
	}

	//기안승인하기
	public int insertList(SqlSessionTemplate sst, AdminSignVo vo) {
		return sst.insert("adminSign.insertList", vo);
	}

	//반려처리하기
	public int disapproval(SqlSessionTemplate sst, AdminSignVo vo) {
		return sst.update("adminSign.disapproval", vo);
	}



}
