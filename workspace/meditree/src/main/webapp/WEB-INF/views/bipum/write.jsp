<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bipumWrite</title>
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
	height: 650px;
	margin: auto;
	margin-top: 40px;
}

th active {
	text-align: center;
}

.form-inline {
	text-align: left;
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
.appr-table th {
	font-weight: 550;
	text-align: center;
	background: #f7f7f7;
	color: rgb(72, 72, 72);
	border-width: 2px;
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
						<h1>비품 등록</h1>
					</div>

					<div id="contAreaBox">
						<div class="panel">
							<div class="panel-body">
								<form action="${root}/bipum/write" method="post" enctype="multipart/form-data">
									<div class="table-responsive" style="text-align: center;">
										<table id="datatable-scroller"
											class="table table-bordered appr-table">
											<colgroup>
												<col width="250px"/>
												<col />
											</colgroup>
											<tbody>
												<tr>
													<th class="active">비품명</th>
													<td class="form-inline">
													<input type="text" name="name" class="form-control" style="width: 200px"/></td>
												</tr>
												<tr>
													<th class="active">수량</th>
													<td class="form-inline">
													<input type="text" name="amount" class="form-control" style="width: 200px"/></td>
												</tr>
												<tr>
													<th class="active">설명</th>
													<td class="form-inline">
													<textarea name="content" cols="90" rows="6" class="form-control"></textarea></td>
												</tr>
												<tr>
													<th class="active">사진첨부</th>
													<td class="form-inline">
													<input type="file" name="f" multiple class="form-control" id="formFileMultiple"></td>
												</tr>
												<tr>
													<th class="active">미리보기</th>
													<td class="form-inline">
													<div id="preview-area"></div></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="btnfloat">
										<button type="submit" class="btn btn-secondary">등록</button>
										<a href="${root}/bipum/list" class="btn btn-danger">취소</a>
									</div>
								</form>
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

	//업로드 파일 미리보기 작업
	//변수준비
	const fileTag = document.querySelector('input[name="f"]');
	const previewArea = document.querySelector('#preview-area');
	
	//이벤트 핸들러 연결
	fileTag.addEventListener('change', function(){
		//preview-area 지우기
		previewArea.innerHTML = '';
		
		//파일이 있으면 미리보기 작업 하기
		if(fileTag.files.length > 0){
			for(let f of fileTag.files){
				const reader = new FileReader();
				//load한걸 가지로 화면에 보여주는 준비
				reader.addEventListener("load" , processPreview);
				reader.readAsDataURL(f);
			}
		}
	});
	
	//이미지 요소 만들어 화면에 추가함
	function processPreview(event){
		const imgTag = document.createElement('img');
		imgTag.setAttribute("src" , event.target.result);
		imgTag.setAttribute("width" , "100px");
		imgTag.setAttribute("height" , "100px");
		
		previewArea.appendChild(imgTag);
	}

</script>

