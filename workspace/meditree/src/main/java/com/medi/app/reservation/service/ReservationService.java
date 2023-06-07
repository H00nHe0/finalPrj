package com.medi.app.reservation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.member.vo.MemberVo;
import com.medi.app.reception.patient.dao.PatientDao;
import com.medi.app.reception.patient.vo.PatientVo;

@Service
@Transactional
public class ReservationService {
	
	private final SqlSessionTemplate sst;
	private final PatientDao dao;
	
	@Autowired
	public ReservationService(PatientDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public PatientVo rsvnScreen(String paNo) {

		return dao.rsvnScreen(sst, paNo);
	}

	public PatientVo rsvnScreenS(String paNo) {

		return dao.rsvnScreenS(sst, paNo);
	}
	
	public PatientVo putWaitingPatient(String paNo) {
		// TODO Auto-generated method stub
		return dao.putWaitingPatient(sst, paNo);
	}

	public List<MemberVo> getDoctorList() {
		System.out.println("의사 선택서비스 넘어왔고 dao리턴");
		return dao.getDoctorList(sst);
	}

	
	

}
