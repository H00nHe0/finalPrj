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
    #edit-table{
        border: 1px solid black;
        margin: auto;
        width: 40%;
    }
    #edit-table th {
        width: 25%;
    }




    
  </style>
</head>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
            
	            <form action="">
	               <div class="shadow p-3 mb-5 bg-body rounded">
	               		<div class="htitle">
	               			<h1>환자정보 수정</h1>
	               		</div>

                        
	               		<table id="edit-table" class="table table-hover">  


			                 <tr>
                                <th>이름</th>
                                <td>
                                	<input type="text" value="김승우" readonly="readonly">
                                </td>
			                 </tr>
                             <tr>
                                <th>주민등록번호</th>
                                <td>
                                	<input type="text" value="980430-*******" readonly="readonly">
                                </td>
			                 </tr>
                             <tr>
                                <th>연락처</th>
                                <td>
                                	<input type="text" value="010-9306-0776" readonly="readonly">
                                </td>
			                 </tr>
                             <tr>
                                <th>보호자 연락처</th>
                                <td>
                                	<input type="text" value="010-9306-0776" readonly="readonly">
                                </td>
			                 </tr>
                             <tr>
                                <th>주소</th>
                                <td>
                                	<input type="text" value="안양시 만안구 충훈로" readonly="readonly">
                                </td>
			                 </tr>
                             <tr>
                                <th>메모</th>
                                <td>
                                	<textarea rows="" cols=""></textarea>
                                </td>
			                 </tr>
                             <tr>
                                <th>최근방문일</th>
                                <td>2022-06-12</td>
			                 </tr>



			             </table>
	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>