package com.medi.app.treat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.common.page.PageVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.tmHistory.vo.TmHistoryVo;

@Repository
public class PatientInquiryDao {
	
	//목록조회
	public List<PatientVo> getPatientList(SqlSessionTemplate sst , PageVo pv, Map<String, String> searchMap) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("treat.getPatientList" , searchMap , rb);
	}

	//환자 명수 조회
	public int getCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("treat.getCnt" , searchMap);
	}

	//환자 상세조회
	public PatientVo getPatientInquiry(SqlSessionTemplate sst, String no) {
		return sst.selectOne("treat.getPatientInquiry" , no);
	}
	
	//환자 정보수정
	public int updatePatientInquiry(SqlSessionTemplate sst, PatientVo vo) {
		return sst.update("treat.updatePatientInquiry" , vo);
	}
	
	//정보수정 화면쪽 !!!
	public PatientVo getPatientInquiry2(SqlSessionTemplate sst, String no) {
		return sst.selectOne("treat.getPatientInquiry2" , no);
	}

	//환자진료내역조회
	public List<TmHistoryVo> getPatientChart(SqlSessionTemplate sst, String no , PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		

		return sst.selectList("treat.getPatientChart" , no, rb );
	}

	//진료내역 갯수 조회
	public int getCnt2(SqlSessionTemplate sst, String no) {
		return sst.selectOne("treat.getCnt2"  , no);
	}

	//처방전 조회
	public TmHistoryVo selectPrescription(SqlSessionTemplate sst, String no) {
		return sst.selectOne("treat.selectPrescription" , no);
	}

	


}
