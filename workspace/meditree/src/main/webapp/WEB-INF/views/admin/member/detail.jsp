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
      height: 500px;
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


    
  </style>
</head>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
            
	            <form action="" method="">
	               <div class="shadow p-3 mb-5 bg-body rounded">
	               		<div class="htitle">
	               			<h1>직원조회</h1>
	               		</div>
                        <%-- <div id="search-area">
                        <select name="searchType">
							<option value="paName">이름</option>
							<option value="rrn">생년월일</option>
							<option value="paTel">전화번호</option>
						</select>
                           <input type="text" name="searchValue" value="${searchMap.searchValue}" placeholder="검색할값을 입력하세요">
                           <input type="submit" value="검색하기">
                        </div> --%>

                        
	               		<table class="table table-bordered" id="">
							<tr>
							  <th >사원번호</th>
							  <td>${vo.no}</td>
							</tr>
							<tr>
							  <th>이름</th>
							  <td>${vo.name}</td>
							</tr>
							<tr>
							  <th>입사일</th>
							  <td>${vo.enrollDate}</td>
							</tr>
							<tr>
							  <th>소속과</th>
							  <td>${vo.title}</td>
							</tr>
							<tr>
							  <th>직급</th>
							  <td>${vo.potitle}</td>
							</tr>
							<tr>
							  <th>프로필</th>
							  <td>${vo.profileName}</td>
							  </tr>
						</table>

			            
	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>
