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
	margin-top: 80px;
	margin-bottom: 30px;
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
.appr-write-btn { /* 검색하기 버튼 */
	border-color: #82CBC4;
	color: #82CBC4;
	float: right;
	display: flex;
	justify-content: center;
}
.appr-write-btn:hover {  /*검색 버튼 호버 */
	background: #82CBC4;
	border-color: #82CBC4;
	color: white;
}

.btn-green { /* 기안하기 버튼 */
	background: #82CBC4;
	color: white;
	float: right;
	display: flex;
	justify-content: center;
	border-color: #82CBC4;
	margin-right: 71px;
}

.btn-green:hover {
	border-color: #82CBC4;
	color: #82CBC4;
}

</style>
</head>
<body>

	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/common.jsp"%>

		<div id="main">
			<%@ include file="/WEB-INF/views/common/commonSidebar.jsp"%>
			<div id="board">

				<form action="">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<br>
						<div class="approve">
							<h2>
								전자결재 | <b>전체 문서함</b>
							</h2>
							<hr>
							<div class="allApp"></div>

							<table class="table table-hover" id="appr-manage-table">
								<thead class="table-light" align="center">
									<tr>
										<th>번호</th>
										<th>기안일</th>
										<th>제목</th>
										<th>결재상태</th>
									</tr>
								</thead>
								<tbody align="center">
									<c:choose>
										<c:when test="${empty elevoList}">
											<tr>
												<td colspan="4">기안한 문서가 없습니다.</td>
											<tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="evo" items="${ elevoList }">
												<tr>
													<td>${evo.no}</td>
													<td>${evo.enrollDate}</td>
													<td>${evo.title}</td>
													<td>
													<c:choose>
														<c:when test="${ evo.status eq 'H' || evo.status eq 'I' }">
															<span class="badge" style="background:RGB(65, 125, 122); border:none;">진행중</span>
														</c:when>
														<c:when test="${ evo.status eq 'X' }">
															<span class="badge" style="background:crimson; border:none;">반&emsp;려</span>
														</c:when>
														<c:otherwise>
															<span class="badge" style="background:#82CBC4; border:none;">완&emsp;료</span>
														</c:otherwise>
													</c:choose>
												</td>
												</tr>
											</c:forEach>
										</c:otherwise>
								    </c:choose>
								</tbody>
							</table>
						</div>
						
						<br>
							<c:if test="${loginMember.no != '999999'}">
								<a href="${root}/eleSign/write" class="btn btn-green">기안하기</a>
							</c:if>
						<br>

						<!-- 페이징 처리 -->
						<div id="page-area">
							<c:if test="${pv.currentPage > 1}">
								<a class = "btn btn-primary btn-sm" href="${root}/eleSign/list?page=${pv.currentPage-1}">이전</a>
							</c:if>
							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class = "btn btn-primary btn-sm" href="${root}/eleSign/list?page=${i}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class = "btn btn-secondary btn-sm">${i}</a>
							</c:if>
							</c:forEach>
							<c:if test="${pv.currentPage < pv.maxPage}">
							<a class = "btn btn-primary btn-sm" href="${root}/eleSign/list?page=${pv.currentPage+1}">다음</a>
							</c:if>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<script>

	// 테이블안에 tbody 눌렀을 때 상세보기
	const table = document.querySelector("#appr-manage-table tbody");
	table.addEventListener("click",(event)=>{
	   const num = event.target.parentNode.children[0].innerText; 
	   location.href = '${root}/eleSign/detail?num=' + num;
	});

</script>