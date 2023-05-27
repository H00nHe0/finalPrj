package com.medi.app.bipum.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.medi.app.bipum.vo.BipumVo;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.mediDevice.vo.MediDeviceVo;

@Repository
public class BipumDao {

	//비품목록조회(페이징 처리된)
	public List<BipumVo> getBipumList(SqlSessionTemplate sst, PageVo pv) {
		int limit = pv.getBoardLimit(); 
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset	, limit);
		return sst.selectList("bipum.getBipumList", null, rb);
	}
	
	//비품작성하기
	public int write(SqlSessionTemplate sst, BipumVo vo) {
		return sst.insert("bipum.write", vo);
	}

	//비품상세조회
	public BipumVo getBipum(SqlSessionTemplate sst, String num) {
		return sst.selectOne("bipum.getBipum", num);
	}
	
	//비품수정하기(관리자만)
	public int edit(SqlSessionTemplate sst, BipumVo vo) {
		return sst.update("bipum.edit", vo);
	}
	
	//비품삭제하기(관리자만)
	public int delete(SqlSessionTemplate sst, String num) {
		return sst.update("bipum.delete", num);
	}

	//페이지 카운트
	public int getBipumListCnt(SqlSessionTemplate sst) {
		return sst.selectOne("bipum.getBipumListCnt");
	}

	//첨부파일
	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> fvoList) {
		return sst.insert("bipum.insertAttachment", fvoList);
	}
	
	//첨부파일 조회
	public FileVo getAttachment(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("bipum.getAttachment", ano);
	}

	//첨부파일 목록조회
	public List<FileVo> getAttachmentList(SqlSessionTemplate sst, String num) {
		return sst.selectList("bipum.getAttachmentList", num);
	}
	
}
