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
							<div class="allApp">

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
										<th>기안일</th>
										<th>완료일</th>
										<th>결재양식</th>
										<th>제목</th>
										<th>기안부서</th>
										<th>결재자</th>
										<th>문서번호</th>
										<th>결재상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2023-05-01</td>
										<td>2023-06-12</td>
										<td>휴가신청(기본)</td>
										<td>[교육]총무팀 강동원 팀장</td>
										<td>총무팀</td>
										<td>강동원</td>
										<td>20230502083</td>
										<td>결재완료</td>
									</tr>
									<tr>
										<td>2023-05-01</td>
										<td>2023-06-12</td>
										<td>휴가신청(기본)</td>
										<td>[교육]총무팀 강동원 팀장</td>
										<td>총무팀</td>
										<td>강동원</td>
										<td>20230502083</td>
										<td>결재완료</td>
									</tr>
									<tr>
										<td>2023-05-01</td>
										<td>2023-06-12</td>
										<td>휴가신청(기본)</td>
										<td>[교육]총무팀 강동원 팀장</td>
										<td>총무팀</td>
										<td>강동원</td>
										<td>20230502083</td>
										<td>결재완료</td>
									</tr>
									<tr>
										<td>2023-05-01</td>
										<td>2023-06-12</td>
										<td>휴가신청(기본)</td>
										<td>[교육]총무팀 강동원 팀장</td>
										<td>총무팀</td>
										<td>강동원</td>
										<td>20230502083</td>
										<td>결재완료</td>
									</tr>
									<tr>
										<td>2023-05-01</td>
										<td>2023-06-12</td>
										<td>휴가신청(기본)</td>
										<td>[교육]총무팀 강동원 팀장</td>
										<td>총무팀</td>
										<td>강동원</td>
										<td>20230502083</td>
										<td>결재완료</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="page-navi">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item disabled"><a class="page-link">Previous</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>