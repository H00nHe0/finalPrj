package com.medi.app.reception.patient.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.medi.app.common.page.PageVo;
import com.medi.app.member.vo.DeptVo;
import com.medi.app.member.vo.MemberVo;
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

	return dao.getSimplePatientList(sst, pv , searchMap);
}
//목록조회한거 화면으로 옮기기
public PatientVo getPaInfo(String paName) throws Exception {

	System.out.println("noProblem");
	return dao.getPaInfo(sst , paName);
	
}
public List<Map<String, String>> getDepartmentList() {
	System.out.println("진료과 조회서비스 넘어왔고 dao리턴");
	return dao.getDepartmentList(sst);
}
public List<MemberVo> getDoctorList() {
	System.out.println("의사 선택서비스 넘어왔고 dao리턴");
	return dao.getDoctorList(sst);
}
public int insertTreatment(PatientVo pvo) {
	return dao.insertTreatment(sst, pvo);
}
public List<MemberVo> selectWaitingPatient() {

	return dao.selectWaitingPatient(sst);
}
public List<MemberVo> selectIngPatient() {

	return dao.selectIngPatient(sst);
}
public int changePatientStatus(int no) {
	
	return dao.changePatientStatus(sst, no);
}



}