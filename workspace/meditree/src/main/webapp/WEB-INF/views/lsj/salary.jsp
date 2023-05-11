<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main{
  display: grid;
  grid-template-columns: 1fr 8fr;
}
.card{
  margin: 10px 30px;
}
.form-group{
  width: 150px;
  margin-left: 30px;
}
.mb-5{
  float: left;
  margin: 30px;
}
.commute{
  margin-left: 10px;
}
#enter-time, #exit-time{
  margin-left: 20px;
}
.commute-status{
  margin-top: 35px;
}
#profile-img{
  margin-left: 960px;
  width: 100px;
  height: 100px;
  margin-top: -105px;
  float: right;
}
#company-img{
  margin-left: 1010px;
  width: 100px;
  height: 100px;
  margin-top: -200px;
  margin-bottom: 120px;
  float: right;
}
.form-group{
  margin-left: -5px;
  display: flex;
}
.commute-yn>input:not(:first-of-type){
  margin-left: 20px;
}
.commute-yn, .form-group{
  margin-top: 10px;
}
#search{
  float: right;
  margin-top: -30px;
  margin-right: 750px;
}
#page-area{
margin-left: 35%;
margin-top: 5%;
}
#page-area>a{
  margin: 5px;
}
table>tbody>tr>td *{
  margin-left: 7%;
}
#headName{
  background-color: silver;
}


</style>
<link rel="stylesheet" href="${root}/resources/css/app-light.css" id="lightTheme">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body>
  <div id="wrap"  style="background-color: white">
    <%@ include file="/WEB-INF/views/common/common.jsp" %>
 	  <div id="main">
        <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
        <div class="wrapper">
		   	<main role="main" class="main-content">
		      <div class="card shadow mb-5" style="width: 90%; height: 200px;">
		        <div class="card-body">
		          <div class="d-flex mb-2">
		            <div class="flex-fill pt-2">
		              <h4 class="mb-0">5월 급여명세서</h4>
		              <div class="row commute-status">
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">지급총액</h4><br>
		                  <h4 class="mb-1">5,000,000</h4>
		                </div>
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">공제세액</h4><br>
		                  <h4 class="mb-1">800,000</h4>
		                </div>
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">차감지급액</h4><br>
		                  <h4 class="mb-1">4,200,000</h4>
		                </div>		                
		              </div>
		            </div>
		          </div> 
		        </div> 
		      </div>
		      
		      <div class="card shadow mb-5" style="width: 90%; height: 400px;">
		        <div class="card-body">
		          <div class="d-flex mb-2">
		            <div class="flex-fill pt-2">
		              <h4 class="mb-0">5월 급여상세</h4>
		              <div class="row commute-status">
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">기본급</h4><br>
		                  <h4 class="mb-1">4,000,000</h4>
		                </div>
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">추가수당</h4><br>
		                  <h4 class="mb-1">1,000,000</h4>
		                </div>
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">지급총액</h4><br>
		                  <h4 class="mb-1">5,000,000</h4>
		                </div>	
		                <div class="col-2 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">국민연금</h4><br>
		                  <h4 class="mb-1">202,050</h4>
		                </div>
		                <div class="col-2 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">건강보험</h4><br>
		                  <h4 class="mb-1">156,000</h4>
		                </div>
		                <div class="col-2 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">고용보험</h4><br>
		                  <h4 class="mb-1">32,500</h4>
		                </div>	 
		                <div class="col-2 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">소득세</h4><br>
		                  <h4 class="mb-1">350,470</h4>
		                </div>
		                <div class="col-2 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">지방소득세</h4><br>
		                  <h4 class="mb-1">35,040</h4>
		                </div>
		                <div class="col-2 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">공제세액</h4><br>
		                  <h4 class="mb-1">776,060</h4>
		                </div>        
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">지급총액</h4><br>
		                  <h4 class="mb-1">5,000,000</h4>
		                </div>
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">공제세액</h4><br>
		                  <h4 class="mb-1">800,000</h4>
		                </div>
		                <div class="col-4 text-center border mb-3">
		                  <h4 class="mb-1" id="headName">차감지급액</h4><br>
		                  <h4 class="mb-1">4,200,000</h4>       
		              </div>
		            </div>
		          </div> 
		        </div> 
		      </div>
		      </div>
		      <div class="card shadow mb-5" style="width: 95%; margin-top: 10px;">
		        
		        <div id="select-condition" style="margin-left: 20px; margin-top: 20px;">
		          <h4 class="card-title">급여 조회</h4><br><br>
		          <form action="" method="get">
		            <h4 class="card-title">기간 선택</h4>
		            <div class="form-row mb-3">
		              <div class="col-md-4 mb-3">
		                <div class="input-group">
		                  <input class="form-control" id="example-date" type="date" name="enrollDate" required>
		                </div>
		              </div>
		            </div>
		            <input type="submit" class="btn mb-2 btn-outline-primary" value="조회" id="search"><br><br>
		          </form>
		        </div> 
		
		        
		        <c:if test="${empty commuteDateCnt}">
		          <h6 class="card-title" style="margin-left: 20px;">
		            조회 결과 ${commuteCnt} 건
		          </h6>
		        </c:if>
		    
		        <c:if test="${empty commuteCnt}">
			        <h6 class="card-title" style="margin-left: 20px;">
		            조회 결과 ${commuteDateCnt} 건
		          </h6>
		        </c:if>
		
		        <table class="table table-hover">
		          <thead>
		            <tr>
		              <th>일자</th>
		              <th>지급총액</th>
		              <th>공제세액</th>
		              <th>차감지금액</th>
		            </tr>
		          </thead>
		          <tbody>
		          </tbody>
		        </table>
		
		        <c:if test="${empty comDateList && empty enrollDate1 && empty enrollDate2}">
		          <div id="page-area">
		            <c:if test="${pv.startPage ne 1}">
		              <a href="${root}/commute/main/${pv.startPage - 1}" class="btn mb-2 btn-primary"><</a>
		            </c:if>
		            <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
		                <a href="${root}/commute/main/${i}" class="btn mb-2 btn-primary">${i}</a>
		            </c:forEach>
		            <c:if test="${pv.endPage ne pv.maxPage }">
		              <a href="${root}/commute/main/${pv.endPage + 1}" class="btn mb-2 btn-primary">></a>
		            </c:if>	
		          </div>
		        </c:if>
		        <c:if test="${empty comList && not empty enrollDate1 && not empty enrollDate2}">
		          <div id="page-area">
			          <c:if test="${pv.startPage ne 1}">
			            <a href="${root}/commute/main/${pv.startPage - 1}?enrollDate=${enrollDate1}&enrollDate=${enrollDate2}&comStatus=${comStatus}" class="btn mb-2 btn-primary"><</a>
			          </c:if>
			          <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
			              <a href="${root}/commute/main/${i}?enrollDate=${enrollDate1}&enrollDate=${enrollDate2}&comStatus=${comStatus}" class="btn mb-2 btn-primary">${i}</a>
			          </c:forEach>
			          <c:if test="${pv.endPage ne pv.maxPage }">
			            <a href="${root}/commute/main/${pv.endPage + 1}?enrollDate=${enrollDate1}&enrollDate=${enrollDate2}&comStatus=${comStatus}" class="btn mb-2 btn-primary">></a>
			          </c:if>	
			        </div>
		        </c:if>
		
		      </div>
			</main>
		  </div>
		 </div>
		</div>
</body>
</html>