package com.medi.app.mail.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mail.dao.MailDao;
import com.medi.app.mail.vo.MailVo;

@Service
@Transactional
public class MailService {

	private final MailDao dao;
	private final SqlSessionTemplate sst;

	public MailService(MailDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//메일 작성하기
	public int write(MailVo vo, List<FileVo> fvoList) {
		int mailResult = dao.write(sst, vo);
		int attResult = 1;
		if (fvoList.size() > 0) {
			attResult = dao.insertAttachment(sst,fvoList);
		}
		return mailResult * attResult;
	}

	//받은메일 페이징 처리
	public int getCnt() {
		return dao.getCnt(sst);
	}

	//받은메일 목록조회
	public List<MailVo> getMailList(Map<String, Object> inListMap) {
		return dao.getMailList(sst,inListMap);
	}

	//보낸메일 페이징 처리
	public int getSendMailListCnt() {
		return dao.getSendMailListCnt(sst);
	}

	//보낸메일 목록조회
	public List<MailVo> getSendMailList(Map<String, Object> sendListMap) {
		return dao.getSendMailList(sst,sendListMap);
	}
	
	
	
}
