package com.medi.app.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.reservation.vo.ReservationVo;

@Repository
public class ReservationDao {

	public PatientVo rsvnScreen(SqlSessionTemplate sst, String paNo) {
		return sst.selectOne("reservation.rsvnScreen", paNo);
	}

	public PatientVo rsvnScreenS(SqlSessionTemplate sst, String paNo) {
		return sst.selectOne("reservation.rsvnScreenS", paNo);
	}

	public PatientVo putWaitingPatient(SqlSessionTemplate sst, String paNo) {
		return sst.selectOne("reservation.putWaitingPatient",paNo);
	}
	public PatientVo putWaitingSPatient(SqlSessionTemplate sst, String paNo) {
		return sst.selectOne("reservation.putWaitingSPatient",paNo);
	}

	public List<MemberVo> getDoctorList(SqlSessionTemplate sst) {
		return sst.selectList("patient.getDoctorList");
	}
	//입원실 셀렉태그용
	public List<ReservationVo> getPRmList(SqlSessionTemplate sst) {
		return sst.selectList("reservation.getPRmList");
	}

	public List<ReservationVo> get2PRmList(SqlSessionTemplate sst) {
		return sst.selectList("reservation.get2PRmList");
	}

	public int sendInfoToPRm(SqlSessionTemplate sst,ReservationVo rvo) {

		return sst.insert("reservation.sendInfoToPRm", rvo);
	}

	public int changeToFinish(SqlSessionTemplate sst, ReservationVo rvo) {
		return sst.update("reservation.changeToFinish", rvo);
	}

	public List<ReservationVo> getSRmList(SqlSessionTemplate sst) {
		return sst.selectList("reservation.getSRmList");
	}

	public int sendToCalendar(SqlSessionTemplate sst, ReservationVo calendarData) {
		return sst.insert("schedule.sendToCalendar", calendarData);
	}

	public int changeSToFinish(SqlSessionTemplate sst, ReservationVo calendarData) {
		return sst.update("reservation.changeSToFinish", calendarData);
	}


}
