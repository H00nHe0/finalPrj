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
	height: 500px;
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
#no {
	color: red;
}

</style>
</head>

<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/common.jsp"%>

		<div id="main">
			<%@ include file="/WEB-INF/views/common/commonSidebar.jsp"%>
			<div id="board">

				<form action="${root}/member/edit" method="post" enctype="multipart/form-data">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<div class="htitle">
							<h1>정보 수정</h1>
						</div>

							<div class="rec">
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">사번</label>
									<div class="col-sm-10">
										<input type="text" name="no" class="form-control" id="no" value="${loginMember.no}" required readonly="readonly">
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">이름</label>
									<div class="col-sm-10">
										<input type="text" name="name" class="form-control" id="name" value="${loginMember.name}" required>
									</div>
								</div>
								<div class="row mb-3">
								  <label class="col-sm-2 col-form-label">비밀번호</label>
								  <div class="col-sm-10">
								    <input type="password" name="pwd" class="form-control" id="pwd" value="${loginMember.pwd}" required>
								    <input type="checkbox" id="showPassword" onchange="togglePasswordVisibility()"> 비밀번호 표시
								  </div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">핸드폰번호</label>
									<div class="col-sm-10">
										<input type="tel" name="tel" class="form-control"
											id="telNo" value="${loginMember.tel}" required>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">프로필</label>
									<div class="col-sm-10">
										<input type="file" name="profile" class="form-control" 
											 value="${loginMember.profileName}" >
									</div>
								</div>

							<div class="btnwech">
								<button type="submit" class="btn btn-primary">수정</button>
								<a href="${root}/member/main" class="btn btn-primary" id="back-btn">뒤로가기</a>
							</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<script>
  var pwdInput = document.getElementById("pwd");

  document.getElementById("no").addEventListener("click", function() {
    alert("수정할 수 없습니다.");
  });

  function togglePasswordVisibility() {
    var showPasswordCheckbox = document.getElementById("showPassword");
    if (showPasswordCheckbox.checked) {
      pwdInput.setAttribute("type", "text");
    } else {
      pwdInput.setAttribute("type", "password");
    }
  }

  
  
</script>