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
	margin-left: 70px;
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
								전자결재 | <b>결재양식 관리</b>
							</h2>
							<hr>
							<div class="allApp">

								<div id="search-area">
									<select name="searchType">
										<option value="form">양식종류</option>
										<option value="title">양식명</option>
									</select>
								</div>

							</div>
							<table class="table table-hover">
								<thead class="table-light">
									<tr>
										<th>번호</th>
										<th>사용여부</th>
										<th>양식종류</th>
										<th>양식명</th>
										<th>양식설명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>사용</td>
										<td>일반</td>
										<td>지출결의서</td>
										<td>전체부서 지출결의서</td>
									</tr>
									<tr>
										<td>1</td>
										<td>사용</td>
										<td>일반</td>
										<td>지출결의서</td>
										<td>전체부서 지출결의서</td>
									</tr>
									<tr>
										<td>1</td>
										<td>사용</td>
										<td>일반</td>
										<td>지출결의서</td>
										<td>전체부서 지출결의서</td>
									</tr>
									<tr>
										<td>1</td>
										<td>사용</td>
										<td>일반</td>
										<td>지출결의서</td>
										<td>전체부서 지출결의서</td>
									</tr>
									<tr>
										<td>1</td>
										<td>사용</td>
										<td>일반</td>
										<td>지출결의서</td>
										<td>전체부서 지출결의서</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnfloat">
							<a href="${root}/bipumwrite.jsp" class="btn btn-secondary">양식추가</a>
						</div>
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
				</form>
			</div>
		</div>
	</div>

</body>
</html>