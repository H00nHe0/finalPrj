<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표</title>
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
	.table{
		width: 80%;
	}
    textarea{
    	
    	border: 0;
    	resize: none;
    }
    button{
    	float: right;
    }
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
                <div id="content">
				<h1 style="margin-top: 20px;">식단표 작성</h1>
                <form action="${root}/weekly/write" method="post">
                <select class="form-select" name="wmType">
                	<option value="P">환자식</option>
                	<option value="E">직원식</option>
                </select>
					<table class="table">
						<thead>
							<tr class="table-success">
								<th></th>
								<th><input style="width: 165px;" type="text" name="monDate" placeholder="yyyy-mm-dd"></th>
								<th><input style="width: 165px;" type="text" name="tueDate" placeholder="yyyy-mm-dd"></th>
								<th><input style="width: 165px;" type="text" name="wedDate" placeholder="yyyy-mm-dd"></th>
								<th><input style="width: 165px;" type="text" name="thuDate" placeholder="yyyy-mm-dd"></th>
								<th><input style="width: 165px;" type="text" name="friDate" placeholder="yyyy-mm-dd"></th>
								<th><input style="width: 165px;" type="text" name="satDate" placeholder="yyyy-mm-dd"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="table-success">조식</th>
								<td><textarea style="width:117px; height: 160px;" name="monB"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="tueB"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="wedB"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="thuB"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="friB"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="satB"></textarea></td>
							</tr>
							<tr>
								<th class="table-success">중식</th>
								<td><textarea style="width:117px; height: 160px;" name="monL"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="tueL"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="wedL"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="thuL"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="friL"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="satL"></textarea></td>
							</tr>
							<tr>
								<th class="table-success">석식</th>
								<td><textarea style="width:117px; height: 160px;" name="monD"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="tueD"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="wedD"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="thuD"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="friD"></textarea></td>
								<td><textarea style="width:117px; height: 160px;" name="satD"></textarea></td>
							</tr>
						</tbody>
					</table>
					<button class="btn btn-success">등록하기</button>
                </form>
                
            </div>
        </div>
    </div>

</body>
</html>