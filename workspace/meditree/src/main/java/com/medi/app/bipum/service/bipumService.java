package com.medi.app.bipum.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medi.app.bipum.dao.BipumDao;
import com.medi.app.bipum.vo.BipumVo;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;

@Transactional
@Service
public class bipumService {
	
	private final BipumDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public bipumService(BipumDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//목록조회
	public List<BipumVo> getBipumList(PageVo pv) {
		return dao.getBipumList(sst, pv);
	}
	
	/**
	 * FITMENT 에 insert
	 * F_ATT 에 changeNameList의 값들을 insert (FITMENT 기본키 참조)
	 * 
	 * @param 게시글 관련 데이터
	 * @param 파일 업로드 이후 저장된 파일명 리스트
	 * @return Bipum테이블(FITMENT) 및 Attachment(F_ATT) 테이블 insert 결과
	 */
	//작성하기(첨부파일 추가)
	public int write(BipumVo vo, List<FileVo> fvoList) throws Exception {
		int bipumResult = dao.write(sst, vo);
		int attResult = 1;
		if (fvoList.size() > 0) {
	         attResult = dao.insertAttachment(sst,fvoList);
	      }
	      return bipumResult * attResult;
	}
	
	//상세조회
	public BipumVo getBipum(String num) {
		BipumVo vo = dao.getBipum(sst, num);
		List<FileVo> fileList = dao.getAttachmentList(sst,num);
		vo.setAttList(fileList);
		return vo;
	}
	
	//수정하기
	public int edit(BipumVo vo) {
		return dao.edit(sst, vo);
	}
	
	//삭제하기
	public int delete(String num) {
		return dao.delete(sst, num);
	}

	//페이지 카운트
	public int getBipumListCnt() {
		return dao.getBipumListCnt(sst);
	}
	
	//첨부파일 불러오기
	public FileVo getAttachment(String ano) {
		return dao.getAttachment(sst, ano);
	}


}
