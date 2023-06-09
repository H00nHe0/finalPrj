package com.medi.app.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.notice.vo.NoticeVo;

@Repository
public class NoticeDao {

	//공지사항 삭제하기
	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("notice.delete",num);
	}

	//공지사항 수정하기
	public int edit(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("notice.edit",vo);
	}

	//공지사항 상세보기
	public NoticeVo getNotice(SqlSessionTemplate sst, String num) {
		return sst.selectOne("notice.getNotice",num);
	}

	//공지사항 조회수 증가
	public int increaseHit(SqlSessionTemplate sst, String num) {
		return sst.update("notice.increaseHit",num);
	}

	//공지사항 목록조회
	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("notice.getNoticeList", null ,rb);
	}

	//공지사항 목록 페이징 처리
	public int getNoticeListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("notice.getNoticeListCnt");
	}

	//공지사항 작성하기
	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.write",vo);
	}

	//첨부파일 추가하기
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("notice.insertAttachment", fvoList);
		 
	}

	//첨부파일 목록 조회하기
	public List<FileVo> getAttachmentList(SqlSessionTemplate sst, String no) {
		return sst.selectList("notice.getAttachmentList",no);
	}

	//첨부파일 조회하기
	public FileVo getAttachment(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("notice.getAttachment",ano);
	}

	public int editAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("notice.editAttachment", fvoList);
	}

	public Object fileDel(SqlSessionTemplate sst, List<FileVo> oldAttachments) {
		return sst.update("notice.fileDel",oldAttachments);
	}

	
	
	
	
}
