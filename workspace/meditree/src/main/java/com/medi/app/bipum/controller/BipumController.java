package com.medi.app.bipum.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.medi.app.bipum.service.bipumService;
import com.medi.app.bipum.vo.BipumVo;
import com.medi.app.common.file.FileUploader;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;

@Controller
@RequestMapping("bipum")
public class BipumController {
	
	private final bipumService bs;
	
	@Autowired
	public BipumController(bipumService bs) {
		this.bs = bs;
	}
	
	//비품 목록조회
	@GetMapping("list")
	public String list(Model model ,@RequestParam(defaultValue = "1") int page) {
		int listCount = bs.getBipumListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<BipumVo> bvoList = bs.getBipumList(pv);
		
		//화면
		model.addAttribute("pv",pv);
		model.addAttribute("bvoList", bvoList);
		return "bipum/list";
	}
	
	//비품 등록하기 화면
	@GetMapping("write")
	public String write(HttpSession session, Model model) {
	
		return "bipum/write";
	}
	
	//비품 등록하기(관리자만)
	@PostMapping("write")
	public String write(BipumVo vo, List<MultipartFile> f, HttpSession session, HttpServletRequest req) throws Exception {
		//데이터 준비(파일)
		String path = req.getServletContext().getRealPath("/resources/upload/bipum/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);

		//데이터 준비 (이름 리스트)
		List<FileVo> fvoList = new ArrayList<FileVo>();
		if(changeNameList != null) {
			int size = changeNameList.size();
			for (int i = 0; i < size; i++) {
				FileVo fvo = new FileVo();
				fvo.setOriginName(originNameList.get(i));
				fvo.setChangeName(changeNameList.get(i));
				fvoList.add(fvo);
			}
		}
		
		//사진첨부
		int result = bs.write(vo ,fvoList);
		if(result <= 0) {
			throw new Exception("비품 등록에 실패하였습니다.");
		}
		session.setAttribute("alertMsg", "비품 등록 완료!");
		
		return "redirect:/bipum/list";
	}
	
	//비품 상세조회
	@GetMapping("detail")
	public String detail(String num, Model model) throws Exception {
		
		BipumVo vo = bs.getBipum(num);
		
		if(vo == null) {
			model.addAttribute("errorMsg", "비품 조회를 실패하였습니다.");
			return "common/error";
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("path","resources/upload/bipum");
		return "bipum/detail";
	}

	//비품 수정하기(관리자만)
	@PostMapping("edit")
	public String edit(BipumVo vo, Model model, HttpSession session) {
		
		int result = bs.edit(vo);
		
		if(result != 1) {
			model.addAttribute("errorMsg", "비품 수정을 실패하였습니다.");
			return "common/error";
		}
		session.setAttribute("alertMsg", "수정을 성공하였습니다.");
		return "redirect:/bipum/detail?num=" + vo.getNo();
	}
	
	//비품 삭제하기(관리자만)
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		
		int result = bs.delete(num);
		
		if(result != 1) {
			throw new Exception("비품 삭제 중 에러가 발생했습니다.");
		}
				
		return  "redirect:/bipum/list?page=1";
	}
	
	//파일 다운로드(ResponseEntity 이용)
	@GetMapping("att/down")
	public ResponseEntity<ByteArrayResource> download(String ano, HttpServletRequest req) throws Exception {
		
		//바디 채우기
		//파일 객체 준비
		String path = req.getServletContext().getRealPath("/resources/upload/bipum/");
		FileVo fvo = bs.getAttachment(ano);
		File f = new File(path + fvo.getChangeName());
		//바이트 배열로 변환
		byte[] data = FileUtils.readFileToByteArray(f) ;
		ByteArrayResource bar = new ByteArrayResource(data);
		
		//헤더 채우기
		//ResponseEntity 만들기
		ResponseEntity<ByteArrayResource> entity = ResponseEntity
				.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + "\"" + URLEncoder.encode(fvo.getOriginName() , "UTF-8") + "\"" )
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.contentLength(data.length)
				.body(bar)
				;
			
			return entity;
	}

}

