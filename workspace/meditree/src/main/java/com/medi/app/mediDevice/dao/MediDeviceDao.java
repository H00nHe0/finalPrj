package com.medi.app.mediDevice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.common.page.PageVo;
import com.medi.app.mediDevice.vo.MediDeviceVo;

@Repository
public class MediDeviceDao {

	public List<MediDeviceVo> getMediDeviceList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("mediDevice.getMediDeviceList", null, rb);
	}

	public int write(SqlSessionTemplate sst, MediDeviceVo vo) {
		return sst.insert("mediDevice.write", vo);
	}

	public MediDeviceVo getMediDevice(SqlSessionTemplate sst, String num) {
		return sst.selectOne("mediDevice.getMediDevice", num);
	}

	public int edit(SqlSessionTemplate sst, MediDeviceVo vo) {
		return sst.update("mediDevice.edit", vo);
	}

	public int getMediDeviceListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("mediDevice.getMediDeviceListCnt");
	}

	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("mediDevice.delete", num);
	}

	
}
