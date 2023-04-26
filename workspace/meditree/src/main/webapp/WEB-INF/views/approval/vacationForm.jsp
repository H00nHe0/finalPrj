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
								전자결재 | <b>지출결의서</b>
							</h2>
							<hr>
							
								<div class="rec">
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">부서</label>
										<div class="col-sm-10">
											<input type="name" class="form-control" id="name">
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">직위</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="telNo">
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">결재요청자</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="telNo">
										</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">작성일</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="telNo">
										</div>
									</div>

									<div class="input-group mb-3">
										<label class="col-sm-2 col-form-label">소속과</label> <select
											class="form-select" aria-label="Default select example">
											<option selected>선택</option>
											<option value="1">간호부</option>
											<option value="2">원무부</option>
											<option value="3">경영지원부</option>
											<option value="4">일반외과</option>
											<option value="5">일반내과</option>
											<option value="6">정신과</option>
											<option value="7">이비인후과</option>
											<option value="8">산부인과</option>
											<option value="9">수술실</option>
											<option value="10">일반</option>
										</select>
									</div>

									<div class="input-group mb-3">
										<label class="col-sm-2 col-form-label">직급</label> <select
											class="form-select" aria-label="Default select example">
											<option selected>선택</option>
											<option value="1">병원장</option>
											<option value="2">의사</option>
											<option value="3">레지던트</option>
											<option value="4">간호사</option>
											<option value="5">사원</option>
											<option value="6">부장</option>
											<option value="7">팀장</option>
											<option value="8">인턴</option>
										</select>
									</div>

									<div class="row mb-3">
										<label class="col-sm-2 col-form-label">프로필 사진</label>
										<div class="col-sm-10">
											<input type="file" class="form-control" id="inputGroupFile04"
												aria-describedby="inputGroupFileAddon04" aria-label="Upload">
										</div>
									</div>
								</div>
								<div class="btnwech">
									<button class="btn btn-primary" type="submit">등록</button>
									<button class="btn btn-primary" type="submit">초기화</button>
								</div>
						</div>

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