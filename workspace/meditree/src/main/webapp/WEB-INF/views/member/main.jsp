<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <img src="${root}/resources/img/homeImg/date.png" alt="daily" />
                <h3>오늘 내원 환자수</h3>
              </div>
              <div class="count"><h2>${23}명</h2></div>
            </div>
            <div class="board-visit" id="visit-weekly">
              <div class="text-img">
                <img
                  src="${root}/resources/img/homeImg/7-days.png"
                  alt="weekly"
                />
                <h3>이번 주 내원 환자수</h3>
              </div>
              <div class="count"><h2>${152}명</h2></div>
            </div>
            <div class="board-visit" id="visit-monthly">
              <div class="text-img">
                <img
                  src="${root}/resources/img/homeImg/30-days.png"
                  alt="monthly"
                />
                <h3>이번 달 방문자 수</h3>
              </div>
              <div class="count"><h2>${719}명</h2></div>
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
	                          		<td>24</td>
			                        <td>6월 세미나에...</td>
			                        <td>2023-06-11</td>
	                          	</tr>
	                          	<tr>
	                          		<td>23</td>
			                        <td>6월 신규 약...</td>
			                        <td>2023-06-11</td>
	                          	</tr>
	                          	<tr>
	                          		<td>22</td>
			                        <td>6월 근무 안...</td>
			                        <td>2023-06-11</td>
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
	                          		<td>24</td>
			                        <td>6/20(화) 저녁...</td>
			                        <td>로이킴</td>
			                        <td>2023-06-11</td>
	                          	</tr>
	                          	<tr>
	                          		<td>23</td>
			                        <td>6/15(목) 간호부...</td>
			                        <td>오영심</td>
			                        <td>2023-06-11</td>
	                          	</tr>
	                          	<tr>
	                          		<td>22</td>
			                        <td>6/30일까지 신청...</td>
			                        <td>이영하</td>
			                        <td>2023-06-11</td>
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
                            <h5>김치볶음밥/된장찌개</h5>
                            <h5>소세지볶음/배추김치</h5>
                            <h5 style="padding-bottom: 30px;">제육볶음/사과</h5>
                        </div>
                    </div>
                </div>
               </div>
           </div>
       </div>
    </div>
  </body>
</html>
<link rel="stylesheet" href="${root}/resources/css/common/mainScreen.css" />
<script defer src="${root}/resources/js/common/mainScreen.js"></script>
