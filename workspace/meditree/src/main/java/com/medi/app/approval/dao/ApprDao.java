package com.medi.app.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;

@Repository
public class ApprDao {

	//양식 목록조회
	public List<ApprVo> getApprList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("appr.getApprList", null, rb);
	}
	
	//양식 작성하기
	public int write(SqlSessionTemplate sst, ApprVo vo) {
		return sst.insert("appr.write", vo);
	}
	
	//양식 목록 조회  페이지 카운트
	public int getApprListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("appr.getApprListCnt");
	}

	//양식 수정하기
	public int edit(SqlSessionTemplate sst, ApprVo vo) {
		return sst.update("appr.edit", vo);
	}

	//양식 상세보기
	public ApprVo getAppr(SqlSessionTemplate sst, String num) {
		return sst.selectOne("appr.getAppr", num);
	}
	
	//양식 삭제하기
	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("appr.delete", num);
	}
	

}
