/*
 * package com.medi.app.mail.controller;
 * 
 * import java.io.File; import java.net.URLEncoder; import java.util.ArrayList;
 * import java.util.HashMap; import java.util.List; import java.util.Map;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.apache.commons.io.FileUtils; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.core.io.ByteArrayResource; import
 * org.springframework.http.HttpHeaders; import
 * org.springframework.http.MediaType; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.SessionAttribute; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * import com.medi.app.common.file.FileUploader; import
 * com.medi.app.common.file.FileVo; import com.medi.app.common.page.PageVo;
 * import com.medi.app.mail.service.MailService; import
 * com.medi.app.mail.vo.MailVo; import com.medi.app.member.vo.MemberVo;
 * 
 * @Controller
 * 
 * @RequestMapping("mail") public class MailController {
 * 
 * private final MailService ms;
 * 
 * @Autowired public MailController(MailService ms) { this.ms = ms; }
 * 
 * //받은 메일 목록조회
 * 
 * @GetMapping("inlist") public String getMailList(MailVo
 * vo, @RequestParam(defaultValue = "1") int page, Model
 * model, @SessionAttribute MemberVo loginMember) throws Exception {
 * 
 * if (loginMember == null) { throw new Exception("로그인 후 이용이 가능합니다."); }
 * 
 * String receiver = loginMember.getNo(); vo.setReceiver(receiver);
 * 
 * 
 * int listCount = ms.getCnt(); int currentPage = page; int pageLimit = 5; int
 * boardLimit = 5;
 * 
 * PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
 * 
 * Map<String, Object> inListMap = new HashMap<>(); inListMap.put("pageVo", pv);
 * inListMap.put("receiver", receiver);
 * 
 * List<MailVo> mvoList = ms.getMailList(inListMap);
 * model.addAttribute("pv",pv); model.addAttribute("mvoList",mvoList);
 * System.out.println(pv); return "mail/mail-inlist"; }
 * 
 * //보낸 메일 목록 보기
 * 
 * @GetMapping("sendlist") public String sendMailList(MailVo
 * vo, @RequestParam(defaultValue = "1") int page, Model
 * model, @SessionAttribute MemberVo loginMember) throws Exception { if
 * (loginMember == null) { throw new Exception("로그인 후 이용이 가능합니다."); } String
 * writer = loginMember.getNo(); vo.setReceiver(writer);
 * 
 * int listCount = ms.getSendMailListCnt(); int currentPage = page; int
 * pageLimit = 5; int boardLimit = 5;
 * 
 * PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
 * Map<String, Object> sendListMap = new HashMap<>(); sendListMap.put("pageVo",
 * pv); sendListMap.put("writer", writer); List<MailVo> mvoList =
 * ms.getSendMailList(sendListMap);
 * 
 * model.addAttribute("pv",pv); model.addAttribute("mvoList",mvoList); return
 * "mail/mail-sendlist"; }
 * 
 * //메일 작성하기(화면)
 * 
 * @GetMapping("write") public String write() { return "mail/mail-send"; }
 * 
 * //메일 작성하기(기능)
 * 
 * @PostMapping("write") public String write(HttpServletRequest req,
 * List<MultipartFile> f , MailVo vo, @SessionAttribute MemberVo loginMember,
 * HttpSession session) throws Exception {
 * 
 * if (loginMember == null) { throw new Exception("로그인 후 이용이 가능합니다."); }
 * 
 * //데이터 준비 (파일) String path =
 * req.getServletContext().getRealPath("/resources/upload/mail/"); List<String>
 * changeNameList = FileUploader.upload(f, path); List<String> originNameList =
 * FileUploader.getOriginNameList(f);
 * 
 * //데이터 준비 (이름 리스트) List<FileVo> fvoList = new ArrayList<FileVo>(); if
 * (changeNameList != null) { int size = changeNameList.size(); for (int i = 0;
 * i < size; i++) { FileVo fvo = new FileVo();
 * fvo.setOriginName(originNameList.get(i));
 * fvo.setChangeName(changeNameList.get(i)); fvoList.add(fvo); } } int result =
 * ms.write(vo ,fvoList); if (result <= 0) { throw new Exception("메일 작성 실패"); }
 * session.setAttribute("alertMsg", "메일 작성 완료");
 * 
 * return "redirect:/mail/inlist"; }
 * 
 * //메일 삭제하기
 * 
 * @GetMapping("delete") public String delete() { return "mail/mail-delete-box";
 * }
 * 
 * //삭제한 메일 보기
 * 
 * @GetMapping("delbox") public String delBox(@RequestParam(defaultValue = "1")
 * int page, Model model, @SessionAttribute MemberVo loginMember) { if
 * (loginMember == null) { throw new Exception("로그인 후 이용이 가능합니다."); }
 * 
 * int listCount = ms.getDelBoxListCnt(); int currentPage = page; int pageLimit
 * = 5; int boardLimit = 5;
 * 
 * PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
 * List<MailVo> mvoList = ms.getDelBoxList(pv);
 * 
 * model.addAttribute("pv",pv); model.addAttribute("mvoList",mvoList); return
 * "mail/mail-delete-box"; }
 * 
 * //받은 메일 상세보기
 * 
 * @GetMapping("indetail") public String inDetail() { return
 * "mail/mail-indetail"; }
 * 
 * //보낸 메일 상세보기
 * 
 * @GetMapping("senddetail") public String sendDetail() { return
 * "mail/mail-senddetail"; }
 * 
 * //메일 영구삭제
 * 
 * @GetMapping("fdel") public String fDel() { return ""; }
 * 
 * //파일 다운로드 (방식2) //ReqponseEntity
 * 
 * @GetMapping("att/down") public ResponseEntity<ByteArrayResource>
 * download(String ano , HttpServletRequest req) throws Exception {
 * 
 * //바디 채우기 //파일객체준비 String path =
 * req.getServletContext().getRealPath("/resources/upload/mail/"); FileVo fvo =
 * ms.getAttachment(ano); File f = new File(path + fvo.getChangeName());
 * 
 * //바이트 형태로 변환 byte[] data = FileUtils.readFileToByteArray(f);
 * ByteArrayResource bar = new ByteArrayResource(data);
 * 
 * //헤더 채우기 (객체 만들면서 바로 진행) //ResponseEntity 만들기
 * ResponseEntity<ByteArrayResource> entity =ResponseEntity .ok()
 * .contentType(MediaType.APPLICATION_OCTET_STREAM)
 * .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + "\"" +
 * URLEncoder.encode(fvo.getOriginName() ,"UTF-8") + "\"")
 * .header(HttpHeaders.CONTENT_ENCODING,"UTF-8") .contentLength(data.length)
 * .body(bar) ;
 * 
 * return entity; }
 * 
 * }
 */
