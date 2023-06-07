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
							전자결재 | <b>결재양식 관리</b>
						</h2>
						<hr>
						<br>
						<div class="appr-table-wrapper" style="margin-top: 30px;">

							<table class="table table-hover" id="appr-manage-table">
								<thead class="table-light" align="center">
									<tr>
										<th>번호</th>
										<th>사용여부</th>
										<th>양식명</th>
										<th>양식설명</th>
									</tr>
								</thead>
								<tbody align="center">
									<c:choose>
										<c:when test="${empty apvoList}">
											<tr>
												<td colspan="4">사용 가능한 양식이 없습니다.</td>
											<tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="avo" items="${apvoList}">
												<tr>
													<td class="no">${avo.no}</td>
													<c:choose>
														<c:when test="${ avo.status eq 'O' }">
															<td>사용</td>
														</c:when>
														<c:otherwise>
															<td>미사용</td>
														</c:otherwise>
													</c:choose>
													<td>${avo.formTitle}</td>
													<td>${avo.info}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<br>
								<a href="${root}/appr/write" class="btn appr-write-btn">양식추가</a>
							<br>
							<!-- 페이징 처리 -->
							<div id="page-area">
								<c:if test="${pv.currentPage > 1}">
									<a class = "btn btn-primary btn-sm" href="${root}/appr/list?page=${pv.currentPage-1}">이전</a>
								</c:if>
								<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
								<c:if test="${pv.currentPage != i}">
									<a class = "btn btn-primary btn-sm" href="${root}/appr/list?page=${i}">${i}</a>
								</c:if>
								<c:if test="${pv.currentPage == i}">
									<a class = "btn btn-secondary btn-sm">${i}</a>
								</c:if>
								</c:forEach>
								<c:if test="${pv.currentPage < pv.maxPage}">
								<a class = "btn btn-primary btn-sm" href="${root}/appr/list?page=${pv.currentPage+1}">다음</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>

    const table = document.querySelector("#appr-manage-table tbody");
    table.addEventListener("click",(event)=>{
       const num = event.target.parentNode.children[0].innerText; 
       location.href = '${root}/appr/detail?num=' + num;
    });

</script>
