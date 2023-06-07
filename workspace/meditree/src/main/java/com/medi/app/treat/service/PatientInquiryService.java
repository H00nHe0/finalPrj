package com.medi.app.treat.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.common.page.PageVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.tmHistory.vo.TmHistoryVo;
import com.medi.app.treat.dao.PatientInquiryDao;

@Service
@Transactional
public class PatientInquiryService {

	private final PatientInquiryDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public PatientInquiryService(PatientInquiryDao dao , SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//환자목록조회
	public List<PatientVo> getPatientList(PageVo pv, Map<String, String> searchMap) {
	return dao.getPatientList(sst, pv , searchMap);
	}

	// 게시글 갯수 조회
	public int getCnt(Map<String, String> searchMap) {
		return dao.getCnt(sst , searchMap);
	}

	//환자 상세조회
	public PatientVo getPatientInquiry(String no){
		return dao.getPatientInquiry(sst , no);
	}

	//환자 정보수정
	public int updatePatientInquiry(PatientVo vo) {
		return dao.updatePatientInquiry(sst , vo);
	}

	//정보수정 화면쪽 !!!
	public PatientVo getPatientInquiry2(String no) {
		return dao.getPatientInquiry2(sst , no);
	}

	//환자진료내역조회
	public List<TmHistoryVo> getPatientChart(String no, PageVo pv) {
		return dao.getPatientChart(sst , no, pv);
	}

	//진료내역 갯수 조회
	public int getCnt2(String no) {
		return dao.getCnt2(sst ,no);
	}

	//처방전 조회
	public TmHistoryVo selectPrescription(String no) {
		return dao.selectPrescription(sst , no);
	}


	
	
}
