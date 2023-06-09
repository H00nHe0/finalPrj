<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 식단표</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
    #content{
    	width: 80%;
    	margin: 30px auto auto auto;
    	
    }
    #content table {
    	text-align: center;
    	margin-top: 20px; 
    }
	.btnWm{
		float:right;
		padding-right: 10px;
	}
    button {
	float: right;
}

	textarea{
    	
    	border: 0;
    	resize: none;
    }
.view-area{display: none;}
.form-area{display: none;}

.active{
    display: block;
}
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
                <div id="content">
				<div class="view-area active">
					<div id="nav">
						<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="${root}/weekly/pmenu">환자식</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${root}/weekly/emenu">직원식</a>
						</li>
						
						</ul>
					</div>
					<h1 style="margin-top: 20px;">환자 식단표</h1>
					<table class="table">
						<thead>
							<tr class="table-success">
								<th><input style="width: 165px;" type="hidden" name="no" value="${pMenu.no}"></th>
								<th>${pMenu.monDate}(월)</th>
								<th>${pMenu.tueDate}(화)</th>
								<th>${pMenu.wedDate}(수)</th>
								<th>${pMenu.thuDate}(목)</th>
								<th>${pMenu.friDate}(금)</th>
								<th>${pMenu.satDate}(토)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="table-success">조식</th>
								<td>${pMenu.monB}</td>
								<td>${pMenu.tueB}</td>
								<td>${pMenu.wedB}</td>
								<td>${pMenu.thuB}</td>
								<td>${pMenu.friB}</td>
								<td>${pMenu.satB}</td>
							</tr>
							<tr>
								<th class="table-success">중식</th>
								<td>${pMenu.monL}</td>
								<td>${pMenu.tueL}</td>
								<td>${pMenu.wedL}</td>
								<td>${pMenu.thuL}</td>
								<td>${pMenu.friL}</td>
								<td>${pMenu.satL}</td>
							</tr>
							<tr>
								<th class="table-success">석식</th>
								<td>${pMenu.monD}</td>
								<td>${pMenu.tueD}</td>
								<td>${pMenu.wedD}</td>
								<td>${pMenu.thuD}</td>
								<td>${pMenu.friD}</td>
								<td>${pMenu.satD}</td>
							</tr>
						</tbody>
					</table>
					<div class="btnWm">
						<c:if test="${loginMember.no == '999999'}">
							<a class="btn btn-primary" href='${root}/weekly/write'>식단표 작성</a>
							<a href="javascript:void(0);" onclick="toggleActive();" class="btn btn-success">식단표 수정</a>
						</c:if>
					</div>
				</div>
				<div class="form-area">
					<form action="${root}/weekly/edit" method="post">
						<h1 style="margin-top: 20px;">환자 식단표 수정</h1>
						<select class="form-select" name="wmType">
							<option value="P">환자식</option>
							<option value="E">직원식</option>
						</select>
							<table class="table">
								<thead>
									<tr class="table-success">
										<th><input type="hidden" name="no" value="${pMenu.no}"></th>
										<th><input style="width: 165px;" value="${pMenu.monDate}" type="text" name="monDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${pMenu.tueDate}" type="text" name="tueDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${pMenu.wedDate}" type="text" name="wedDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${pMenu.thuDate}" type="text" name="thuDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${pMenu.friDate}" type="text" name="friDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${pMenu.satDate}" type="text" name="satDate" placeholder="yyyy-mm-dd"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="table-success">조식</th>
										<td><textarea style="width:117px; height: 160px;" name="monB">${pMenu.monB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="tueB">${pMenu.tueB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="wedB">${pMenu.wedB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="thuB">${pMenu.thuB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="friB">${pMenu.friB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="satB">${pMenu.satB}</textarea></td>
									</tr>
									<tr>
										<th class="table-success">중식</th>
										<td><textarea style="width:117px; height: 160px;" name="monL">${pMenu.monL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="tueL">${pMenu.tueL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="wedL">${pMenu.wedL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="thuL">${pMenu.thuL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="friL">${pMenu.friL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="satL">${pMenu.satL}</textarea></td>
									</tr>
									<tr>
										<th class="table-success">석식</th>
										<td><textarea style="width:117px; height: 160px;" name="monD">${pMenu.monD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="tueD">${pMenu.tueD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="wedD">${pMenu.wedD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="thuD">${pMenu.thuD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="friD">${pMenu.friD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="satD">${pMenu.satD}</textarea></td>
									</tr>
								</tbody>
							</table>
							<button type="submit" class="btn btn-success">수정</button>
						</form>
						
				</div>
            </div>
        </div>
    </div>

</body>
</html>
<script>
	//수정하기 버튼 클릭 시 동작하는 내용
	function toggleActive(){
      const viewArea = document.querySelector(".view-area");
      const formArea = document.querySelector(".form-area");

      viewArea.classList.remove('active');
      formArea.classList.add('active');

      
  }
</script>