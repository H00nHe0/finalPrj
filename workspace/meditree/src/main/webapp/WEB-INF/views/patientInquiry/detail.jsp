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
      height: 700px;
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
    #edit-btn{
        float: right;
        margin-bottom: 20px;
    }
    #back-btn{
    	float: right;
        margin-bottom: 50px;
    }
    #page-area{
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
            
	            <form action="" method="">
	               <div class="shadow p-3 mb-5 bg-body rounded">
	               		<div class="htitle">
	               			<h1>환자조회</h1>
	               		</div>

	               		<table class="table table-hover" id="personal">  
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
				                    <td>${vo.age}</td>
				                    <td>
				                    	<script>
					                    	var rrn = "${vo.rrn}";
					                        var maskedRRN = rrn.substring(0, rrn.lastIndexOf('-') + 2) + '*'.repeat(rrn.length - rrn.lastIndexOf('-') - 2);
					                        document.write(maskedRRN);
										</script>
				                    </td>
				                    <td>${vo.paTel}</td>
				                    <td>${vo.paTel}</td>
				                    <td>${vo.address}</td>
			                 	</tr>
			                 </tbody> 
			             </table>
						 <a>
                		 	<button type="button" id="edit-btn" class="btn btn-secondary btn-sm">수정하기</button>	
                   		 </a>

                         <br><br><br>

                         <table class="table table-hover" id="chart">  
                            <thead class="table-light">
                             <tr> 
                               <th>차트번호</th>   
                               <th>내원일</th>   
                               <th>진료과</th>
                               <th>진료의</th>
                               <th>질병</th>
                               <th>처방전</th>
                               <th>수납</th>
                             </tr> 
                           </thead>
                         <tbody>
                         	<c:choose>
							  <c:when test="${not empty tmvoList}">
							    <c:forEach items="${tmvoList}" var="tmvo">
							      <tr>
							        <td>${tmvo.no}</td>
							        <td>${tmvo.prDate}</td>
							        <td>${tmvo.departmentTitle}</td>
							        <td>${tmvo.employeeName}</td>
							        <td>${tmvo.tmContent}</td>
							        <td>
								        <a>
					                		<button type="button" id="pre-btn" class="btn btn-secondary btn-sm">출력하기</button>	
					                   	</a>
							        </td>
							        <td>완료</td>
							      </tr>
							    </c:forEach>
							  </c:when>
							  <c:otherwise>
							    <tr>
							      <td colspan="6">과거 진료 내역이 없습니다.</td>
							    </tr>
							  </c:otherwise>
							</c:choose>

                          </tbody> 
                      </table>
                      <div id="page-area">
		                     <c:if test="${pv.currentPage > 1}">
		                        <a class = "btn btn-primary btn-sm" href="${root}/patientInquiry/detail?no=${vo.no}&page=${pv.currentPage-1}">이전</a>
		                     </c:if>
		                     <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
		                     <c:if test="${pv.currentPage != i}">
		                        <a class = "btn btn-primary btn-sm" href="${root}/patientInquiry/detail?no=${vo.no}&page=${i}">${i}</a>
		                     </c:if>
		                     <c:if test="${pv.currentPage == i}">
		                        <a class = "btn btn-secondary btn-sm">${i}</a>
		                     </c:if>
		                     </c:forEach>
		                     <c:if test="${pv.currentPage < pv.maxPage}">
		                     <a class = "btn btn-primary btn-sm" href="${root}/patientInquiry/detail?no=${vo.no}&page=${pv.currentPage+1}">다음</a>
		                     </c:if>
		                  </div>
		                  
		                  <a href="${root}/patientInquiry/list" class="btn btn-secondary btn-sm" id="back-btn">뒤로가기</a>
                      
	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>


<script>



var tdElement = document.querySelector("#personal td:nth-child(1)"); // 첫 번째 <td> 요소 가져오기
var no = tdElement.innerText; // innerText 값 가져오기

var button = document.querySelector("#edit-btn"); // 버튼 요소 가져오기

button.addEventListener("click", function() {
	  var link = "edit?no=" + no; // 링크 생성
	  window.location.href = link; // 링크로 이동
	});
	
var buttons = document.querySelectorAll("#chart .btn");
buttons.forEach(function(button) {
  button.addEventListener("click", function() {
    var tdElement = button.closest("tr").querySelector("td:first-child");
    var no = tdElement.innerText;
    var link = "prescription?no=" + no;
    window.location.href = link;
  });
});
</script>