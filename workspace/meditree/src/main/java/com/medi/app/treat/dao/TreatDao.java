package com.medi.app.treat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.common.page.PageVo;
import com.medi.app.jinryo.vo.JinryoVo;
import com.medi.app.reception.patient.vo.PatientVo;
import com.medi.app.tmHistory.vo.TmHistoryVo;
import com.medi.app.treat.vo.DrugVo;

@Repository
public class TreatDao {
	


	//진료대기목록
	public List<JinryoVo> getWaitingList(SqlSessionTemplate sst, String emNo) {
		return sst.selectList("treat.getWaitingList" , emNo);
	}

	public int getCnt3(SqlSessionTemplate sst) {
		return sst.selectOne("treat.getCnt3");
	}
	
	// 진료할 환자의 정보 조회
	public JinryoVo selectNowPatient(SqlSessionTemplate sst, String emNo, JinryoVo jvo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("JinryoVo", jvo);
		map.put("emNo", emNo);
		
		return sst.selectOne("treat.selectNowPatient", map);
	}

	//진료할 환자의 과거내역 조회
	public List<TmHistoryVo> getNowChart(SqlSessionTemplate sst, String chartNo) {
		return sst.selectList("treat.getNowChart" , chartNo);
	}

	//약조회
	public List<DrugVo> getDrugList(SqlSessionTemplate sst) {
		return sst.selectList("treat.getDrugList");
	}

	//진료입력
	public int insertTm(SqlSessionTemplate sst, TmHistoryVo vo) {
		System.out.println(vo);
		return sst.insert("treat.insertTm" , vo);
	}

	//진료완료상태변경
	public int treatmentCompleted(SqlSessionTemplate sst, String no) {
		return sst.update("treat.treatmentCompleted" , no);
	}

}
