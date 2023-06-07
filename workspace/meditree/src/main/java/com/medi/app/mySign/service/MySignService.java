package com.medi.app.mySign.service;

import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mySign.dao.MySignDao;
import com.medi.app.mySign.vo.MySignVo;

@Service
@Transactional
public class MySignService {
	
	private final MySignDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MySignService(MySignDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//목록조회
	public List<MySignVo> getMySignList(PageVo pv) {
		return dao.getMySignList(sst, pv);
	}

	//기안문 페이징처리
	public int getMySignListCnt() {
		return dao.getMySignListCnt(sst);
	}

	//기안문 작성하기
	public int write(MySignVo vo) throws Exception {
		return dao.write(sst, vo);
	}

	//기안문 선택하기 리스트
	public ArrayList<Form> selectFormList() {
		return dao.selectFormList(sst);
	}

	//사용자 결재양식 자세히 불러오기 (ajax)
	public MySignVo selectFormDetail(String num) {
		return dao.selectFormDetail(sst, num);
	}

	//결재문서 리스트 불러오기
	public List<ApprVo> getApprList() {
		return dao.getApprList(sst);
	}

	//기안문 작성한거 상세보기
	public MySignVo getMySign(String num) {
		return dao.getMySign(sst, num);
	}

	//기안문 수정하기
	public int edit(MySignVo vo) {
		return dao.edit(sst, vo);
	}

	public int insertToAdmin(MySignVo vo) {
		return dao.insertToAdmin(sst, vo);
	}

}
