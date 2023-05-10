package com.medi.app.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.notice.dao.NoticeDao;
import com.medi.app.notice.vo.NoticeVo;

@Service
@Transactional
public class NoticeService {

	private final NoticeDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public NoticeService(NoticeDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//공지사항 삭제하기(관리자만)
	public int delete(String num) {
		return dao.delete(sst, num);
	}

	//공지사항 수정하기(관리자만)
	public int edit(NoticeVo vo) {
		return dao.edit(sst,vo);
	}

	//공지사항 상세보기(+조회수)
	public NoticeVo getNotice(String num) throws Exception {
		int result = dao.increaseHit(sst, num);
		if (result != 1) {
			throw new Exception();
		}
		return dao.getNotice(sst , num);
	}

	public int getNoticeListCnt() {
		return dao.getNoticeListCnt(sst);
	}

	public List<NoticeVo> getNoticeList(PageVo pv) {
		return dao.getNoticeList(sst,pv);
	}

	/**
	 * NOTICE에 insert 이후 
	 * N_ATT에 changeNameList의 값들을  insert (NOTICE 기본키 참조)
	 * 
	 * @param vo 게시글 관련 데이터
	 * @param fvoList 파일업로드 이후 저장된 파일명 리스트
	 * @return NOTICE 테이블 및 N_Att 테이블에 insert한 결과
	 */
	public int write(NoticeVo vo ,List<FileVo> fvoList) throws Exception {
		int noticeResult = dao.write(sst, vo);
		if (noticeResult != 1) {
			throw new Exception();
		}
		
		return dao.insertAttachment(sst,fvoList);
	}

	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst,ano);
	}

}
