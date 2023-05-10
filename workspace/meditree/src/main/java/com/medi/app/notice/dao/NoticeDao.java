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

	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("notice.delete",num);
	}

	public int edit(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("notice.edit",vo);
	}

	public NoticeVo getNotice(SqlSessionTemplate sst, String num) {
		return sst.selectOne("notice.getNotice",num);
	}

	public int increaseHit(SqlSessionTemplate sst, String num) {
		return sst.update("notice.increaseHit",num);
	}

	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("notice.getNoticeList", null ,rb);
	}

	public int getNoticeListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("notice.getNoticeListCnt");
	}

	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.write",vo);
	}

	
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("notice.insertAttachment", fvoList);
		 
	}

	public List<FileVo> getAttachmentList(SqlSessionTemplate sst, String no) {
		return sst.selectList("notice.getAttachmentList",no);
	}

	public FileVo getAttachment(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("notice.getAttachment",ano);
	}
	
	
	
}
