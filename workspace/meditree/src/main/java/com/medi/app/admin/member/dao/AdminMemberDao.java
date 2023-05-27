package com.medi.app.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.common.page.PageVo;
import com.medi.app.member.vo.MemberVo;

@Repository
public class AdminMemberDao {

	public List<MemberVo> getMemberList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("admin.member.getMemberList", searchMap , rb);
	}
	
	public MemberVo getMemberByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("admin.member.getMemberByNo" , no);
	}

	public int getCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("admin.member.getCnt" , searchMap);
	}

}
