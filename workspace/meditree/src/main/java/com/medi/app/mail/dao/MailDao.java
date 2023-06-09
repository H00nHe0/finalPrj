package com.medi.app.mail.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mail.vo.MailVo;

@Repository
public class MailDao {

	//메일 작성하기
	public int write(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mail.write",vo);
	}

	//메일 첨부파일 인서트
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("mail.insertAttachment",fvoList);
	}

	//받은 메일 페이징 처리
	public int getCnt(SqlSessionTemplate sst, String receiver) {
		return sst.selectOne("mail.getCnt",receiver);
	}

	//받은 메일 목록 조회
	public List<MailVo> getMailList(SqlSessionTemplate sst, Map<String, Object> inListMap) {
		PageVo pageVo = (PageVo) inListMap.get("pageVo");
		String receiver = (String) inListMap.get("receiver");
		int limit = pageVo.getBoardLimit();
		int offset = (pageVo.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("mail.getMailList", receiver ,rb);
	}

	//받은메일 상세보기
	public MailVo getInMailDetail(SqlSessionTemplate sst, String num) {
		return sst.selectOne("mail.getInMailDetail",num);
	}

	//보낸메일 목록 페이징 처리
	public int getSendMailListCnt(SqlSessionTemplate sst, String writer) {
		return sst.selectOne("mail.getSendMailListCnt",writer);
	}

	//보낸메일 목록 조회
	public List<MailVo> getSendMailList(SqlSessionTemplate sst, Map<String, Object> sendListMap) {
		PageVo pageVo = (PageVo) sendListMap.get("pageVo");
	    String writer = (String) sendListMap.get("writer");
		int limit = pageVo.getBoardLimit();
		int offset = (pageVo.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("mail.getSendMailList",writer,rb);
	}


	//보낸메일 상세보기
	public MailVo getSendMailDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("mail.getSendMailDetail",no);
	}

	//받은 메일 첨부파일 다운
	public FileVo getAttachment(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("mail.getAttachment",ano);
	}

	

	//선택삭제
	public int chkDel(SqlSessionTemplate sst, List<String> groupList) {
		return sst.update("mail.chkDel",groupList);
	}

	//휴지통 페이징 처리
	public int getDelBoxListCnt(SqlSessionTemplate sst, String writer, String receiver) {
		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("writer", writer);
		memberMap.put("receiver", receiver);
		return sst.selectOne("mail.getDelBoxListCnt",memberMap);
	}

	//휴지통 목록조회
	public List<MailVo> getDelBoxList(SqlSessionTemplate sst, Map<String, Object> memberMap) {
		return sst.selectList("mail.getDelBoxList",memberMap);
	}
	
	//메일 삭제(상세 내에서)
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("mail.delete",no);
	}

	//첨부파일 목록조회
	public List<FileVo> getAttList(SqlSessionTemplate sst, String num) {
		return sst.selectList("mail.getAttList",num);
	}

	//메일 영구 삭제
	public int fDel(SqlSessionTemplate sst, List<String> fDelList) {
		return sst.update("mail.fDel",fDelList);
	}

	//메일 복구
	public int recover(SqlSessionTemplate sst, List<String> recoverList) {
		return sst.update("mail.recover",recoverList);
	}

	

}
