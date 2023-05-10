package com.medi.app.mediDevice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.mediDevice.vo.MediDeviceVo;

@Repository
public class MediDeviceDao {

	public List<MediDeviceVo> getMediDeviceList(SqlSessionTemplate sst) {
		return sst.selectList("mediDevice.getMediDeviceList");
	}

	public int write(SqlSessionTemplate sst, MediDeviceVo vo) {
		return sst.insert("mediDevice.write", vo);
	}

	public MediDeviceVo getMediDevice(SqlSessionTemplate sst, String num) {
		return sst.selectOne("mediDevice.getMediDevice", num);
	}
	
}
