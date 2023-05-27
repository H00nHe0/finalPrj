package com.medi.app.mail.dao;

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

	//메일 페이징 처리
	public int getCnt(SqlSessionTemplate sst) {
		return sst.selectOne("mail.getCnt");
	}

	//받은 메일 목록 조회
	public List<MailVo> getMailList(SqlSessionTemplate sst, Map<String, Object> inListMap) {
		PageVo pageVo = (PageVo) inListMap.get("pageVo");
	    String receiver = (String) inListMap.get("receiver");
		int limit = pageVo.getBoardLimit();
		int offset = (pageVo.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		System.out.println(offset);
		System.out.println(limit);
		
		return sst.selectList("mail.getMailList", receiver ,rb);
	}

	//보낸메일 목록 페이징 처리
	public int getSendMailListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("mail.getSendMailListCnt");
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

}
