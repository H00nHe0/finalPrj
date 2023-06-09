<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재양식 상세보기</title>
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
	height: 1100px;
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

.btn-green {  /*이전목록 버튼 */
	border-color: #82CBC4;
	color: #82CBC4;
	float: right;
	display: flex;
	justify-content: center;
	margin-bottom: 15px;
	margin-right: 5px;
	margin-left: 5px;
}

.btn-green:hover {  /*이전목록 버튼 호버 */
	background: #82CBC4;
	border-color: #82CBC4;
	color: white;
}

.appr-write-btn { /* 수정하기 버튼 */
	background: #82CBC4;
	color: white;
	float: right;
	display: flex;
	justify-content: center;
	border-color: #82CBC4;
	margin-right: 5px;
	margin-left: 5px;
	margin-bottom: 15px;
}

.appr-write-btn:hover { /* 수정하기 버튼 호버 */
	background: #82CBC4;
	color: white;
}
.btnfloat {
	float: right;
}

.btnfloat-danger {
	float: right;
	display: flex;
	justify-content: center;
	border-color: #82CBC4;
	margin-right: 38px;
	margin-left: 5px;
	margin-bottom: 15px;
}

.appr-table-wrapper { 
	width: 1050px;
	padding-left: 40px;
}
.view-area{display: none;}
.form-area{display: none;}

.look{
	display: block;
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
							전자결재 | <b>결재양식</b>
						</h2>
						<hr>
						<div class="view-area look">
							<div class="appr-table-wrapper" style="margin-left: 20px;">
								<button type="button" class="btn btn-success appr-write-btn" onclick="toggleLook();">수정하기</button>
								<a href="${root}/appr/list" class="btn btn-outline-success btn-green">이전목록</a>&nbsp;<br>
								<table class="table table-bordered appr-table">
									<tr>
										<th width="250px;">사용여부</th>
										<td>${vo.status}</td>
									</tr>
									<tr>
										<th>제목</th>
										<td>${vo.formTitle}</td>
									</tr>
									<tr>
										<th>설명</th>
										<td>${vo.info}</td>
									</tr>
								</table>
								<div>${vo.content}</div>
							</div>
						</div>
							
							<!-- 수정하기  -->
							<div class="form-area">
							<div class="btnfloat-danger">
							<button onclick="location.href='${root}/appr/delete?num=${vo.no}'" class="btn btn-danger">삭제하기</button>
							</div>
							<form action="${root}/appr/edit" method="post">
							<div class="appr-table-wrapper" style="margin-left: 20px;">
							<div class="btnfloat">
								<button type="submit" class="btn btn-success appr-write-btn">수정하기</button>
							</div>
								<input type="hidden" name="no" value="${vo.no}">
								<table class="table table-bordered appr-table">
									<tr>
										<th width="250px;">사용여부</th>
										<td>
										<input style="display: inline-block; width: 30px; height: 15px;"
										       type="radio" name="status" id="use" value="O">가능
									    <input style="display: inline-block; width: 30px; height: 15px;"
											   type="radio" name="status" id="notUse" value="X">불가능
									    </td>
									</tr>
									<c:choose>
									<c:when test="${ vo.status eq 'O' }">
										<script>
											$(function() {
												$("#use").attr("checked", true);
											})
										</script>
									</c:when>
									<c:otherwise>
										<script>
											$(function() {
												$("#notUse").attr("checked", true);
											})
										</script>
									</c:otherwise>
								</c:choose>
									
									<tr>
										<th>제목</th>
										<td><input type="text" name="formTitle" value="${ vo.formTitle }"></td>
									</tr>
									<tr>
										<th>설명</th>
										<td><input type="text" name="info" value="${ vo.info }" style="width: 800px;"></td>
									</tr>
								</table>
								<div><textarea id="summernote" name="content">${vo.content}</textarea></div>
							</div>
							</form>
							
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
																	[
																			'style',
																			[
																					'fontname',
																					'fontsize',
																					'bold',
																					'italic',
																					'underline',
																					'clear' ] ],
																	[
																			'color',
																			[ 'color' ] ],
																	[
																			'para',
																			[
																					'ul',
																					'ol',
																					'paragraph' ] ],
																	[
																			'insert',
																			[
																					'link',
																					'picture',
																					'hr' ] ],
																	[
																			'view',
																			[ 'fullscreen' ] ] ]
														});
									});
				</script>
							
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>

	//수정하기 버튼 클릭 시 동작하는 내용
	function toggleLook() {
		const viewArea = document.querySelector(".view-area");
		const formArea = document.querySelector(".form-area");
		
		viewArea.classList.remove('look');
		formArea.classList.add('look');
	}

</script>
