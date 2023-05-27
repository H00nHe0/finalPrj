<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap')
	;

body h1 {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.shadow {
	width: 90%;
	height: 800px;
	margin: auto;
	margin-top: 40px;
}

.approve {
	margin-left: 20px;
	margin-right: 20px;
}

.allApp {
	margin-top: 30px;
	margin-bottom: 30px;
}

.btnfloat {
	float: right;
	padding-right: 30px;
}

.page-navi {
	margin-top: 50px;
}

#search-area {
	display: flex;
	float: right;
	margin-bottom: 20px;
	padding-right: 30px;
}

#main {
	display: grid;
	grid-template-columns: 1fr 8fr;
}

#board {
	align-items: center;
	justify-content: center;
	background-color: #f3f3f4;
}

/* 신청  */
.appr-inner-table {
	border-width: 1px;
	width: 150px;
	height: 20px;
	font-size: 13px;
}

.appr-inner-table img {
	width: 40px;
	height: 40px;
	display: block;
	margin-bottom: 5px;
}

/* 결재문 작성 */
.appr-table th {
	font-weight: 550;
	text-align: center;
	background: #f7f7f7;
	color: rgb(72, 72, 72);
	border-width: 2px;
}

.appr-table input {
	border: none;
}

.btn-outline-success {/* 이전목록 버튼 */
	float: right;
	display: flex;
	justify-content: center;
	margin-right: 5px;
	color: #82CBC4;
	border-color: #82CBC4;
}

.btn-outline-success:hover {
	background: #82CBC4;
	border-color: #82CBC4;
	color: white;
}

.appr-write-btn { /* 결재하기 버튼 */
	background: #82CBC4;
	color: white;
	float: right;
	justify-content: center;
}

.appr-write-btn:hover {
	background: #82CBC4;
	color: white;
}

.appr-table-wrapper {
	width: 1050px;
	padding-left: 40px;
}

.appr-modal-tb th {
	background: #f7f7f7;
	color: rgb(72, 72, 72);
	border-width: 2px;
}

.appr-modal-tb .mdi-chevron-double-right {
	color: dimgray;
	font-size: 20px;
}

.appr-modal-tb .mdi-delete-forever {
	color: gray;
	font-size: 18px;
}

#form-modal-th {
	height: 40px;
	line-height: 2;
}

#formModalLabel {
	margin-left: 160px;
	line-height: 1.5;
	font-weight: 600px;
}
</style>
</head>
<body>

	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/common.jsp"%>

		<div id="main">
			<%@ include file="/WEB-INF/views/common/commonSidebar.jsp"%>
			<div id="board">


				<div class="shadow p-3 mb-5 bg-body rounded">
					<br>
					<div class="approve">
						<h2>
							전자결재 | <b>결재대기 문서 상세보기</b>
						</h2>
						<hr>
						<div class="allApp">
							<button type="button" class="btn appr-write-btn"
								data-bs-toggle="modal" data-bs-target="#apprModal">
								결재하기</button>
							<button type="button" class="btn btn-outline-success"
								onclick="history.back();">이전목록</button>
						</div>

						<table class="table">
							<!-- <thead class="table-light"> -->
							<tr>
								<th>기안부서</th>
								<td>${ s.deptName }</td>
								<th>기안자</th>
								<td>${ s.empName }</td>
							</tr>
							<tr>
								<th>문서번호</th>
								<td>${ s.apprNo }</td>
								<th>문서보존기간</th>
								<td>&nbsp;&nbsp;&emsp;&emsp;&emsp;5년</td>
							</tr>
							<!-- </thead> -->


							<tr>
								<th>신청</th>
								<td>
									<table class="table table-bordered appr-inner-table">
										<tr>
											<th style="text-align: center;">${ s.jobName }의사</th>
										</tr>
										<tr align="center">
											<td height="90"><img
												src="resources/images/kma/approved.png">${ s.enrollDate }도장사진
											</td>
										</tr>
										<tr align="center">
											<td>${ s.empName }부서이름</td>
										</tr>
									</table>
								</td>

								<th>처리</th>
								<td>
									<table class="table table-bordered appr-inner-table">
										<tr>
											<th style="text-align: center;">${ s.jobName }병원장</th>
										</tr>
										<tr align="center">
											<td height="90"><img
												src="resources/images/kma/approved.png">${ s.enrollDate }도장사진
											</td>
										</tr>
										<tr align="center">
											<td>${ s.empName }부서이름</td>
										</tr>
									</table>
								</td>
							</tr>

							<script>
								$(document)
										.ready(
												function() { // 테이블에 출력할 요소

													let jobArr = [];
													let empArr = [];
													let dateArr = [];
													<c:forEach var="i" items="${ line }">
													jobArr.push("${i.jobName}");
													empArr.push("${i.empName}");
													dateArr
															.push("${i.lineDate}");
													</c:forEach>

													$('#line-job')
															.children()
															.each(
																	function(
																			index,
																			item) { // 직급 출력
																		$(item)
																				.text(
																						jobArr[index]);
																	})

													$('#line-emp')
															.children()
															.each(
																	function(
																			index,
																			item) { // 이름 출력

																		$(item)
																				.text(
																						empArr[index]);
																	})

													$('#line-appr')
															.children()
															.each(
																	function(
																			index,
																			item) { // 승인도장 + 날짜 출력

																		if (dateArr[index] != ""
																				&& typeof dateArr[index] != 'undefined') {
																			$(
																					item)
																					.html(
																							"<img src='resources/images/kma/approved.png'>"
																									+ dateArr[index]);
																		}
																	})

													let refArr = [];
													<c:forEach var="r" items="${ ref }">
													refArr.push("${r.empName}");
													</c:forEach>

													$("#ref-name").text(
															refArr.join(", ")); // 참조자 이름 출력
												})
							</script>
							</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="5"><i class="mdi mdi-paperclip"></i>
								<c:choose>
										<c:when test="${ empty s.originName }">
			                    			첨부파일이 없습니다.
			                    		</c:when>
										<c:otherwise>
											<a href="${ s.changeName }" download="${ s.originName }">${ s.originName }</a>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</table>


						<script>
							$("#approve")
									.append(
											"<input type='hidden' value='" + apprTotal + "' name='apprTotal'>");
						</script>

						<c:choose>
							<c:when test="${ s.formNo eq 1 }">
								<!-- 결재양식이 휴가신청서일 경우 -->
								<br>
								<br>
								<h3 align="center" style="font-weight: 550;">휴가 신청서</h3>
								<br>
								<br>
								<table class="table table-bordered appr-table">
									<tr>
										<th width="350">종류</th>
										<td>연차</td>
									</tr>
									<tr>
										<th>일수</th>
										<td id="vacDays">${ v.vacDays }일</td>
									</tr>
									<tr>
										<th>사유</th>
										<td>${ v.vacCause }</td>
									</tr>
								</table>
							</c:when>
							<c:when test="${ s.formNo eq 2 }">
								<!-- 결재양식이 연장근무일 경우 -->
								<br>
								<br>
								<h3 align="center" style="font-weight: 550;">연장근무 신청서</h3>
								<br>
								<br>
								<table class="table table-bordered appr-table">
									<tr>
										<th width="350">근무날짜</th>
										<td>${ o.overDate }</td>
									</tr>
									<tr>
										<th>근무시작시간</th>
										<td colspan="5">${ o.startTime }</td>
									</tr>
									<tr>
										<th>근무종료시간</th>
										<td colspan="5">${ o.endTime }</td>
									</tr>
									<tr>
										<th>총근무시간</th>
										<td colspan="5">${ o.totalTime }시간</td>
									</tr>
									<tr>
										<th>근무사유</th>
										<td colspan="5">${ o.overCause }</td>
									</tr>
								</table>
							</c:when>
							<c:otherwise>
								<!-- 결재양식이 에디터폼일 경우 -->
								<table class="table table-bordered appr-table">
									<tr>
										<td colspan="8" align="center" id="apprContent"><br>
											<br> ${ s.apprContent } <br> <br></td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>
						<br> <br>
						<!-- 결재하기 모달창 -->
						<div class="modal fade" id="apprModal" tabindex="-1"
							aria-labelledby="apprModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content" style="background: white;">
									<div class="modal-header">
										<h5 class="modal-title" id="apprModalLabel"
											style="margin-left: 5px;">결재하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form id="approve" action="" method="post">
										<input type="hidden" name="apprNo" value="${ s.apprNo }">
										<input type="hidden" name="empNo" value="${ loginUser.empNo }">
										<input type="hidden" name="formNo" value="${ s.formNo }">
										<input type="hidden" name="startDate" value="${ v.startDate }">
										<input type="hidden" name="endDate" value="${ v.endDate }">
										<input type="hidden" name="apprTotal" value="${ s.apprTotal }">
										<div class="modal-body" style="height: 220px;">
											<div class="form-group row"
												style="width: 450px; padding-left: 10px; margin-top: 7px;">
												<label class="col-sm-3 col-form-label">결재문서명</label>
												<div class="col-sm-9">
													<input type="text" class="form-control appr-tb-input"
														value="${ s.apprTitle }"
														style="background: none; margin-top: 4px; padding-left: 0; border: none;"
														readonly>
												</div>
												<label class="col-sm-3 col-form-label">결재의견</label>
												<div class="col-sm-9">
													<textarea rows="5" cols="36" name="lineComment"
														style="margin-top: 10px; border: 1px solid lightgray;"></textarea>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary btn-sm"
												data-bs-dismiss="modal">취소</button>
											<button type="button" class="btn btn-success btn-sm"
												style="background: RGB(29, 92, 99); color: white;"
												onclick="postFormSubmit('endApprove.si');">전결</button>
											<button type="button" class="btn btn-success btn-sm"
												style="background: RGB(29, 92, 99); color: white;"
												onclick="postFormSubmit('approve.si');">결재</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- 결재모달창 end -->
						<script>
							function postFormSubmit(url) {

								let result;
								if (url == 'approve.si') {
									result = confirm("결재하시겠습니까?");
								} else {
									result = confirm("전결 처리하시겠습니까?");
								}

								if (result == true) {
									$("#approve").attr("action", url).submit();
								}
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
