package com.medi.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.member.dao.MemberDao;
import com.medi.app.member.vo.MemberVo;

@Service
@Transactional
public class MemberService {

	public final SqlSessionTemplate sst;
	public final MemberDao dao;
	
	@Autowired
	public MemberService(SqlSessionTemplate sst , MemberDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	//직원가입
	public int join(MemberVo vo) throws Exception {
		
		return dao.join(vo , sst);
	}

}
