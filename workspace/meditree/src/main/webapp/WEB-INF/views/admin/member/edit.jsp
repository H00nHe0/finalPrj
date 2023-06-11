<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap');
    body h1{
      font-family: 'IBM Plex Sans KR', sans-serif;
    }
    
    .table-light tr>th, td {
       text-align: center;
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
    
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
    #board{
        align-items: center;
        justify-content: center;
        background-color: #f3f3f4;
    }
    #search-area{
        display: flex;
        justify-content: center;
        margin-bottom: -30px;
    }
    #resist-btn{
        float: right;
        margin-bottom: 20px;
    }
    #page-area{
       text-align: center;
       padding-top: 20px;
    }
    .table-area{
    	display: flex;
        justify-content: center;
    }
    .table-bordered{
        justify-content: center;
    	text-align: center;
    	width: 60%;
    	margin-left: 20%;
    }
    #quit-btn {
    float: right;
    margin-right: 280px;
    }
    .form-select{
    	width: 50%;
    	justify-content: center;
    	display: flex;
    	margin: auto;
    }
    input {
      text-align: center;
	  border: none;
	  outline: none;
	}
	#edit-btn{
   		margin-left: 990px;
	}
	#back-btn{
		float: right;
   		margin-right: 290px;
	}


    
  </style>
</head>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
            
	            <form action="${root}/admin/member/edit" method="post">
	               <div class="shadow p-3 mb-5 bg-body rounded">
	               		<div class="htitle">
	               			<h1>직원조회</h1>
	               		</div>
                        
                        <input type="hidden" name="no" value="${vo.no}">
	               		<table class="table table-bordered" id="personal">
							<tr>
							  <th>사원번호</th>
							  <td>${vo.no}</td>
							</tr>
							<tr>
							  <th>이름</th>
							  <td><input type="text" name="name" value="${vo.name}"></td>
							</tr>
							<tr>
							  <th>소속과</th>
							  <td>
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
							  </td>
							</tr>
							<tr>
							  <th>직급</th>
							  <td>
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
							  </td>
							</tr>
							<tr>
							  <th>연락처</th>
							  <td><input type="text" name="tel" value="${vo.tel}"></td>
							</tr>
							<tr>
							  <th>이메일</th>
							  <td>${vo.email}</td>
							</tr>
						</table>
						
						<c:if test="${vo.quitYn == 'Y'}">
						    <style>
						        #edit-btn {
						            display: none;
						        }
						    </style>
						</c:if>
						
						<a>
                			<button type="submit" id="edit-btn" class="btn btn-secondary btn-sm">수정하기</button>
                			<button type="button" class="btn btn-secondary btn-sm" id="back-btn" onclick="history.back()">뒤로가기</button>	
                   		</a>


			            
	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>

<script>

/* var tdElement = document.querySelector("#personal td:nth-child(1)"); // 첫 번째 <td> 요소 가져오기
var no = tdElement.innerText; // innerText 값 가져오기 */
var no = "${vo.no}";

var button = document.querySelector("#quit-btn"); // 버튼 요소 가져오기

button.addEventListener("click", function() {
	  var link = "/app/admin/member/quit/" + no; // 링크 생성
	  window.location.href = link; // 링크로 이동
	});


</script>
