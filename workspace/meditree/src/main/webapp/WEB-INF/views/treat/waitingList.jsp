<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- CSS only -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <!-- JavaScript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>

    <style>
      @import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap");
      body h1 {
        font-family: "IBM Plex Sans KR", sans-serif;
      }

      .table-light tr > th,
      td {
        text-align: center;
      }

      .htitle {
        width: 300px;
        height: 100px;
        margin: auto;
        padding-top: 10px;
      }
      .shadow {
        width: 90%;
        height: 600px;
        margin: auto;
        margin-top: 40px;
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
      .second-child {
        width: 15%;
      }
      .last-child {
        width: 30%;
      }
      #page-area {
        text-align: center;
        padding-top: 20px;
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
	               			<h1>진료대기환자목록</h1>
	               		</div>
	               		<table class="table table-hover">  
	               			<thead class="table-light">
			                    <tr> 
			                      <th class="second-child">대기순번</th>
			                      <th>환자번호</th>   
			                      <th>이름</th>
			                      <th>성별</th>
			                      <th class="last-child">주민등록번호</th>
			                      <th>증상</th>
			                    </tr> 
	                  		</thead>
			                <tbody>
			                 	<c:forEach items="${jvoList}" var="jvo" varStatus="status" end="${8}">
								<tr>
									<td>${status.index + 1}</td>
									<td>${jvo.paNo}</td>
									<td>${jvo.paName}</td>
									<td>${jvo.paGender}</td>
									<td>
										<script>
					                    	var rrn = "${jvo.rrn}";
					                        var maskedRRN = rrn.substring(0, rrn.lastIndexOf('-') + 2) + '*'.repeat(rrn.length - rrn.lastIndexOf('-') - 2);
					                        document.write(maskedRRN);
										</script>
									</td>
									<td>${jvo.symptom}</td>
								</tr>
							</c:forEach>
			                 </tbody> 
			             </table>

	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>