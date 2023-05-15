package com.medi.app.member.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.member.vo.MemberVo;

@Repository
public class MemberDao {

	public int join(MemberVo vo, SqlSessionTemplate sst) throws Exception {
		
		return sst.insert("member.join" , vo);
	}


}
