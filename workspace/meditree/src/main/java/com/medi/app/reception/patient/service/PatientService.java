package com.medi.app.reception.patient.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.medi.app.common.page.PageVo;
import com.medi.app.reception.patient.dao.PatientDao;
import com.medi.app.reception.patient.vo.PatientVo;



@Service
@Transactional
public class PatientService {

	private final SqlSessionTemplate sst;
	private final PatientDao dao;
@Autowired
public PatientService(SqlSessionTemplate sst , PatientDao dao) {
	this.sst = sst;
	this.dao = dao;
}
public int enroll(PatientVo vo) throws Exception {
	return dao.enroll(sst , vo);
}

//환자 수 조회
public int getCnt(Map<String, String> searchMap) {

	return dao.getCnt(sst , searchMap);
}
//환자 목록조회
public List<PatientVo> getSimplePatientList(PageVo pv, Map<String, String> searchMap) {
	// TODO Auto-generated method stub
	return dao.getSimplePatientList(sst, pv , searchMap);
}
//목록조회한거 화면으로 옮기기
public PatientVo getPaInfo(String num) throws Exception {

	return dao.getPaInfo(sst , num);
}

}