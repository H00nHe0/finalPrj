<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<style>
.miniBoardTitle{
	display: grid;
	grid-template-columns: 8fr 2fr;
	
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div id="wrap">
       <%@ include file="/WEB-INF/views/common/common.jsp" %>
       <div id="main">
           <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
           <div id="background">
               <div id="board">
                <div class="board-visit" id="visit-daily">
                    <div class="text-img">
                        <img src="${root}/resources/img/homeImg/date.png" alt="daily"><h3>오늘 내원 환자수</h3>
                    </div>
                    <div class="count"><h2>${9}명</h2></div>
                </div>
                <div class="board-visit" id="visit-weekly">
                    <div class="text-img">
                        <img src="${root}/resources/img/homeImg/7-days.png" alt="weekly"><h3>이번 주 내원 환자수</h3>
                    </div>
                    <div class="count"><h2>${99}명</h2></div>
                </div>
                <div class="board-visit" id="visit-monthly">
                    <div class="text-img">
                        <img src="${root}/resources/img/homeImg/30-days.png" alt="monthly"><h3>이번 달 방문자 수</h3>
                    </div>
                    <div class="count"><h2>${999}명</h2></div>
                </div>

                <div class="board-graph chart-holder" id="graph-stick">
                    <canvas id="stick-chart"></canvas>

                  </div>

                <div class="board-graph" id="graph-circle">
                    <div class="chart-holder" style="max-width: 350px">
                    <canvas id="circle-chart"></canvas>
                    </div>
                </div>

                <div class="board-notice" id="board-notice1">
                <div class="miniBoardTitle">
                <h3>공지사항</h3>
                <a style="padding-top: 20px;" href="${root}/notice/list">더보기</a>
                </div> 
                    
                    <div>
                        <table class="table table-hover">
                          <thead class="table-success">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>날짜</th>
                            </tr>
                          </thead>  
                            <tbody>
	                          	<tr>
	                          		<td>15</td>
			                        <td>6월 세미나에 관해 안내드립니다.</td>
			                        <td>2023-06-09</td>
	                          	</tr>
	                          	<tr>
	                          		<td>${nvo.no}</td>
			                        <td>6월 신규 약품 안내드립니다.</td>
			                        <td>${nvo.enrollDate}</td>
	                          	</tr>
	                          	<tr>
	                          		<td>${nvo.no}</td>
			                        <td>6월 근무 안내드립니다.</td>
			                        <td>${nvo.enrollDate}</td>
	                          	</tr>
                        	</tbody>    
                        </table>
                    </div>
                </div>
                <div class="board-notice" id="board-notice2">
                    <div class="miniBoardTitle">
                    <h3>사내게시판</h3>
                    <a style="padding-top: 20px;" href="${root}/board/list">더보기</a>
                	</div> 
                    <div>
                        <table class="table table-hover">
                          <thead class="table-success">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                            </tr>
                          </thead>  
                            <tbody>
	                          	<tr>
	                          		<td>${bvo.no}</td>
			                        <td>${bvo.title}</td>
			                        <td>${bvo.writerName}</td>
			                        <td>${bvo.enrollDate}</td>
	                          	</tr>
	                          	<tr>
	                          		<td>${bvo.no}</td>
			                        <td>${bvo.title}</td>
			                        <td>${bvo.writerName}</td>
			                        <td>${bvo.enrollDate}</td>
	                          	</tr>
	                          	<tr>
	                          		<td>${bvo.no}</td>
			                        <td>${bvo.title}</td>
			                        <td>${bvo.writerName}</td>
			                        <td>${bvo.enrollDate}</td>
	                          	</tr>
                        </tbody>    
                       </table>
                    </div>
                </div>
                <div class="board-notice" id="board-notice3">
                    <div class="miniBoardTitle">
                    <h3>오늘의 식단표</h3>
                    <a style="padding-top: 20px;" href="${root}/weekly/pmenu">더보기</a>
                	</div> 
                    <div id="meal-holder">
                        <div>
                            <h4>토마토 스파게티</h4>
                            <h5>게살수프</h5>
                            <h5>로스까스</h5>
                            <h5>방울토마토</h5>
                        </div>
                        
                    </div>
                </div>
               </div>
           </div>
       </div>
    </div>

</body>
</html>
<link rel="stylesheet" href="${root}/resources/css/common/mainScreen.css">
<script defer src="${root}/resources/js/common/mainScreen.js"></script>