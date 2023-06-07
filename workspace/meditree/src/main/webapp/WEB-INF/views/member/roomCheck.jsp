<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>OperatingRm</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <style>
      .rsvn-page h2 {
        text-align: center;
        margin-top: 50px;
      }
      #wrap {
        height: 100%;
      }
      #main {
        display: grid;
        grid-template-columns: 1fr 8fr;
        height: 150%;
      }
      #board {
        background-color: rgb(211, 211, 211, 0.3);
        width: 100%;
        height: 100%;
        box-sizing: border-box;
      }
      #board-inner {
        width: 90%;
        height: 100%;
        margin: auto;
        margin-top: 10px;
        box-shadow: 0 0 0 rgba(130, 203, 196, 0.5);
        scale: 0.99;
        background-color: white;
        border-radius: 20px 20px 20px 20px;
        display: flex;
      }


      #room-check-holder {
        box-sizing: border-box;
        border: 1px solid rgb(211, 211, 211, 0.8);
        margin: auto;
        width: 75%;
        margin-top: 30px;

        height: 95%;
        /* padding-top: 40px; */
      }

      button {
        height: 50%;
        width: 5%;
        font-size: 15px;
        background-color: rgba(130, 203, 196, 0.4);
        padding: 10px;
        font-weight: 600;
        border: none;
        border-radius: 5px;
      }
      button:hover {
        background-color: rgba(130, 203, 196, 0.8);
      }
      #mypage-btn {
        width: 100%;
        font-weight: 500;
      }
      #title {
        text-align: center;
        background-color: white;
        padding: 1px;
        border-radius: 20px 20px 0 0;
        background-color: rgb(211, 211, 211, 0.5);
        height: 50px;
        width: 100%
      }
      .innerArea{
        height: 100%;
      }
      table{
        border-collapse: collapse;

      }
      th, td:not(#except){
        border: 1px solid lightgrey;
        height: 50px;
        font-weight: 600;
      }
      #tableArea {
      height: 100%;
      width: auto;
      text-align: center;
      overflow: auto;

    }

      #tableArea>table {
        width: 90%;
        margin: auto;
        box-sizing: border-box;
      }

      #showWeekday {
      position: fixed;
      right: 50px;
      top: 15px;
      width: 200px;
      height: 80px;
      z-index: 99;
      border-radius : 7px;
      text-align: center;
      padding : 20px 0;
      border: 2px solid rgb(29, 92, 99);
      background : white;
    }
    .bgBeige {
	background-color: rgb(237, 230, 214) !important;
}

    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/common.jsp" %>

      <div id="main">
        <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
        <div id="board">
          <div id="board-inner">
            <div id="room-check-holder">
              <div class="innerArea">
                <table class="table bggray title" id="title">
                  <tr height="40">
                    <td id="except"><b>입원실 현황</B></td>
                  </tr>
                </table>
                <br>
      
                <form action="roomCheck" method="get">
                  <div align="center">
                    <button id="preButton" type="submit" class="button" name="cDate">&lt;</button>
                    <span id="showMonth"></span>
                    <button id="nextButton" type="submit" class="button" name="cDate">&gt;</button>

                  </div>
                </form>
      
                <br>
                <div id="tableArea" align="center">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>날짜 / 호</th>
                        <c:forEach var="r" items="${ roomList }">
                          <th>${r.no}호 -${r.type }인실</th>
                        </c:forEach>
                      </tr>
                    </thead>

                      <tbody>

                        <c:forEach var="d" items="${ dayList }">
                          <tr>
                            <td>
                            <span date="${d.workingDay}">${ d.workingDay }</span></td>
                            <td>
                              <c:forEach var="b" items="${ bookingList }">
                              <c:choose>
                                <c:when test="${ d.workingDay == b.workingDay and b.prNo == '201' }">
                                  <span2 count="${b.count }">${ fn:replace(b.namelist, ',', '<br>') }</span2>
                                </c:when>
                              </c:choose>
                              </c:forEach>
                            </td>
        
                            <td><c:forEach var="b" items="${ bookingList }">
                              <c:choose>
                                <c:when test="${ d.workingDay == b.workingDay and b.prNo == '202' }">
                                  <span2 count="${b.count }">${ fn:replace(b.namelist, ',', '<br>') }</span2>
                                </c:when>
                              </c:choose>
      
                            </c:forEach>
                            </td>
        
                            <td><c:forEach var="b" items="${ bookingList }">
                                <c:choose>
                                  <c:when test="${ d.workingDay == b.workingDay and b.prNo == '203' }">
                                    <span2 count="${b.count }">${ fn:replace(b.namelist, ',', '<br>') }</span2>
                                  </c:when>
                                </c:choose>
        
                              </c:forEach></td>
        
                            <td><c:forEach var="b" items="${ bookingList }">
                              <c:choose>
                                <c:when test="${ d.workingDay == b.workingDay and b.prNo == '204' }">
                                  <span4 count="${b.count }">${ fn:replace(b.namelist, ',', '<br>') }</span4>
                                </c:when>
                              </c:choose>
      
                            </c:forEach></td>
                              <td><c:forEach var="b" items="${ bookingList }">
                                <c:choose>
                                  <c:when test="${ d.workingDay == b.workingDay and b.prNo == '205' }">
                                    <span4 count="${b.count }">${ fn:replace(b.namelist, ',', '<br>') }</span4>
                                  </c:when>
                                </c:choose>
        
                              </c:forEach></td>
                              <td><c:forEach var="b" items="${ bookingList }">
                                <c:choose>
                                  <c:when test="${ d.workingDay == b.workingDay and b.prNo == '206' }">
                                    <span4 count="${b.count }">${ fn:replace(b.namelist, ',', '<br>') }</span4>
                                  </c:when>
                                </c:choose>
        
                              </c:forEach></td>
                              </tr>
                        </c:forEach>
        
                      </tbody>
                  </table>
                  <br><br><br>

                </div>
              </div>
              <div class="showWeekday" id="showWeekday">
                TODAY
              </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

<script src="${root}/resources/js/index.global.js"></script>
<script>
  // 현재 날짜 생성
  var currentDate = new Date();

  // 월 표시 함수
  function displayMonth(date) {
    var options = { year: 'numeric', month: 'long' };
    var showMonth = date.toLocaleDateString('ko-KR', options);
    document.querySelector("#showMonth").innerHTML = showMonth;
  }

  // 요일 표시 함수
  function displayWeekday(date) {
    var options = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
    var showWeekday = date.toLocaleDateString('ko-KR', options);
    document.querySelector("#showWeekday").innerHTML = showWeekday;
  }

  // 이전 월 버튼 클릭 시
  document.querySelector("#preButton").addEventListener("click", function() {
    var preMonth = new Date(currentDate);
    preMonth.setMonth(currentDate.getMonth() - 1);
    currentDate = preMonth;
    displayMonth(currentDate);
  });

  // 다음 월 버튼 클릭 시
  document.querySelector("#nextButton").addEventListener("click", function() {
    var nextMonth = new Date(currentDate);
    nextMonth.setMonth(currentDate.getMonth() + 1);
    currentDate = nextMonth;
    displayMonth(currentDate);
  });

  // 초기 월, 요일 표시
  displayMonth(currentDate);
  displayWeekday(currentDate);

</script>
<script>
$(function() {
  $("#tableArea span2").each(function() {
					if ($(this).attr("count") >= 2) {
						$(this).parent().addClass("bgBeige");
					}
				})

				$("#tableArea span4").each(function() {
					if ($(this).attr("count") >= 4) {
						$(this).parent().addClass("bgBeige");
					}
				})
  
  $("#tableArea span").each(function() {
    if ($(this).attr("date") == "${today2}") {
      $(this).parent().parent().addClass("textBold");
    }
  });

  
});
</script>