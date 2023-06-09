package com.medi.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.board.vo.BoardVo;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;

@Repository
public class BoardDao {

	//게시판 목록조회
	public List<BoardVo> getBoardList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		System.out.println(offset);
		System.out.println(limit);
		return sst.selectList("board.getBoardList", null ,rb);
	}
	
	//게시판 작성하기
	public int write(SqlSessionTemplate sst, BoardVo vo) {
		return sst.insert("board.write",vo);
	}
	
	//게시판 삭제하기
	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("board.delete",num);
	}
	
	//게시판 수정하기
	public int edit(SqlSessionTemplate sst, BoardVo vo) {
		return sst.update("board.edit",vo);
	}
	//게시판 상세보기
	public BoardVo getBoard(SqlSessionTemplate sst, String no) {
		return sst.selectOne("board.getBoard",no);
	}
	
	//게시판 목록 조회  페이징
	public int getBoardListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("board.getBoardListCnt");
	}
	
	//게시판 조회수 증가
	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("board.increaseHit",no);
	}
	
	//첨부파일 추가하기
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("board.insertAttachment", fvoList);
	}
	
	//첨부파일 목록 조회
	public List<FileVo> getAttachmentList(SqlSessionTemplate sst, String no) {
		return sst.selectList("board.getAttachmentList",no);
	}
	
	//첨부파일 조회
	public FileVo getAttachment(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("board.getAttachment",ano);
	}

	//파일 삭제
	public Object fileDel(SqlSessionTemplate sst, List<FileVo> oldAttachments) {
		return sst.update("board.fileDel",oldAttachments);
	}

	//파일 수정 첨부
	public int editAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("board.editAttachment", fvoList);
	}

	
}
