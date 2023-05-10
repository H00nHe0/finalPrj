package com.medi.app.mediDevice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.mediDevice.dao.MediDeviceDao;
import com.medi.app.mediDevice.vo.MediDeviceVo;

@Service
@Transactional
public class MediDeviceService {
	
	private final MediDeviceDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MediDeviceService(MediDeviceDao dao , SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public List<MediDeviceVo> getMediDeviceList() {
		
		return dao.getMediDeviceList(sst);
	}

	public int write(MediDeviceVo vo) {
		return dao.write(sst, vo);
	}

	public MediDeviceVo getMediDevice(String num) {
		return dao.getMediDevice(sst, num);
	}

}
