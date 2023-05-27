package com.medi.app.mySign.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public int wirte(SqlSessionTemplate sst, MySignVo vo) {
		return sst.insert("mySign.write", vo);
	}

}
