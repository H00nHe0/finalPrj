package com.medi.app.reception.patient.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.medi.app.common.page.PageVo;
import com.medi.app.member.vo.DeptVo;
import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.vo.PatientVo;

@Repository
public class PatientDao {

	//신규환자 등록
	public int enroll(SqlSessionTemplate sst, PatientVo vo) throws Exception {
		return sst.insert("patient.enroll" , vo);
	}

	
	//환자 수 조회
	public int getCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {

		return sst.selectOne("patient.getCnt" , searchMap);
	}

	//환자 목록조회
	public List<PatientVo> getSimplePatientList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("patient.getSimplePatientList" , searchMap , rb);
	}


	public PatientVo getPaInfo(SqlSessionTemplate sst, String paNo) {

		return sst.selectOne("patient.getPaInfo", paNo);
	}

	//진료부서조회
	public List<Map<String, String>> getDepartmentList(SqlSessionTemplate sst) {
		System.out.println("진료과조회 dao 넘어왔고 메퍼시작");
		return sst.selectList("patient.getDepartmentList");
	}
	//진료부서에 속한 의사 조회
	public List<MemberVo> getDoctorList(SqlSessionTemplate sst) {
		System.out.println("의사선택 dao 넘어왔고 메퍼시작");
		return sst.selectList("patient.getDoctorList");
	}

	//진료등록
	public int insertTreatment(SqlSessionTemplate sst, PatientVo pvo) {
		return sst.insert("patient.insertTreatment", pvo);
	}


	public List<MemberVo> selectWaitingPatient(SqlSessionTemplate sst) {

		return sst.selectList("patient.selectWaitingPatient");
	}


	public List<MemberVo> selectIngPatient(SqlSessionTemplate sst) {

		return sst.selectList("patient.selectIngPatient");
	}


	public int changePatientStatus(SqlSessionTemplate sst, int no) {
		return sst.update("patient.changePatientStatus", no);
	}


	public List<MemberVo> wlistSortByDept(SqlSessionTemplate sst, String deptNo) {
		return sst.selectList("patient.wlistSortByDept", deptNo );
	}


	public List<MemberVo> plistSortByDept(SqlSessionTemplate sst, String deptNo) {
		return sst.selectList("patient.plistSortByDept", deptNo );
	}


	public List<MemberVo> surgeryWaitingList(SqlSessionTemplate sst) {
		return sst.selectList("patient.surgeryWaitingList");
	}


	public List<MemberVo> proomWaitingList(SqlSessionTemplate sst) {
		return sst.selectList("patient.proomWaitingList");
	}


	public PatientVo rsvnScreen(SqlSessionTemplate sst, String paNo) {

		return sst.selectOne("patient.rsvnScreen", paNo);
	}

	public PatientVo rsvnScreenS(SqlSessionTemplate sst, String paNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("patient.rsvnScreenS", paNo);
	}

	public PatientVo putWaitingPatient(SqlSessionTemplate sst, String paNo) {
		return sst.selectOne("patient.putWaitingPatient",paNo);
	}





	
}
