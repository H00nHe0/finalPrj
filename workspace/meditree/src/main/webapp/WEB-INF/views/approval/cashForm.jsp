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
<script type="text/javascript" src="js/hp_SE_TimeStamper.js"
	charset="utf-8">
	
</script>

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

#bogoseo {
	width: 80%;
	margin: auto;
}

.shadow {
	width: 90%;
	height: 1125px;
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
	padding-top: 20px;
	padding-bottom: 30px;
}

.page-navi {
	margin-top: 50px;
}

.workResult {
	height: 200px;
}

.bogo {
	height: 100px;
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
								전자결재 | <b>결재양식 관리</b>
							</h2>
							<hr>
							<div id="contAreaBox">
								<div class="panel">
									<div class="panel-body">
										<form action="" method="">
											<div class="table-responsive" style="text-align: center;">
												<table id="datatable-scroller"
													class="table table-bordered tbl_Form">
													<colgroup>
														<col width="250px" />
														<col />
													</colgroup>
													<div class="btnfloat">
														<button type="submit" class="btn btn-secondary">등록하기</button>
														<a href="" class="btn btn-danger">목록으로</a>
													</div>
													<tbody>
														<tr>
															<th class="active" style="background-color: #f3f3f4;">양식종류</th>
															<td class="form-inline">일반</td>
														</tr>
														<tr>
															<th class="active" style="background-color: #f3f3f4;">사용여부</th>
															<td class="form-inline">
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio"
																		name="flexRadioDefault" id="flexRadioDefault1">
																	<label class="form-check-label">사용</label>
																</div>
																<div class="form-check form-check-inline">
																	<input class="form-check-input" type="radio"
																		name="flexRadioDefault" id="flexRadioDefault2" checked>
																	<label class="form-check-label">미사용</label>
																</div>
															</td>
														</tr>
														<tr>
															<th class="active" style="background-color: #f3f3f4;">제목</th>
															<td class="form-inline">지출결의서</td>
														</tr>
														<tr>
															<th class="active" style="background-color: #f3f3f4;">설명</th>
															<td class="form-inline">전체부서용 입니다.</td>
														</tr>
													</tbody>
												</table>
												<br>
												<h4 style="font-weight: bold;">지 출 결 의 서</h4>
												<br>
												<table id="bogoseo" class="table table-bordered">
													<tbody>

														<tr>
															<th class="active" scope="row">작 성 일</th>
															<td colspan="4">20230427</td>
														</tr>
														<tr>
															<th class="active" scope="row">보고일시</th>
															<td colspan="4">20230427</td>
														</tr>
														<tr>
															<th class="active" scope="row">지출금액</th>
															<td colspan="4"><input type="text"
														id="board_writer" name="board_writer" class="form-control"
														style=border: 0;"/></td>
														</tr>
														<tr>
															<th class="active" scope="row" style="height: 200px;">지출품목</th>
															<td colspan="4"><textarea rows="5" style=" width:100%; border: 0; resize: none;">해해해해ㅐㅎ</textarea></td>
														</tr>
														<tr>
															<th class="active" scope="row" style="height: 200px;">지출내역</th>
															<td colspan="4"><textarea rows="5" style= " width:100%; border:0; resize: none;">해해해해ㅐㅎ</textarea></td>
														</tr>
													</tbody>
												</table>
												<br><br>
													<p><b>위 금액을 청구하오니 결재 바랍니다.</b></p>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>