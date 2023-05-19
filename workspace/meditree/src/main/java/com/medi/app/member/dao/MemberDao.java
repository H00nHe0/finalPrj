package com.medi.app.member.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.member.vo.MemberVo;

@Repository
public class MemberDao {

	public int join(MemberVo vo, SqlSessionTemplate sst) throws Exception {
		
		return sst.insert("member.join" , vo);
	}


	public int checkId(SqlSessionTemplate sst, String no) {
		return sst.selectOne("member.checkId" , no);
	}

	//로그인
	public MemberVo login(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.login" , vo);
	}
	
	
	//정보수정
	public int edit(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("member.edit" , vo);
	}

	public MemberVo selectOneByNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.getMember" , vo);
		
	}


}
