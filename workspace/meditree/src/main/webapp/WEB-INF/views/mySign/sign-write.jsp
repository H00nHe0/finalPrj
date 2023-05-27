<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문 작성</title>
<!-- summernote -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap')
	;

body h1 {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

table {
	margin-top: 30px;
}

tbody tr th {
	display: table-cell;
	vertical-align: middle;
}

tbody tr td {
	text-align: left;
}

.shadow {
	width: 80%;
	height: 1050px;
	margin: auto;
	margin-top: 40px;
	background-color: white;
}

.approve {
	margin-left: 10px;
}

.table-responsive {
	width: 80%;
	margin: auto;
}

input:focus, textarea:focus {
	outline: none;
}

.td input:focus, .td textarea:focus {
	outline: none;
}

#search-area {
	display: flex;
	float: right;
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

.btn-green { /* outline-btn */
	border-color: #82CBC4;
	color: #82CBC4;
	float: right;
	display: flex;
	justify-content: center;
	margin-bottom: 15px;
	margin-right: 5px;
}

.btn-green:hover {
	background: #82CBC4;
	border-color: #82CBC4;
	color: white;
}

.appr-menu-btn { /* 새 결재 진행 버튼 */
	background: #82CBC4;
	color: white;
	border: none;
	margin-left: 30px;
}

.appr-write-btn { /* 결재요청 버튼 */
	background: #82CBC4;
	color: white;
	float: right;
	display: flex;
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

.appr-table th {
	font-weight: 550;
	text-align: center;
	background: #f7f7f7;
	color: rgb(72, 72, 72);
	border-width: 2px;
}
#formModal {
	position: fixed;
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
							전자결재 | <b>결재문 작성</b>
						</h2>
						<hr>
						<form action="${root}/mySign/write" method="post" enctype="multipart/form-data">
							<input type="hidden" value="" name="no">
							<div class="appr-table-wrapper">
								<button type="button" class="btn appr-write-btn" onclick="postFormSubmit('${root}/mySign/list');">
									결재요청
								</button>
								<button type="button" class="btn btn-outline-success btn-green"
									data-bs-toggle="modal" data-bs-target="#formModal" style="width: 130px;">
									결재양식선택
								</button>

								<script>
									function postFormSubmit(url) {

										let result;
										if (url == '${root}/mySign/list') {
											result = confirm("결재요청 하시겠습니까?");
										} else {
											result = confirm("결재 취소 하시겠습니까?");
										}

										if (result == true) {
											$(${signvoList})
													.attr("action", url)
													.submit();
										}
									}
								</script>

								<table class="table table-bordered appr-table">
									<tr>
										<th width="250px;">문서보존기간</th>
										<td>&nbsp;5년</td>
									</tr>
									<tr>
										<th>제목</th>
										<td><input type="text" name="title"
											placeholder="제목을 입력해주세요" required></td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td><input type="file" name="file"></td>
									</tr>
								</table>
								<div>
									<textarea id="summernote" name="content"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- summernote -->
			<script src="https://code.jquery.com/jquery-3.5.1.min.js"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
				integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
				crossorigin="anonymous"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
				integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
			<script>
				$(document)
						.ready(
								function() {
									$('#summernote')
											.summernote(
													{
														spellCheck : true,
														disableDragAndDrop : true,
														codeviewFilter : false,
														codeviewIframeFilter : true,
														tabsize : 2,
														width : 1010,
														height : 600,
														toolbar : [
																['style',
																	['fontname', 'fontsize', 'bold', 'italic', 'underline', 'clear' ] ],
																['color',
																	[ 'color' ] ],
																['para',
																	['ul', 'ol', 'paragraph' ] ],
																['insert',
																	['link', 'picture', 'hr' ] ],
																['view',
																	[ 'fullscreen' ] ] 
																  ]
													});
								});
			</script>
		</div>
	</div>
</body>
</html>