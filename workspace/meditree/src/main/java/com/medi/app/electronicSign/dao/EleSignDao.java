package com.medi.app.electronicSign.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.electronicSign.vo.EleSignVo;

@Repository
public class EleSignDao {

	//목록조회
	public List<EleSignVo> getEleSignList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("eleSign.getEleSignList", null, rb);
	}
	
	//목록조회 페이징
	public int getEleSignListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("eleSign.getEleSignListCnt");
	}

	//기안문 작성하기
	public int write(SqlSessionTemplate sst, EleSignVo vo) {
		return sst.insert("eleSign.write", vo);
	}

	//사용자 기안문작성하기 안에 결재양식 리스트 조회하기(ajax)
	public List<ApprVo> getApprList(SqlSessionTemplate sst) {
		return sst.selectList("eleSign.getApprList");
	}

	//사용자 결재양식 디테일 불러오기 (ajax)
	public EleSignVo selectFormDetail(SqlSessionTemplate sst, String num) {
		return sst.selectOne("eleSign.selectFormDetail", num);
	}

	//사용자가 작성한 결재문 자세히보기
	public EleSignVo getEleSign(SqlSessionTemplate sst, String num) {
		return sst.selectOne("eleSign.getEleSign", num);
	}

	//사용자가 작성한 결재문 수정하기
	public int edit(SqlSessionTemplate sst, EleSignVo vo) {
		return sst.update("eleSign.edit", vo);
	}

	//사용자가 작성한 결재문 삭제하기
	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("eleSign.delete", num);
	}

	//관리자가 결재문 승인하기
	public int approve(SqlSessionTemplate sst, String num) {
		return sst.update("eleSign.approve", num);
	}

	//관리자가 결재문 반려하기
	public int disapprove(SqlSessionTemplate sst, String num) {
		return sst.update("eleSign.disapprove", num);
	}


}
