<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 식단표</title>
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
                <div id="nav">
                	<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link "  href="${root}/weekly/pmenu">환자식</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="${root}/weekly/emenu">직원식</a>
					  </li>
					  
					</ul>
                </div>
				<div class="view-area active">	
					<h1 style="margin-top: 20px;">직원 식단표</h1>			
					<table class="table">
						<thead>
							<tr class="table-success">
								<th><input style="width: 165px;" type="hidden" name="no" value="${eMenu.no}"></th>
								<th>${eMenu.monDate}(월)</th>
								<th>${eMenu.tueDate}(화)</th>
								<th>${eMenu.wedDate}(수)</th>
								<th>${eMenu.thuDate}(목)</th>
								<th>${eMenu.friDate}(금)</th>
								<th>${eMenu.satDate}(토)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="table-success">조식</th>
								<td>${eMenu.monB}</td>
								<td>${eMenu.tueB}</td>
								<td>${eMenu.wedB}</td>
								<td>${eMenu.thuB}</td>
								<td>${eMenu.friB}</td>
								<td>${eMenu.satB}</td>
							</tr>
							<tr>
								<th class="table-success">중식</th>
								<td>${eMenu.monL}</td>
								<td>${eMenu.tueL}</td>
								<td>${eMenu.wedL}</td>
								<td>${eMenu.thuL}</td>
								<td>${eMenu.friL}</td>
								<td>${eMenu.satL}</td>
							</tr>
							<tr>
								<th class="table-success">석식</th>
								<td>${eMenu.monD}</td>
								<td>${eMenu.tueD}</td>
								<td>${eMenu.wedD}</td>
								<td>${eMenu.thuD}</td>
								<td>${eMenu.friD}</td>
								<td>${eMenu.satD}</td>
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
						<h1 style="margin-top: 20px;">직원 식단표 수정</h1>
						<select class="form-select" name="wmType">
							<option value="P">환자식</option>
							<option value="E">직원식</option>
						</select>
							<table class="table">
								<thead>
									<tr class="table-success">
										<th><input type="hidden" name="no" value="${eMenu.no}"></th>
										<th><input style="width: 165px;" value="${eMenu.monDate}" type="text" name="monDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${eMenu.tueDate}" type="text" name="tueDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${eMenu.wedDate}" type="text" name="wedDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${eMenu.thuDate}" type="text" name="thuDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${eMenu.friDate}" type="text" name="friDate" placeholder="yyyy-mm-dd"></th>
										<th><input style="width: 165px;" value="${eMenu.satDate}" type="text" name="satDate" placeholder="yyyy-mm-dd"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="table-success">조식</th>
										<td><textarea style="width:117px; height: 160px;" name="monB">${eMenu.monB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="tueB">${eMenu.tueB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="wedB">${eMenu.wedB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="thuB">${eMenu.thuB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="friB">${eMenu.friB}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="satB">${eMenu.satB}</textarea></td>
									</tr>
									<tr>
										<th class="table-success">중식</th>
										<td><textarea style="width:117px; height: 160px;" name="monL">${eMenu.monL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="tueL">${eMenu.tueL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="wedL">${eMenu.wedL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="thuL">${eMenu.thuL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="friL">${eMenu.friL}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="satL">${eMenu.satL}</textarea></td>
									</tr>
									<tr>
										<th class="table-success">석식</th>
										<td><textarea style="width:117px; height: 160px;" name="monD">${eMenu.monD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="tueD">${eMenu.tueD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="wedD">${eMenu.wedD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="thuD">${eMenu.thuD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="friD">${eMenu.friD}</textarea></td>
										<td><textarea style="width:117px; height: 160px;" name="satD">${eMenu.satD}</textarea></td>
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