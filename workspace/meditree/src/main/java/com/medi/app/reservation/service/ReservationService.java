package com.medi.app.reservation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.dao.PatientDao;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.reservation.dao.ReservationDao;
import com.medi.app.reservation.vo.ReservationVo;

@Service
@Transactional
public class ReservationService {
	
	private final SqlSessionTemplate sst;
	private final ReservationDao rdao;
	
	@Autowired
	public ReservationService(ReservationDao rdao, SqlSessionTemplate sst) {
		this.rdao = rdao;
		this.sst = sst;
	}

	public PatientVo rsvnScreen(String paNo) {

		return rdao.rsvnScreen(sst, paNo);
	}

	public PatientVo rsvnScreenS(String paNo) {

		return rdao.rsvnScreenS(sst, paNo);
	}
	
	public PatientVo putWaitingPatient(String paNo) {
		// TODO Auto-generated method stub
		return rdao.putWaitingPatient(sst, paNo);
	}

	public PatientVo putWaitingSPatient(String paNo) {
		// TODO Auto-generated method stub
		return rdao.putWaitingSPatient(sst, paNo);
	}
	public List<MemberVo> getDoctorList() {
		System.out.println("의사 선택서비스 넘어왔고 dao리턴");
		return rdao.getDoctorList(sst);
	}

	public List<ReservationVo> getPRmList() {

		return rdao.getPRmList(sst);
	}

	public List<ReservationVo> get2PRmList() {
		return rdao.get2PRmList(sst);
	}

	public int sendInfoToPRm(ReservationVo rvo) {
		return rdao.sendInfoToPRm(sst,rvo);
	}

	public int changeToFinish(ReservationVo rvo) {
		return rdao.changeToFinish(sst,rvo);
		
	}

	public List<ReservationVo> getSRmList() {

		return rdao.getSRmList(sst);
	}

	public int sendToCalendar(ReservationVo calendarData) {
		return rdao.sendToCalendar(sst,calendarData);
	}

	public int changeToSFinish(ReservationVo calendarData) {
		return rdao.changeSToFinish(sst,calendarData);
		

	}
	

	
	

}
