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
	               			<h1>환자조회</h1>
	               		</div>

	               		<table class="table table-hover">  
	               			<thead class="table-light">
			                    <tr> 
			                      <th>차트번호</th>   
			                      <th>이름</th>
			                      <th>성별</th>
			                      <th>나이</th>
			                      <th>주민등록번호</th>
			                      <th>연락처</th>
			                      <th>보호자연락처</th>
			                      <th>주소</th>
			                    </tr> 
	                  		</thead>
			                <tbody>
			                	<tr>
				                    <td>${vo.no}</td>
				                    <td>${vo.paName}</td>
				                    <td>${vo.paGender}</td>
				                    <td>${vo.rrn}</td>
				                    <td>${vo.rrn}</td>
				                    <td>${vo.paTel}</td>
				                    <td>${vo.paTel}</td>
				                    <td>${vo.address}</td>
			                 	</tr>
			                 </tbody> 
			             </table>
						<a href="edit">
                		   <button type="button" class="btn btn-secondary btn-sm">수정하기</button>	
                   		</a>

                         <br><br><br>

                         <table class="table table-hover">  
                            <thead class="table-light">
                             <tr> 
                               <th>내원일</th>   
                               <th>진료과</th>
                               <th>진료의</th>
                               <th>질병</th>
                               <th>처방전</th>
                               <th>수납</th>
                             </tr> 
                           </thead>
                         <tbody>
                          <tr>
                             <td>2023-02-17</td>
                             <td>정형외과</td>
                             <td>김강토</td>
                             <td>타박상</td>
                             <td>조회버튼</td>
                             <td>미납</td>
                          </tr>
                          <tr>
                            <td>2023-02-17</td>
                            <td>정형외과</td>
                            <td>김강토</td>
                            <td>타박상</td>
                            <td>조회버튼</td>
                            <td>미납</td>
                         </tr>
                         <tr>
                            <td>2023-02-17</td>
                            <td>정형외과</td>
                            <td>김강토</td>
                            <td>타박상</td>
                            <td>조회버튼</td>
                            <td>미납</td>
                         </tr>
                         <tr>
                            <td>2023-02-17</td>
                            <td>정형외과</td>
                            <td>김강토</td>
                            <td>타박상</td>
                            <td>조회버튼</td>
                            <td>미납</td>
                         </tr>
                         <tr>
                            <td>2023-02-17</td>
                            <td>정형외과</td>
                            <td>김강토</td>
                            <td>타박상</td>
                            <td>조회버튼</td>
                            <td>미납</td>
                         </tr>



                           
                          </tbody> 
                      </table>
	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>