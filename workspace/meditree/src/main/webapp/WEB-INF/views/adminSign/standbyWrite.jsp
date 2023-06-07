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

.shadow {
	width: 90%;
	height: 800px;
	margin: auto;
	margin-top: 40px;
}

.approve {
	margin-left: 20px;
	margin-right: 20px;
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

/* 신청  */
.appr-inner-table {
	border-width: 1px;
	width: 150px;
	height: 20px;
	font-size: 13px;
}

.appr-inner-table img {
	width: 40px;
	height: 40px;
	display: block;
	margin-bottom: 5px;
}

/* 결재문 작성 */
.appr-table th {
	font-weight: 550;
	text-align: center;
	background: #f7f7f7;
	color: rgb(72, 72, 72);
	border-width: 2px;
}

.appr-table input {
	border: none;
}

.btn-outline-success {/* 이전목록 버튼 */
	float: right;
	display: flex;
	justify-content: center;
	margin-right: 5px;
	color: #82CBC4;
	border-color: #82CBC4;
}

.btn-outline-success:hover {
	background: #82CBC4;
	border-color: #82CBC4;
	color: white;
}

.appr-write-btn { /* 결재하기 버튼 */
	background: #82CBC4;
	color: white;
	float: right;
	justify-content: center;
}

.appr-write-btn:hover {
	background: #82CBC4;
	color: white;
}

.appr-table-wrapper {
	width: 1050px;
	padding-left: 40px;
}

.appr-modal-tb th {
	background: #f7f7f7;
	color: rgb(72, 72, 72);
	border-width: 2px;
}

.appr-modal-tb .mdi-chevron-double-right {
	color: dimgray;
	font-size: 20px;
}

.appr-modal-tb .mdi-delete-forever {
	color: gray;
	font-size: 18px;
}

#form-modal-th {
	height: 40px;
	line-height: 2;
}

#formModalLabel {
	margin-left: 160px;
	line-height: 1.5;
	font-weight: 600px;
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
							전자결재 | <b>결재대기 문서 상세보기</b>
						</h2>
						<hr>
						<div class="allApp">
							<button type="button" class="btn appr-write-btn"
								data-bs-toggle="modal" data-bs-target="#apprModal">결재하기</button>
							<button type="button" class="btn btn-outline-success"
								onclick="history.back();">이전목록</button>
						</div>

						<form action="${root}/adminSign/write" method="post">
							<input type="hidden" value="" name="no">
							<div class="appr-table-wrapper">
								<button type="submit" class="btn appr-write-btn">승인</button>
								<button type="button" class="btn btn-green"
									data-bs-toggle="modal" data-bs-target="#formModal"
									style="width: 130px;" onclick="reject();">반려</button>

								<table class="table table-bordered appr-table">
									<tr>
										<th width="225">문서보존기간</th>
										<td width="300">&nbsp;5년</td>
									</tr>
									<tr>
										<th width="225">기안부서</th>
										<td width="300">{ loginMember.title }</td>
									</tr>
									<tr>
										<th width="225">기안자</th>
										<td width="300">{ loginMember.name }</td>
									</tr>
									<tr>
										<th width="225">제목</th>
										<td width="300">{ vo.signTitle }</td>
									</tr>
								</table>
									<div>
										<textarea id="summernote" name="content">${ vo.content }</textarea>
									</div>
							</div>
						</form>
						<br> <br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
