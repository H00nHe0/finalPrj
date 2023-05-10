package com.medi.app.reception.patient.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.medi.app.common.page.PageVo;
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


	public PatientVo getPaInfo(SqlSessionTemplate sst, String num) {
		return sst.selectOne("patient.getPaInfo", num);
	}


	
}
