package com.medi.app.mySign.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medi.app.common.page.PageVo;
import com.medi.app.mySign.dao.MySignDao;
import com.medi.app.mySign.vo.MySignVo;

@Service
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

	//페이징처리
	public int getMySignListCnt() {
		return dao.getMySignListCnt(sst);
	}

	//기안문 작성하기
	public int write(MySignVo vo) {
		return dao.wirte(sst, vo);
	}

	

}
