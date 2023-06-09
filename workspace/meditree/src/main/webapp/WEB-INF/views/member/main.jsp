<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>main</title>
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
              <h3>공지사항</h3>
              <div>
                <table>
                  <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일시</th>
                    <th>조회수</th>
                  </tr>
                  <tr>
                    <td>${1}</td>
                    <td>짱</td>
                    <td>2022-01-01</td>
                    <td>999</td>
                  </tr>
                  <tr>
                    <td>${2}</td>
                    <td>하기싫다</td>
                    <td>2022-01-02</td>
                    <td>9952</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="board-notice" id="board-notice2">
              <h3>사내게시판</h3>
              <div>
                <table>
                  <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일시</th>
                    <th>조회수</th>
                  </tr>
                  <tr>
                    <td>${1}</td>
                    <td>짱</td>
                    <td>2022-01-01</td>
                    <td>999</td>
                  </tr>
                  <tr>
                    <td>${2}</td>
                    <td>하기싫다</td>
                    <td>2022-01-02</td>
                    <td>9952</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="board-notice" id="board-notice3">
              <h3>오늘의 식단</h3>
              <div id="meal-holder">
                <div>
                  <h4>토마토 스파게티</h4>
                  <h5>게살수프</h5>
                  <h5>로스까스</h5>
                  <h5>방울토마토</h5>
                </div>
                <div id="img-holder">
                  <img
                    src="${root}/resources/img/homeImg/meal.jpg"
                    alt="급식"
                  />
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
