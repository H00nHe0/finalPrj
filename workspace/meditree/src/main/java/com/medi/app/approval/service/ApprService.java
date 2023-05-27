package com.medi.app.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.approval.dao.ApprDao;
import com.medi.app.approval.vo.ApprVo;
import com.medi.app.common.page.PageVo;

@Transactional
@Service
public class ApprService {
	
	private final ApprDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ApprService(ApprDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//목록조회
	public List<ApprVo> getApprList(PageVo pv) {
		return dao.getApprList(sst, pv);
	}

	//작성하기
	public int write(ApprVo vo) {
		return dao.write(sst, vo);
	}

	//페이징처리
	public int getApprListCnt() {
		return dao.getApprListCnt(sst);
	}

	//상세보기
	public ApprVo getAppr(String num) {
		return dao.getAppr(sst, num);
	}

	//수정하기
	public int edit(ApprVo vo) {
		return dao.edit(sst, vo);
	}
	
	//삭제하기
	public int delete(String num) {
		return dao.delete(sst, num);
	}

}



