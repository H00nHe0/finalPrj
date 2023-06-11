package com.medi.app.notice.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

import com.medi.app.common.file.FileUploader;
import com.medi.app.common.file.FileVo;
import com.medi.app.common.page.PageVo;
import com.medi.app.notice.service.NoticeService;
import com.medi.app.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private final NoticeService ns;
	
	@Autowired
	public NoticeController(NoticeService ns) {
		this.ns = ns;
	}
	
	//공지사항 목록조회
	@GetMapping("list")
	public String list(Model model ,@RequestParam(defaultValue = "1") int page) {
		int listCount = ns.getNoticeListCnt();
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<NoticeVo> nvoList = ns.getNoticeList(pv);
		
		model.addAttribute("pv",pv);
		model.addAttribute("nvoList",nvoList);
		return "notice/notice-list";
	}
	
	//공지사항 작성하기(관리자만)(화면)
	@GetMapping("write")
	public String write(Model model, HttpSession session) {

		return "notice/notice-write";
	}
	
	//공지사항 작성하기(기능)
	@PostMapping("write")
	public String write(NoticeVo vo , HttpSession session ,List<MultipartFile> f ,HttpServletRequest req) throws Exception {
		//데이터 준비 (파일)
		String path = req.getServletContext().getRealPath("/resources/upload/notice/");
		List<String> changeNameList = FileUploader.upload(f, path);
		List<String> originNameList = FileUploader.getOriginNameList(f);
		
		//데이터 준비 (이름 리스트)
		List<FileVo> fvoList = new ArrayList<FileVo>();
		if (changeNameList != null) {
			int size = changeNameList.size();
			for (int i = 0; i < size; i++) {
				FileVo fvo = new FileVo();
				fvo.setOriginName(originNameList.get(i));
				fvo.setChangeName(changeNameList.get(i));
				fvoList.add(fvo);
		}	
	}
		int result = ns.write(vo ,fvoList);
		if (result <= 0) {
			throw new Exception("공지사항 작성 실패");
		}
		session.setAttribute("alertMsg", "공지사항 작성 완료");
		
		return "redirect:/notice/list";
	}
	
	//공지사항 상세보기
	@GetMapping("detail")
	public String detail(String num , Model model) throws Exception {
		NoticeVo vo = ns.getNotice(num);
		
		if (vo == null) {
			model.addAttribute("errorMsg","조회실패");
			return "common/error-page";
		}
		model.addAttribute("vo",vo);
		model.addAttribute("path","resources/upload/notice");
		return "notice/notice-detail";
	}
	
	
	//공지사항 수정하기
		@PostMapping("edit")
		public String edit(NoticeVo vo ,  Model model , HttpSession session, List<MultipartFile> f ,HttpServletRequest req) {
			
			String path = req.getServletContext().getRealPath("/resources/upload/board/");
			  List<String> changeNameList = FileUploader.upload(f, path);
			  List<String> originNameList = FileUploader.getOriginNameList(f);
			  
			//데이터 준비 (이름 리스트)
				List<FileVo> fvoList = new ArrayList<FileVo>();
				if (changeNameList != null) {
					int size = changeNameList.size();
					for (int i = 0; i < size; i++) {
						FileVo fvo = new FileVo();
						fvo.setOriginName(originNameList.get(i));
						fvo.setChangeName(changeNameList.get(i));
						fvoList.add(fvo);
				}
			}
			// 이전 첨부파일 목록 조회
			  List<FileVo> oldAttachments = ns.getAttachmentList(vo);
			  
			  // 첨부파일이 변경된 경우에만 처리
			   if (hasFileChanges(f, oldAttachments)) {
			    // 1. 첨부파일 삭제
			    ns.deleteAttachments(oldAttachments); // 첨부파일 삭제 메서드 호출

			  }
			  
			
			int result = ns.edit(vo,fvoList);
			
			if (result <= 0 ) {
				model.addAttribute("errorMsg","수정실패");
				return "common/error";
			}
			session.setAttribute("alertMsg", "수정성공");
			return "redirect:/notice/detail?num=" + vo.getNo();
		}
		private boolean hasFileChanges(List<MultipartFile> newAttachments, List<FileVo> oldAttachments) {
			  if (newAttachments.size() != oldAttachments.size()) {
			    return true; // 첨부파일 개수가 다르면 변경사항으로 간주
			  }

			  try {
			    MessageDigest md = MessageDigest.getInstance("MD5");

			    // 새로운 첨부파일과 이전 첨부파일 비교
			    for (int i = 0; i < newAttachments.size(); i++) {
			      MultipartFile newFile = newAttachments.get(i);
			      FileVo oldFile = oldAttachments.get(i);

			      // 파일 크기가 다르면 변경사항으로 간주
			      if (newFile.getSize() != oldFile.getSize()) {
			        return true;
			      }

			      // 파일 내용 비교
			      byte[] newFileBytes = newFile.getBytes();
			      byte[] oldFileBytes = readBytesFromFile(oldFile.getFilePath()); // 파일 경로에서 바이트 배열 읽어오는 메서드 호출

			      byte[] newHash = md.digest(newFileBytes);
			      byte[] oldHash = md.digest(oldFileBytes);

			      // 파일 내용이 다르면 변경사항으로 간주
			      if (!MessageDigest.isEqual(newHash, oldHash)) {
			        return true;
			      }
			    }
			  } catch (IOException e) {
			    // 파일 읽기 오류 처리
			    e.printStackTrace();
			  } catch (NoSuchAlgorithmException e) {
			    // 지원하지 않는 알고리즘 예외 처리
			    e.printStackTrace();
			  }

			  return false; // 변경사항이 없음
			}

		private byte[] readBytesFromFile(String filePath) throws IOException {
			  Path path = Paths.get(filePath);
			  return Files.readAllBytes(path);
			}
		
	//공지사항 삭제하기(관리자만)
	@GetMapping("delete")
	public String delete(String num) throws Exception {
		int result = ns.delete(num);
		
		if (result != 1) {
			throw new Exception("공지사항 삭제 실패");
		}
		return "redirect:/notice/list?page=1";
	}
	
	//파일 다운로드 (방식2) //ReqponseEntity
		@GetMapping("att/down")
		public ResponseEntity<ByteArrayResource> download(String ano , HttpServletRequest req) throws Exception {
			
			
			//바디 채우기
			//파일객체준비
			String path = req.getServletContext().getRealPath("/resources/upload/notice/");
			FileVo fvo = ns.getAttachment(ano);
			File f = new File(path + fvo.getChangeName());
			
			//바이트 형태로 변환
			byte[] data = FileUtils.readFileToByteArray(f);
			ByteArrayResource bar = new ByteArrayResource(data);
			
			//헤더 채우기 (객체 만들면서 바로 진행)
			//ResponseEntity 만들기
			ResponseEntity<ByteArrayResource> entity =ResponseEntity
				.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + "\"" + URLEncoder.encode(fvo.getOriginName() ,"UTF-8") + "\"")
				.header(HttpHeaders.CONTENT_ENCODING,"UTF-8")
				.contentLength(data.length)
				.body(bar)
				;
			
			return entity;
		}
}
