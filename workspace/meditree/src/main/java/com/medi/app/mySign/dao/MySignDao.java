package com.medi.app.mySign.dao;

import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mySign.vo.MySignVo;

@Repository
public class MySignDao {

	//기안 목록 조회
	public List<MySignVo> getMySignList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("mySign.getMySignList", null, rb);
	}

	//기안 목록 조회 페이지 카운트
	public int getMySignListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("mySign.getMySignListCnt");
	}

	//기안문 작성하기
	public int write(SqlSessionTemplate sst, MySignVo vo) {
		return sst.insert("mySign.write", vo);
	}

	//기안할 양식 가져오기
	public ArrayList<Form> selectFormList(SqlSessionTemplate sst) {
		return sst.selectOne("mySign.selectFormList");
	}

	//결재양식 상세 불러오기 (ajax)
	public MySignVo selectFormDetail(SqlSessionTemplate sst, String num) {
		return sst.selectOne("mySign.selectFormDetail", num);
	}

	//결재양식 목록 불러오기 (ajax)
	public List<ApprVo> getApprList(SqlSessionTemplate sst) {
		return sst.selectList("mySign.getApprList");
	}

	//기안한거 상세보기
	public MySignVo getMySign(SqlSessionTemplate sst, String num) {
		return sst.selectOne("mySign.getMySign", num);
	}

	//기안한거 수정하기
	public int edit(SqlSessionTemplate sst, MySignVo vo) {
		return sst.update("mySign.edit", vo);
	}

	public int insertToAdmin(SqlSessionTemplate sst, MySignVo vo) {
		return sst.insert("mySign.insertToAdmin", vo);
	}

}
