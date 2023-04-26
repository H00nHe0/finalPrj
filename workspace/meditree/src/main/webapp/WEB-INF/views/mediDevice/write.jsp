<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	height: 630px;
	margin: auto;
	margin-top: 40px;
}

tr>th {
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
						<h1>의료기기 등록</h1>
					</div>

					<div id="contAreaBox">
						<div class="panel">
							<div class="panel-body">
								<form role="" action="" method="">
									<div class="table-responsive" style="text-align: center;">
										<table id="datatable-scroller"
											class="table table-bordered tbl_Form">
											<colgroup>
												<col width="250px" />
												<col />
											</colgroup>
											<tbody>
												<tr>
													<th class="active">의료기기명</th>
													<td class="form-inline"><input type="text"
														id="board_writer" name="board_writer" class="form-control"
														style="width: 200px" /></td>
												</tr>
												<tr>
													<th class="active">종류</th>
													<td class="form-inline"><input type="text"
														id="board_title" name="board_title" class="form-control"
														style="width: 200px" /></td>
												</tr>
												<tr>
													<th class="active">등록일시</th>
													<td class="form-inline"><input type="text"
														id="board_writer" name="board_writer" class="form-control"
														style="width: 200px" /></td>
												</tr>
												<tr>
													<th class="active">작동여부</th>
													<td class="form-inline">
														<div class="form-check form-check-inline">
															<input class="form-check-input" type="radio"
																name="flexRadioDefault" id="flexRadioDefault1">
															<label class="form-check-label">
																가능</label>
														</div>
														<div class="form-check form-check-inline">
															<input class="form-check-input" type="radio"
																name="flexRadioDefault" id="flexRadioDefault2" checked>
															<label class="form-check-label">
																불가능</label>
														</div>
													</td>
												</tr>
												<tr>
													<th class="active">현위치</th>
													<td class="form-inline"><input type="text"
														id="board_writer" name="board_writer" class="form-control"
														style="width: 200px" /></td>
												</tr>
												<tr>
													<th class="active">설명</th>
													<td class="form-inline"><textarea id="board_content"
															name="board_content" cols="90" rows="6"
															class="form-control"></textarea></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="btnfloat">
										<button type="submit" class="btn btn-secondary">등록</button>
										<a href="/stock/list" class="btn btn-danger">취소</a>
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