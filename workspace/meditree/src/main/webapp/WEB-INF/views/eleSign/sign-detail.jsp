<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문 작성</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
	height: 1150px;
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
.appr-write-btn { /* 수정하기 버튼 */
	background: #82CBC4;
	color: white;
	float: right;
	display: flex;
	justify-content: center;
	border-color: #82CBC4;
	margin-left: 5px;
	margin-bottom: 15px;
}
.btn-green {  /*이전목록 버튼 */
	border-color: #82CBC4;
	color: #82CBC4;
	float: right;
	display: flex;
	justify-content: center;
	margin-bottom: 15px;
	margin-left: 5px;
}

.btn-green:hover {  /*이전목록 버튼 호버 */
	background: #82CBC4;
	border-color: #82CBC4;
	color: white;
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
	margin-right: 52px;
	margin-left: 10px;
	margin-bottom: 15px;
}
.view-area{display: none;}
.form-area{display: none;}

.look{
	display: block;
}

.si-1 {
	float: right;
	display: flex;
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
							전자결재 | <b>기안문 상세보기</b>
						</h2>
						<hr>
						<div class="view-area look">
							<div class="appr-table-wrapper">
							    <c:if test="${loginMember.no != '999999'}">
									<button type="button" class="btn appr-write-btn" onclick="toggleLook();">수정하기</button>
								</c:if>
							<div class="si-1">
								<c:if test="${loginMember.no == '999999'}">
									<a href="${root}/eleSign/approve?num=${vo.no}" class="btn appr-write-btn">승인하기</a>
									<button type="button"  class="btn btn-green"
									data-bs-toggle="modal" data-bs-target="#disapprModal">반려하기</button>
								</c:if>
							</div>
							
							<!-- 반려하기 모달창 -->
							<div class="modal fade" id="disapprModal" tabindex="-1" aria-labelledby="disapprModalLabel" aria-hidden="true">
					           <div class="modal-dialog modal-dialog-centered">
					             <div class="modal-content" style="background:white;">
					               <div class="modal-header">
					                 <h5 class="modal-title" id="disapprModalLabel" style="margin-left:5px;">반려하기</h5>
					                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					               </div>
					               <form action="${root}/eleSign/disapprove?num=${vo.no}" method="post">
					               	   <input type="hidden" name="no" value="${ vo.no }">
						               <div class="modal-body" style="height:220px;">
						                 <div class="form-group row" style="width:450px; padding-left:10px; margin-top:7px;">
						                   <label class="col-sm-3 col-form-label">결재문서명</label>
						                   <div class="col-sm-9">
						                     <input type="text" class="form-control appr-tb-input" value="${ vo.title }" style="background:none; padding-left:0; border:none;" readonly>
						                   </div>
						                   <label class="col-sm-3 col-form-label">반려사유</label>
						                   <div class="col-sm-9">
						                   	 <textarea rows="5" cols="36" name="lineComment" style="margin-top:10px; border:1px solid lightgray;"></textarea>
						                   </div>
						                 </div>
						               </div>
						               <div class="modal-footer">
						                 <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
						                 <button type="submit" class="btn btn-sm" style="background:#82CBC4; color:white;">확인</button>
						               </div>
					               </form>
					             </div>
					           </div>
					        </div>
					        <!-- 반려모달창 end -->
								
								<c:choose>
								    <c:when test="${loginMember.no != '999999'}">
								        <a href="${root}/eleSign/list" class="btn btn-green">이전목록</a>&nbsp;<br>
								    </c:when>
								    <c:otherwise>
								        <a href="${root}/eleSign/list" class="btn btn-green">목록으로</a>&nbsp;<br>
								    </c:otherwise>
								</c:choose>

								
								<table class="table table-bordered appr-table">
									<tr>
										<th width="250px;">문서보존기간</th>
										<td>&nbsp;5년</td>
									</tr>
									<tr>
										<th>기안부서</th>
										<td>${ loginMember.title }</td>
									</tr>
									<tr>
										<th>기안자</th>
										<td>${ loginMember.name }</td>
									</tr>
									<tr>
										<th>제목</th>
										<td>${ vo.title }</td>
									</tr>
								</table>
								<div>${ vo.content }</div>
							</div>
						</div>
						
						<!-- 수정하기  -->
						<div class="form-area">
						<div class="btnfloat-danger">
							<button onclick="location.href='${root}/eleSign/delete?num=${vo.no}'" class="btn btn-danger">삭제하기</button>
						</div>
							<form action="${root}/eleSign/edit" method="post">
								<div class="appr-table-wrapper">
									<div class="btnfloat">
										<button type="submit" class="btn appr-write-btn">수정하기</button>
									</div>
									<input type="hidden" name="no" value="${vo.no}">
									<table class="table table-bordered appr-table">
										<tr>
											<th width="250px;">문서보존기간</th>
											<td>&nbsp;5년</td>
										</tr>
										<tr>
											<th>기안부서</th>
											<td>${ loginMember.title }</td>
										</tr>
										<tr>
											<th>기안자</th>
											<td>${ loginMember.name }</td>
										</tr>
										<tr>
											<th>제목</th>
											<td><input type="text" name="title" value="${ vo.title }"></td>
										</tr>
									</table>
									<div>
										<textarea id="summernote" name="content">${ vo.content }</textarea>
									</div>
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

