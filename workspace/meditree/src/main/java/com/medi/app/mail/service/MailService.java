package com.medi.app.mail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.board.vo.BoardVo;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mail.dao.MailDao;
import com.medi.app.mail.vo.MailVo;

@Service
@Transactional
public class MailService {

	private final MailDao dao;
	private final SqlSessionTemplate sst;

	@Autowired
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
	public int getCnt(String receiver) {
		return dao.getCnt(sst,receiver);
	}

	//받은메일 목록조회
	public List<MailVo> getMailList(Map<String, Object> inListMap) {
		return dao.getMailList(sst,inListMap);
	}

	//보낸메일 페이징 처리
	public int getSendMailListCnt(String writer) {
		return dao.getSendMailListCnt(sst,writer);
	}

	//보낸메일 목록조회
	public List<MailVo> getSendMailList(Map<String, Object> sendListMap) {
		return dao.getSendMailList(sst,sendListMap);
	}

	//받은메일 상세보기
	public MailVo getInMailDetail(String num) {
		MailVo vo = dao.getInMailDetail(sst,num);
		List<FileVo> fileList = dao.getAttList(sst,num);
		vo.setAttList(fileList);
		return vo;
	}

	//보낸메일 상세보기
	public MailVo getSendMailDetail(String num) {
		MailVo vo = dao.getSendMailDetail(sst,num);
		List<FileVo> fileList = dao.getAttList(sst,num);
		vo.setAttList(fileList);
		return vo;
	}

	//첨부파일 다운로드
	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst,ano);
	}

	//선택삭제
	public int chkDel(List<String> groupList) {
		return dao.chkDel(sst,groupList);
	}

	//휴지통 페이징처리
	public int getDelBoxListCnt(String writer, String receiver) {
		return dao.getDelBoxListCnt(sst,writer,receiver);
	}

	//휴지통 목록 조회
	public List<MailVo> getDelBoxList(Map<String, Object> memberMap) {
		return dao.getDelBoxList(sst,memberMap);
	}

	//메일 삭제(상세보기내에서)
	public int delete(String no) {
		return dao.delete(sst,no);
	}

	//메일 영구 삭제
	public int fDel(List<String> fDelList) {
		return dao.fDel(sst,fDelList);
	}
	
	//메일 복구
	public int recover(List<String> recoverList) {
		return dao.recover(sst,recoverList);
	}
	
	
	
}
