package com.medi.app.organization.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.member.vo.MemberVo;
@Repository
public class OrganizationDao {



	public List<MemberVo> generalMedicine(SqlSessionTemplate sst, String major) {
		return sst.selectList("organization.generalMedicine", major);
	}

	public List<MemberVo> psychiatry(SqlSessionTemplate sst , String major) {
		return sst.selectList("organization.psychiatry", major);
	}

	public List<MemberVo> ent(SqlSessionTemplate sst , String major) {
		return sst.selectList("organization.ent", major);
	}

	public List<MemberVo> selectSurgery(SqlSessionTemplate sst, String major) {
		//System.out.println("noProblem");
		return sst.selectList("organization.selectSurgery", major);
	}

	public List<MemberVo> emer(SqlSessionTemplate sst, String major) {
		return sst.selectList("organization.emer", major);
	}

	public List<MemberVo> pRm(SqlSessionTemplate sst, String major) {
		return sst.selectList("organization.pRm", major);
	}

	public List<MemberVo> receipt(SqlSessionTemplate sst, String major) {
		return sst.selectList("organization.receipt", major);
	}

	public List<MemberVo> management(SqlSessionTemplate sst, String major) {
		return sst.selectList("organization.management", major);
	}


}
