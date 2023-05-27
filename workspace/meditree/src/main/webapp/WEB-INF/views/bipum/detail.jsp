<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bipumDetail</title>
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
input, textarea {
	width: 100%;
	height: 100%;
	resize: none;
	margin: auto;
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
	text-align: center;
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
					<div class="htitle">
						<h1>비품 상세정보</h1>
					</div>

					<div id="contAreaBox">
						<div class="panel">
							<div class="panel-body">
								<div class="table-responsive" style="text-align: center;">

									<div class="view-area look">
										<table id="datatable-scroller"
											class="table table-bordered appr-table">
											<colgroup>
												<col width="250px"/>
											</colgroup>
											<tbody>
												<tr>
													<th class="active">비품명</th>
													<td>${vo.name}</td>
												</tr>
												<tr>
													<th class="active">수량</th>
													<td>${vo.amount}</td>
												</tr>
												<tr>
													<th class="active">등록일시</th>
													<td>${vo.enrollDate}</td>
												</tr>
												<tr>
													<th class="active">설명</th>
													<td>${vo.content}</td>
												</tr>
												<tr>
													<th class="active">첨부파일</th>
													<td><c:forEach items="${vo.attList}" var="fvo">
                     								<a href="${root}/bipum/att/down?ano=${fvo.no}">${fvo.originName}</a></c:forEach></td>
												</tr>
												<tr>
													<th class="active">미리보기</th>
													<td><div id="preview-area"> </div></td>
												</tr>
											</tbody>
										</table>

										<div class="btnfloat">
											<a href="${root}/bipum/list" class="btn btn-secondary">목록으로</a>
											<%-- 관리자만 보이게하는 코드 수정하기 <c:if test="${loginMember.id eq 'ADMIN' }"></c:if> --%>
											<button onclick="toggleLook();" class="btn btn-success">수정하기</button>
											<button onclick="location.href='${root}/bipum/delete?num=${vo.no}'" class="btn btn-danger">삭제하기</button>
										</div>
									</div>
									
									<!-- 관리자만 수정하기 -->
									<div class="form-area">
									<form action="${root}/bipum/edit" method="post">
									<input type="hidden" name="no" value="${vo.no}">
										<table id="datatable-scroller"
											class="table table-bordered appr-table">
											<colgroup>
												<col width="250px"/>
											</colgroup>
											<tbody>
												<tr>
													<th class="active">비품명</th>
													<td><input type="text" name="name" value="${vo.name}"/></td>
												</tr>
												<tr>
													<th class="active">수량</th>
													<td><input type="text" name="amount" value="${vo.amount}"/></td>
												</tr>
												<tr>
													<th class="active">등록일시</th>
													<td>${vo.enrollDate}</td>
												</tr>
												<tr>
													<th class="active">설명</th>
													<td><textarea name="content">${vo.content}</textarea></td>
												</tr>
												<tr>
													<th class="active">첨부파일</th>
													<td><c:forEach items="${vo.attList}" var="fvo">${fvo.originName}</c:forEach></td>
												</tr>
												<tr>
													<th class="active">미리보기</th>
													<td><div id="preview-area"> </div></td>
												</tr>
											</tbody>
										</table>

										<div class="btnfloat">
											<button class="btn btn-success" type="submit">수정하기</button>
											</div>
										</form>
									</div>
								</div>
							</div>
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
	
	//이미지 미리보기
	const div = document.querySelector('#preview-area');
	let imgTag;
	<c:forEach items="${vo.attList}" var="fvo">
		//이미지 요소 만들기
		imgTag = document.createElement('img');
		imgTag.setAttribute("src" , "${root}/${path}/${fvo.changeName}");
		imgTag.setAttribute("alt" , "${fvo.originName}");
		imgTag.setAttribute("width" , "150px");
		imgTag.setAttribute("height" , "150px");
		//이미지 요소를 div 안에 추가하기
		div.appendChild(imgTag);
	</c:forEach>

</script>