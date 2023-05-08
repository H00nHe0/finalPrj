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

.appr-write-btn { /* 양식추가 버튼 */
	background: #82CBC4;
	color: white;
	float: right;
	justify-content: center;
	margin-right: 40px;
	border-color: #82CBC4;
}

.appr-write-btn:hover {
	background: #82CBC4;
	color: white;
}

#appr-all-table th {
	font-weight: 550;
}

#appr-all-table>tbody>tr>td {
	height: 50px;
}

#appr-manage-table>thead>tr {
	border-top: 1px solid lightgray;
}

#appr-manage-select { /* 카테고리 */
	height: 30px;
	font-size: 14px;
	float: right;
	margin-right: 15px;
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
							전자결재 | <b>결재양식 관리 목록</b>
						</h2>
						<hr>
						<br>
						<div class="appr-table-wrapper" style="margin-left: 20px;">

							<div id="search-area">
								<select name="searchType" id="appr-manage-select">
									<option>전체</option>
									<option>양식종류</option>
									<option>사용</option>
									<option>미사용</option>
								</select>
							</div>

							<table class="table " id="appr-manage-table">
								<thead align="center">
									<tr>
										<th>번호</th>
										<th>사용여부</th>
										<th>양식종류</th>
										<th>양식명</th>
										<th>양식설명</th>
									</tr>
								</thead>
								<tbody align="center">
									<c:choose>
										<c:when test="${ empty list }">
											<tr>
												<td colspan="5">사용 가능한 양식이 없습니다.</td>
											<tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="f" items="${ list }">
												<tr>
													<td class="formNo">${ f.formNo }</td>
													<c:choose>
														<c:when test="${ f.formStatus eq 'Y' }">
															<td>사용</td>
														</c:when>
														<c:otherwise>
															<td>미사용</td>
														</c:otherwise>
													</c:choose>
													<td>${ f.formType }</td>
													<td>${ f.formTitle }</td>
													<td>${ f.formInfo }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<br>
							<button class="btn appr-write-btn"
								onclick="location.href='formEnrollForm.si'">양식추가</button>


							<script>
								$(function() {
									$("#appr-manage-table>tbody>tr")
											.click(
													function() {
														location.href = 'formDetail.si?formNo='
																+ $(this)
																		.find(
																				".formNo")
																		.text();
													})
								})
							</script>

							<!-- 페이징 -->
							<div class="page-navi">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<li class="page-item disabled"><a class="page-link">Previous</a>
										</li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
