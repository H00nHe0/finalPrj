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

.table-light tr>th, td {
	text-align: center;
}

.shadow {
	width: 90%;
	height: 600px;
	margin: auto;
	margin-top: 40px;
}

.approve {
	margin-left: 10px;
}

.allApp {
	margin-top: 30px;
	margin-bottom: 30px;
}

.btnfloat {
	float: right;
	padding-right: 30px;
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

.appr-write-btn { /* 일괄결재 버튼 */
	background: #82CBC4;
	color: white;
	justify-content: center;
	margin-right: 40px;
	border-color: #82CBC4;
}

.appr-write-btn:hover {
	background: #82CBC4;
	color: white;
}
#page-area{
   	text-align: center;
   	padding-top: 20px;
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
							전자결재 | <b>결재대기 문서함</b>
						</h2>
						<hr>
						<div class="allApp">

							<button type="button" class="btn appr-write-btn"
								onclick="allApprove('allApprove.si');">일괄결재</button>

							<div id="search-area">
								<select name="searchType">
									<option>제목</option>
									<option>결재양식</option>
								</select> <input type="text" class="form-control"
									placeholder="검색어를 입력해주세요">
							</div>
						</div>

						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th>선택</th>
									<th>문서번호</th>
									<th>결재양식</th>
									<th>제목</th>
									<th>기안자</th>
									<th>기안일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="6" align="center">결재대기 문서가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="a" items="${ list }">
											<tr>
												<td class="check"><input type="checkbox" value="1"></td>
												<td class="apprNo">${ a.apprNo }</td>
												<td>${ a.formTitle }</td>
												<td>${ a.apprTitle }&nbsp;<c:if
														test="${ not empty a.originName }">
														<i class="mdi mdi-paperclip" style="color: gray;"></i>
														<span style="color: gray;">1</span>
													</c:if>
												</td>
												<td>${ a.empName }</td>
												<td>${ a.enrollDate }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>

					<!-- 페이징 처리 -->
						<div id="page-area">
							<c:if test="${pv.currentPage > 1}">
								<a class = "btn btn-primary btn-sm" href="${root}/bipum/list?page=${pv.currentPage-1}">이전</a>
							</c:if>
							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class = "btn btn-primary btn-sm" href="${root}/bipum/list?page=${i}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class = "btn btn-secondary btn-sm">${i}</a>
							</c:if>
							</c:forEach>
							<c:if test="${pv.currentPage < pv.maxPage}">
							<a class = "btn btn-primary btn-sm" href="${root}/bipum/list?page=${pv.currentPage+1}">다음</a>
							</c:if>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script>
	$(function() { // 상세페이지
		$(".appr-standby-tb>tbody").on(
				'click',
				'tr td:not(:first-child)',
				function(e) {
					location.href = 'apprStandbyDetail.si?apprNo='
							+ $(e.target).siblings(".apprNo").text();
				})
	})

	function allApprove(url) { // 일괄결재

		$('input[type=checkbox]:checked').each(
				function(index, item) {
					$("#allApprove").append(
							"<input type='hidden' value='"
									+ $(item).parent().siblings('.apprNo')
											.text() + "' name='lineList["
									+ index + "].apprNo'>")
				})

		let result = confirm("일괄결재 하시겠습니까? 일괄결재 시 결재의견은 '승인합니다'로 통일됩니다.");
		if (result == true) {
			$("#allApprove").attr("action", url).submit();
		}
	}
</script>