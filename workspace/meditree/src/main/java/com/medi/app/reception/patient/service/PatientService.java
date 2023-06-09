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
import com.medi.app.reservation.vo.ReservationVo;



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
public PatientVo getPaInfo(String paNo) throws Exception {

	System.out.println("noProblem");
	return dao.getPaInfo(sst , paNo);
	
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
public int insertJinryoIng(PatientVo pv) {
	return dao.insertJinryoIng(sst, pv);
	
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
public PatientVo insertJinryo(int no) {
	return dao.insertJinryo(sst, no);
	
}
public List<MemberVo> wlistSortByDept(String deptNo) {

	return dao.wlistSortByDept(sst, deptNo);
}
public List<MemberVo> plistSortByDept(String deptNo) {
	return dao.plistSortByDept(sst, deptNo);
}
public List<MemberVo> surgeryWaitingList() {

	return dao.surgeryWaitingList(sst);
}
public List<MemberVo> proomWaitingList() {

	return dao.proomWaitingList(sst);
}
public List<PatientVo> getreceiptList(PageVo pv, Map<String, String> searchMap) {
	return dao.getreceiptList(sst, pv , searchMap);
}
public List<MemberVo> payDoneList(PageVo pv, Map<String, String> searchMap) {
	return dao.payDoneList(sst, pv , searchMap);
}
public int getReceiptCnt(Map<String, String> searchMap) {
	return dao.getReceiptCnt(sst , searchMap);
}
public int getReceiptDoneCnt(Map<String, String> searchMap) {
	
	return dao.getReceiptDoneCnt(sst , searchMap);
}


public int changeToReceipt(int no) {
	return dao.changeToReceipt(sst, no);
}
public ArrayList<ReservationVo> selectPRoomList() {
	return dao.selectPRoomList(sst);
}
public ArrayList<ReservationVo> selectSRoomList() {
	return dao.selectSRoomList(sst);
}
public ArrayList<ReservationVo> selectDateList(String nowDate) {
	return dao.selectDateList(sst, nowDate);
}
public ArrayList<ReservationVo> selectPRoomBookingList(String nowDate) {
	return dao.selectPRoomBookingList(sst, nowDate);

}
public ArrayList<ReservationVo> selectSRoomBookingList(String nowDate) {
	return dao.selectSRoomBookingList(sst, nowDate);
}
}

