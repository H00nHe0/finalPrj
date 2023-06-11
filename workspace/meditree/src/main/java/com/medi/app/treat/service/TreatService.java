package com.medi.app.treat.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.medi.app.common.page.PageVo;
import com.medi.app.jinryo.vo.JinryoVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.tmHistory.vo.TmHistoryVo;
import com.medi.app.treat.dao.PatientInquiryDao;
import com.medi.app.treat.dao.TreatDao;
import com.medi.app.treat.vo.DrugVo;

@Service
@Repository
public class TreatService {
	
	private final TreatDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public TreatService(TreatDao dao , SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}



	//대기환자 갯수조회
	public int getCnt3() {
		return dao.getCnt3(sst);
	}

	//진료대기목록
	public List<JinryoVo> getWaitingList(String emNo) {
		return dao.getWaitingList(sst, emNo);
	}


	// 진료할 환자의 정보 조회
	public JinryoVo selectNowPatient(JinryoVo jvo, String emNo) {
		JinryoVo nowPatient = dao.selectNowPatient(sst,emNo, jvo);
		return nowPatient;
	}


	//진료할 환자의 과거내역 조회
	public List<TmHistoryVo> getNowChart(String chartNo) {
		return dao.getNowChart(sst , chartNo);
	}


	//약 조회
	public List<DrugVo> getDrugList() {
		return dao.getDrugList(sst);
	}



	//진료입력
	public int insertTm(TmHistoryVo vo) {
		return dao.insertTm(sst , vo);
	}


	//진료완료상태변경
	public int treatmentCompleted(String no) {
		return dao.treatmentCompleted(sst , no);
	}

}
