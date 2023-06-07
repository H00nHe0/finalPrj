package com.medi.app.organization.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.member.vo.MemberVo;
import com.medi.app.organization.dao.OrganizationDao;



@Service
@Transactional
public class OrganizationService {

	private final SqlSessionTemplate sst;
	private final OrganizationDao dao;
@Autowired
public OrganizationService(SqlSessionTemplate sst , OrganizationDao dao) {
	this.sst = sst;
	this.dao = dao;
}
public List<MemberVo> selectSurgery(String major) throws Exception {
	//System.out.println("noProblem");
	return dao.selectSurgery(sst,major);
}
public List<MemberVo> generalMedicine(String major) {
	return dao.generalMedicine(sst,major);
}
public List<MemberVo> psychiatry(String major) {
	return dao.psychiatry(sst,major);
}
public List<MemberVo> ent(String major) {
	return dao.ent(sst,major);
}
public List<MemberVo> emer(String major) {
	return dao.emer(sst,major);
}
public List<MemberVo> pRm(String major) {
	return dao.pRm(sst,major);
}
public List<MemberVo> receipt(String major) {
	return dao.receipt(sst,major);
}
public List<MemberVo> management(String major) {
	return dao.management(sst,major);
}

}
