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

.htitle {
	width: 300px;
	height: 100px;
	margin: auto;
	padding-top: 10px;
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
						<div class="htitle">
							<h1>비품 목록</h1>
						</div>
						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th>번호</th>
									<th>비품명</th>
									<th>설명</th>
									<th>등록일시</th>
									<th>수량</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>환자복(상의)</td>
									<td>이것은 환자복입니다</td>
									<td>2023.04.25</td>
									<td>10</td>
									<td><a class="btn btn-outline-secondary btn-sm"
										href="${root}/bipumDetail.jsp">상세보기</a>
									<td>
								</tr>
								<tr>
									<td>2</td>
									<td>Jacob</td>
									<td>@fat</td>
									<td>@mdo</td>
									<td>@mdo</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Jacob</td>
									<td>@mdo</td>
									<td>@mdo</td>
									<td>@mdo</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<td>4</td>
									<td>Jacob</td>
									<td>@mdo</td>
									<td>@mdo</td>
									<td>@mdo</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<td>5</td>
									<td>Jacob</td>
									<td>@mdo</td>
									<td>@mdo</td>
									<td>@mdo</td>
									<td>@mdo</td>
								</tr>
							</tbody>
						</table>
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

						<div class="btnfloat">
							<a href="${root}/bipumwrite.jsp" class="btn btn-secondary">등록하기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>