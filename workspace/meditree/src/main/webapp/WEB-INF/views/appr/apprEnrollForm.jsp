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

<!-- fancyTree -->
<link
	href="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/skin-win8/ui.fancytree.min.css"
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

#tree {
	overflow: auto;
	height: 370px;
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
						<form id="insertAppr" action="" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="${ loginUser.empNo }" name="empNo">
							<input type="hidden" value="" name="formNo">
							<div class="appr-table-wrapper">
								<button type="button" class="btn appr-write-btn"
									onclick="postFormSubmit('apprInsert.si');">
									<i class="mdi mdi-arrow-up-bold" style="color: white;"></i>
									결재요청
								</button>
								<button type="button" class="btn btn-outline-success btn-green"
									data-bs-toggle="modal" data-bs-target="#formModal"
									style="width: 130px;" onclick="selectFormList();">
									<i class="mdi mdi-application menu-icon"></i> 결재양식선택
								</button>
								<button type="button" class="btn btn-outline-success btn-green"
									onclick="postFormSubmit('apprStorageInsert.si');">
									<i class="mdi mdi-download menu-icon"></i>임시저장
								</button>

								<script>
									function postFormSubmit(url) {

										let result;
										if (url == 'apprInsert.si') {
											result = confirm("결재요청 하시겠습니까?");
										} else {
											result = confirm("임시저장 하시겠습니까?");
										}

										if (result == true) {
											$("#insertAppr")
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
										<td><input type="text" name="apprTitle"
											placeholder="제목을 입력해주세요" required></td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td><input type="file" name="upfile"></td>
									</tr>
								</table>
								<div>
									<textarea class="yui3-cssreset" id="summernote"
										name="apprContent"></textarea>
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

		<!-- 결재양식선택 모달창 -->
		<div class="modal fade" id="formModal" tabindex="-1"
			aria-labelledby="formModalLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content" style="background: white;">
					<div class="modal-header">
						<h5 class="modal-title" id="formModalLabel">결재양식 선택</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" style="height: 300px;">
						<div class="input-group appr-search-div"
							style="float: left; width: 100%">
							<input type="text" class="form-control" placeholder="검색어를 입력해주세요">
							<button class="btn appr-write-btn btn-sm" type="button">
								<img src="resources/images/kma/search.png">
							</button>
						</div>
						<table class="table table-bordered appr-table" id="appr-comment">
							<thead>
								<tr style="border: 2px solid #DFDFDF;">
									<th id="form-modal-th">&nbsp;결재양식 &nbsp; <span
										id="formCount"></span>
									</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-success btn-sm"
							style="background: RGB(29, 92, 99); color: white;"
							onclick="selectFormDetail();">선택</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			function selectFormList() { // 결재양식선택 리스트 조회용 ajax함수

				$
						.ajax({
							url : "apprFormList.si",
							async : false,
							success : function(list) {

								let value = "";
								for (let i = 0; i < list.length; i++) {
									value += "<tr>"
											+ "<td><input type='radio' name='form'>&nbsp;&nbsp;"
											+ list[i].formTitle
											+ "&nbsp;-&nbsp;"
											+ list[i].formInfo + "</td>"
											+ "</tr>"
								}

								$("#appr-comment tbody").html(value);
								$("#formCount").text("(" + list.length + ")");

								$('input:radio[name=form]').each(
										function(index, item) { // ajax로 조회해온 데이터에 value값 넣어주기
											$(item).val(list[index].formNo);
										})

							},
							error : function() {
								console.log("결재양식선택 리스트 조회용 ajax통신 실패");
							}
						})

			}

			function selectFormDetail() { // 결재양식 불러오기용 ajax함수

				$
						.ajax({
							url : "apprFormDetail.si",
							async : false,
							data : {
								formNo : $("input:radio[name=form]:checked")
										.val()
							},
							success : function(f) {

								$('#summernote').summernote('reset');
								$('#summernote').summernote('pasteHTML',
										f.formContent);
								$('#formModal').modal('hide');

								$("input[name=formNo]").attr('value', f.formNo); // 결재요청시 넘길 formNo
							},
							error : function() {
								console.log("결재양식선택 불러오기용 ajax통신 실패");
							}
						})
			}
		</script>


		<!-- fancytree -->
		<script
			src="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/jquery.fancytree-all-deps.min.js"></script>
		<script>
			function selectLineList() { // 결재라인 조직도 출력용 함수

				$
						.ajax({
							url : "apprLineList.si",
							async : false,
							success : function(map) {

								let deptList = map.deptList; // [{}, {}]
								let empList = map.empList; // [{}, {}]

								let sourceArr = []; // 최종만들어야되는 배열

								for ( let i in empList) {
									let emp = empList[i];
									let empInfo = emp.empName + "&nbsp;"
											+ emp.jobName

									if (emp.deptNo == 0) { // 부서번호가 없는 사원(병원장)
										let sourceEmp = {
											title : empInfo,
											key : emp.empNo
										};
										sourceArr.push(sourceEmp);
									}
								}

								for ( let i in deptList) {
									let dept = deptList[i];

									if (dept.upperNo == 0) {
										let sourceUpperDept = {
											title : dept.deptName,
											key : dept.deptNo,
											folder : true,
											expanded : true,
											children : []
										};
										sourceArr.push(sourceUpperDept);
									} else {
										let sourceLowerDept = {
											title : dept.deptName,
											key : dept.deptNo,
											folder : true,
											children : []
										};

										for ( let j in sourceArr) {
											if (sourceArr[j].key == dept.upperNo) {
												sourceArr[j].children
														.push(sourceLowerDept);
											}
										}
									}
								}

								for ( let i in empList) {
									let emp = empList[i];
									let empInfo = emp.empName + "&nbsp;"
											+ emp.jobName
									let sourceEmp = {
										title : empInfo,
										key : emp.empNo
									};

									for ( let i in sourceArr) {
										let dept = sourceArr[i];

										if (dept.key == emp.deptNo) {
											dept.children.push(sourceEmp);
										} else {
											for ( let j in dept.children) {
												if (dept.children[j].key == emp.deptNo) {
													dept.children[j].children
															.push(sourceEmp);
												}
											}
										}
									}
								}

								$("#tree").fancytree({
									source : sourceArr,
									activate : function(event, data) { // 데이터 활성화

										let node = data.node
										addApprLine(node.key); // empNo 넘기기
									}
								});

							},
							error : function() {
								console.log("결재라인 조직도 리스트 조회용 ajax통신 실패");
							}
						})
			}
		</script>
	</div>
</body>
</html>