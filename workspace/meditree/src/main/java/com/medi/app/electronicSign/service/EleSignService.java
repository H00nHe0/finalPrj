package com.medi.app.electronicSign.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.electronicSign.dao.EleSignDao;
import com.medi.app.electronicSign.vo.EleSignVo;

@Service
@Transactional
public class EleSignService {
	
	private final EleSignDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public EleSignService(EleSignDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//목록조회
	public List<EleSignVo> getEleSignList(PageVo pv) {
		return dao.getEleSignList(sst, pv);
	}

	//목록조회 리스트 페이징
	public int getEleSignListCnt() {
		return dao.getEleSignListCnt(sst);
	}

	//기안문 작성하기
	public int write(EleSignVo vo) throws Exception {
		return dao.write(sst, vo);
	}

	//사용자 기안문작성하기 안에 결재양식 리스트 조회하기(ajax)
	public List<ApprVo> getApprList() {
		return dao.getApprList(sst);
	}

	//사용자 결재양식 디테일 불러오기 (ajax)
	public EleSignVo selectFormDetail(String num) {
		return dao.selectFormDetail(sst, num);
	}

	//사용자가 작성한 결재문 자세히보기
	public EleSignVo getEleSign(String num) {
		return dao.getEleSign(sst, num);
	}

	//사용자가 작성한 결재문 수정하기
	public int edit(EleSignVo vo) {
		return dao.edit(sst, vo);
	}

	//사용자가 작성한 결재문 삭제하기
	public int delete(String num) {
		return dao.delete(sst, num);
	}

	//관리자가 결재문 승인하기
	public int approve(String num) {
		return dao.approve(sst, num);
	}

	//관리자가 결재문 반려하기
	public int disapprove(String num) {
		return dao.disapprove(sst, num);
	}

	
	
	

}
