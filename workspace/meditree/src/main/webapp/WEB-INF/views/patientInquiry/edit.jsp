<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>join</title>
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

body h2 {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

#joinForm {
	margin: auto;
}

.table-light tr>th, td {
	text-align: center;
}

.htitle {
	width: 200px;
	height: 100px;
	margin: auto;
	padding-top: 15px;
	text-align: center;
}

.shadow {
	width: 80%;
	height: 500px;
	margin: auto;
	margin-top: 80px;
}

.rec {
	width: 60%;
	margin: auto;
}

.btn {
	margin-top: 30px;
	margin-right: 50px;
}

.btnwech {
	margin: auto;
	display: flex;
	justify-content: center;
	margin-left: 65px;
}

.btn-primary {
	background-color: #82CBC4;
	border: none;
	
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

				<form action="${root}/patientInquiry/edit" method="post">
				<input type="hidden" name="no" value="${vo.no}">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<div class="htitle">
							<h2>환자정보 수정</h2>
						</div>

							<div class="rec">
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">이름</label>
									<div class="col-sm-10">
										<input type="text" name="paName" class="form-control" id="paName" value="${vo.paName}" required>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">연락처</label>
									<div class="col-sm-10">
										<input type="text" name="paTel" class="form-control" id="paTel" value="${vo.paTel}" required>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">주소</label>
									<div class="col-sm-10">
										<input type="text" name="address" class="form-control"
											id="address" value="${vo.address}" required>
									</div>
								</div>


							<div class="btnwech" >
								<button type="submit" class="btn btn-primary">수정</button>
								<button type="button" class="btn btn-primary" onclick="history.back()">뒤로가기</button>
							</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>