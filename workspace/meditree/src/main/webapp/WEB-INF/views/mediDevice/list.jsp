<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mediDeviceList</title>
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

.table {
	margin-top: 20px;
}

.htitle {
	width: 300px;
	height: 100px;
	margin: auto;
	padding-top: 40px;
	text-align: center;
}

.shadow {
	width: 90%;
	height: 600px;
	margin: auto;
	margin-top: 40px;
}

.btnfloat {
	float: right;
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
#page-area{
    	text-align: center;
    	padding-top: 20px;
}
.btn-outline-success {/* 상세보기 버튼 */
	justify-content: center;
	color: #82CBC4;
	border-color: #82CBC4;
}

.btn-outline-success:hover {
	background: #82CBC4;
	border-color: #82CBC4;
	color: white;
}
.appr-write-btn { /* 등록하기 버튼 */
	float: right;
	margin-bottom: 20px;
	background: #82CBC4;
	color: white;
	justify-content: center;
	margin-right: 10px;
	border-color: #82CBC4;
}

.appr-write-btn:hover {
	background: #82CBC4;
	color: white;
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
						<div class="htitle">
							<h1>의료기기 목록</h1>
						</div>
						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th>번호</th>
									<th>기기명</th>
									<th>종류</th>
									<th>작동여부</th>
									<th>등록일시</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mdvoList}" var="mdvo">
									<tr>
										<td>${mdvo.no}</td>
										<td>${mdvo.name}</td>
										<td>${mdvo.type}</td>
										<td>${mdvo.status}</td>
										<td>${mdvo.enrollDate}</td>
										<td><a class="btn btn-outline-success btn-sm" href="${root}/mediDevice/detail?num=${mdvo.no}">상세보기</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
							<!-- 페이징 처리 -->
						<div id="page-area">
							<c:if test="${pv.currentPage > 1}">
								<a class = "btn btn-primary btn-sm" href="${root}/mediDevice/list?page=${pv.currentPage-1}">이전</a>
							</c:if>
							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class = "btn btn-primary btn-sm" href="${root}/mediDevice/list?page=${i}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class = "btn btn-secondary btn-sm">${i}</a>
							</c:if>
							</c:forEach>
							<c:if test="${pv.currentPage < pv.maxPage}">
							<a class = "btn btn-primary btn-sm" href="${root}/mediDevice/list?page=${pv.currentPage+1}">다음</a>
							</c:if>
						</div>
						
							<!-- 관리자일 때만 등록하기 버튼 보이게 -->
						<%-- <c:if test="${loginMember.id == 'ADMIN' }"> 
						</c:if>--%>
						<div class="btnfloat">
							<a href="${root}/mediDevice/write" class="btn appr-write-btn">등록하기</a>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>