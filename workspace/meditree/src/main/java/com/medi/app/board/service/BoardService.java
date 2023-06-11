package com.medi.app.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.board.dao.BoardDao;
import com.medi.app.board.vo.BoardVo;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.notice.vo.NoticeVo;

@Service
@Transactional
public class BoardService {

	private final BoardDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public BoardService(BoardDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//게시판 목록조회
	public List<BoardVo> getBoardList(PageVo pv) {
		return dao.getBoardList(sst,pv);
	}
	
	//게시판 작성하기(첨부파일 추가)
	public int write(BoardVo vo, List<FileVo> fvoList) throws Exception {
		int boardResult = dao.write(sst, vo);
		int attResult = 1;
		if (fvoList.size() > 0) {
			attResult = dao.insertAttachment(sst,fvoList);
		}
		return boardResult * attResult;
	}
	
	//게시판 수정하기
	public int edit(BoardVo vo, List<FileVo> fvoList) {
		int boardEditResult = dao.edit(sst,vo);
		int attResult = 1;
		if (fvoList.size() > 0) {
			attResult = dao.editAttachment(sst,fvoList);
		}
		return boardEditResult * attResult;
		
	}

	//게시판 삭제하기
	public int delete(String num) {
		return dao.delete(sst, num);
	}
	
	//게시판 상세보기(+조회수)
	public BoardVo getBoard(String num) throws Exception {
		int result = dao.increaseHit(sst, num);
		if (result != 1) {
			throw new Exception();
		}
		BoardVo vo = dao.getBoard(sst, num);
		List<FileVo> fileList = dao.getAttachmentList(sst,num);
		vo.setAttList(fileList);
		return vo;
	}
	
	//게시판 페이징처리
	public int getBoardListCnt() {
		return dao.getBoardListCnt(sst);
	}
	
	//첨부파일 불러오기
	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst,ano);
	}

	//파일 삭제
	public Object deleteAttachments(List<FileVo> oldAttachments) {
		return dao.fileDel(sst,oldAttachments);
	}

	//첨부파일 목록조회
	public List<FileVo> getAttachmentList(BoardVo vo) {
	    return dao.getAttachmentList(sst, vo.getNo());
	}


	

	

	

	

}
