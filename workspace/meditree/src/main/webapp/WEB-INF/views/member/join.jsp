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

body h1 {
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
	height: 700px;
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

				<form action="${root}/member/join" enctype="multipart/form-data" method="post">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<div class="htitle">
							<h1>직원가입</h1>
						</div>

							<div class="rec">
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">이름</label>
									<div class="col-sm-10">
										<input type="text" name="name" class="form-control" id="empName" placeholder="이름" required>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">핸드폰번호</label>
									<div class="col-sm-10">
										<input type="tel" name="tel" class="form-control"
											id="telNo" placeholder="(-)를 포함하여 작성해주세요." required>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">주소</label>
									<div class="col-sm-10">
										<input type="text" name="address" class="form-control"
											 id="address_kakao" placeholder="주소" readonly="readonly">
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">생년월일</label>
									<div class="col-sm-10">
										<input type="text" name="birth" class="form-control"
											id="rNo" placeholder="생년월일 6자리" required>
									</div>
								</div>

								<div class="input-group mb-3">
									<label for="deptNo" class="col-sm-2 col-form-label">소속과</label>
									<select class="form-select" name="deptNo" aria-label="Default select example" required>
										<option value="" selected>선택</option>
										<option value="10">간호부</option>
										<option value="20">원무부</option>
										<option value="30">의사</option>
										<option value="99">경영지원부</option>
										<option value="40">일반내과</option>
										<option value="50">정신과</option>
										<option value="60">이비인후과</option>
										<option value="70">산부인과</option>
										<option value="80">수술실</option>
										<option value="90">일반</option>
									</select>
								</div>

								<div class="input-group mb-3">
									<label for="jobNo" class="col-sm-2 col-form-label">직급</label>
									<select class="form-select" name="positionNo" aria-label="Default select example" required>
										<option value="" selected>선택</option>
										<option value="1">병원장</option>
										<option value="2">교수</option>
										<option value="3">레지던트</option>
										<option value="4">간호사</option>
										<option value="5">사원</option>
										<option value="6">부장</option>
										<!-- <option value="7">팀장</option>
										<option value="8">인턴</option> -->
									</select>
								</div>

								<div class="row mb-3">
									<label for="upfile" class="col-sm-2 col-form-label">프로필 사진</label>
									<div class="col-sm-10">
										<input type="file" name="profile" class="form-control"
											id="inputGroupFile04"
											aria-describedby="inputGroupFileAddon04" aria-label="Upload" placeholder="프로필 사진" required>
									</div>
								</div>
							</div>
							<div class="btnwech">
								<button type="submit" class="btn btn-primary">등록</button>
								<button type="reset" class="btn btn-primary">초기화</button>
							</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


const telRegex = /^\d{3}-\d{3,4}-\d{4}$/;

const telInput = document.querySelector('#telNo');

telInput.addEventListener('blur', function() {
  const tel = telInput.value;

  if (!telRegex.test(tel)) {
    alert('000-0000-0000 형식으로 입력해주세요.');
    telInput.value = ''; // 입력값 초기화
  }
});

const rNoRegex = /^(\d{2})(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])$/;

const rNoInput = document.querySelector('#rNo');

rNoInput.addEventListener('blur', function() {
  const rNo = rNoInput.value;

  if (!rNoRegex.test(rNo)) {
    alert('생년월일 6자리를 올바른 형식으로 입력해주세요.');
    rNoInput.value = ''; // 입력값 초기화
  }
});

const form = document.querySelector('form');

const addInput = document.querySelector('#address');

form.addEventListener('submit', function(event) {
  if (telInput.value.trim() === '' || addInput.value.trim() === '' || rNoInput.value.trim() === '') {
    alert('필수 입력 항목을 모두 입력해주세요.');
    event.preventDefault();
  }
});

window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
            }
        }).open();
    });
}

</script>