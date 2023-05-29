<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>reception</title>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.6/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.6/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.6/index.global.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      .rsvn-page h2 {
        text-align: center;
        margin-top: 50px;
      }
      #main {
        display: grid;
        grid-template-columns: 1fr 8fr;
      }
      #board {
        background-color: rgb(211, 211, 211, 0.3);
        width: 100%;
        height: 100%;
        box-sizing: border-box;
      }
      #board-inner {
        width: 90%;
        height: 90%;
        margin: auto;
        margin-top: 10px;
        box-shadow: 0 0 0 rgba(130, 203, 196, 0.5);
        scale: 0.99;
        background-color: white;
        border-radius: 20px 20px 20px 20px;
      }
      #board-inner:hover {
        box-shadow: 0 4px 30px rgba(130, 203, 196, 0.5);
      }

      #title {
        text-align: center;
        background-color: white;

        border-radius: 20px 20px 0 0;
        border-bottom: 2px solid grey;
        font-size: 30px;
        font-weight: 600;
        padding-top: 10px;
        padding-bottom: 10px;
      }
      #rsvn-holder {
        height: 100%;
      }
      #list-holder {
        height: 90%;
        display: grid;
        grid-template-columns: 1fr 1fr;
      }
      table {
        width: 80%;
        height: 80%;
        border-collapse: collapse;
        margin: auto;
      }
      table td {
        text-align: center;
        height: 60px;
      }
      table input {
        height: 30px;
        width: 60%;
      }
      table select {
        height: 30px;
      }
      #selectDoctor {
        height: 30px;
        width: 60%;
      }
      #sickRmMemo {
        height: 100px;
        width: 60%;
      }
      .readOnly {
        background-color: rgb(211, 211, 211, 0.2);
      }

      th,
      tbody td {
        border-bottom: 1px solid lightgrey;
      }

      button {
        height: 65%;
        width: 70%;
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
      #calendar {
        padding: 30px 20px 30px 30px;
      }
      #submit-btn {
        height: 10%;
        width: 70%;
        margin: auto;
        padding-top: 50px;
        padding-left: 150px;
      }
      .fc-today-button,
      .fc-button-group {
        width: 90px;
        font-size: 12px;
      }
      #calendar-holder {
        width: 95%;
        height: 100%;
        position: relative;
      }
      h2:not(#rsvn-form h2) {
        font-size: 23px;
      }
      #date-of-today {
        text-align: center;
        font-size: 30px;
        font-weight: 600;
        padding-top: 20px;
        padding-bottom: 20px;
      }
      .readOnly {
        text-align: center;
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
            <div id="rsvn-holder">
              <div id="title"></div>

              <div id="list-holder">
                <div class="rsvn-page" id="rsvn-form">
                  <div id="date-of-today"></div>
                  <div>
                    <table>
                      <tbody>
                        <tr>
                          <td>차트번호</td>
                          <td>
                            <input
                              type="text"
                              name="chartNo"
                              readonly
                              class="readOnly"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>수진자명</td>
                          <td>
                            <input
                              type="text"
                              name="pName"
                              readonly
                              class="readOnly"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>입원실</td>
                          <td>
                            <label for="sickroom2">2인 병실</label>
                            <select id="sickroom2" name="sickroom">
                              <option selected>선택안함</option>
                              <option value="201">201호</option>
                              <option value="202">202호</option>
                              <option value="203">203호</option>
                            </select>
                            &nbsp;
                            <label for="sickroom4">4인 병실</label>
                            <select id="sickroom4" name="sickroom">
                              <option selected>선택안함</option>
                              <option value="204">204호</option>
                              <option value="205">205호</option>
                              <option value="206">206호</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>입원날짜</td>
                          <td>
                            <input
                              name="inSickRmDate"
                              type="date"
                              max="2023-12-31"
                              min="2023-05-01"
                              required
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>퇴원날짜</td>
                          <td>
                            <input
                              name="outSickRmDate"
                              type="date"
                              max="2023-12-31"
                              min="2023-05-01"
                              required
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>담당의</td>
                          <td>
                            <select id="selectDoctor" name="attendingDoctor">
                              <option value="#" selected>선택</option>
                              <c:forEach items="${evoList}" var="e">
                                <option class="${e.title}" value="${e.no}">
                                  ${e.name}(${e.potitle})
                                </option>
                              </c:forEach>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>특이사항</td>
                          <td>
                            <textarea
                              name="rsvnMemo"
                              id="sickRmMemo"
                              cols="30"
                              rows="10"
                            ></textarea>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="submit-btn">
                    <button type="button">예약</button>
                  </div>
                </div>
                <div id="calendar-holder">
                  <div class="rsvn-page" id="calendar"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script src="${root}/resources/js/index.global.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var calendarEl = document.getElementById("calendar");

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth,timeGridWeek,timeGridDay",
      },
      // initialDate: "2023-01-12",
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function (arg) {
        var title = prompt("일정의 제목을 지정해주세요:");
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
          });
        }
        calendar.unselect();
      },
      eventClick: function (arg) {
        if (confirm("일정을 삭제 하시겠습니까?")) {
          arg.event.remove();
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: "All Day Event",
          start: "2023-01-01",
        },
        {
          title: "전염성 균질 세미나",
          start: "2023-04-28",
          end: "2023-04-30",
        },
        {
          title: "KH주관 등급평가",
          start: "2023-05-01T09:00:00",
          end: "2023-05-01T12:00:00",
        },
        {
          title: "병원장과 점심",
          start: "2023-05-01T13:00:00",
          end: "2023-05-01T14:00:00",
        },
        {
          title: "외과전공의 협회 저녁식사",
          start: "2023-05-04T18:00:00",
          end: "2023-05-04T21:00:00",
        },
        {
          title: "와이프 생일",
          start: "2023-05-07",
        },
        {
          title: "보건복지부 주관 전공의 대상 컨퍼런스",
          start: "2023-05-19T10:30:00",
          end: "2023-05-21T12:30:00",
        },
        {
          title: "Lunch",
          start: "2023-01-12T12:00:00",
        },
        {
          title: "Meeting",
          start: "2023-01-12T14:30:00",
        },
        {
          title: "Happy Hour",
          start: "2023-01-12T17:30:00",
        },
        {
          title: "Dinner",
          start: "2023-01-12T20:00:00",
        },
        {
          title: "Birthday Party",
          start: "2023-01-13T07:00:00",
        },
        {
          title: "Click for Google",
          url: "http://google.com/",
          start: "2023-01-28",
        },
      ],
    });

    calendar.render();
  });

  // member/rsvnInpatientRm 페이지에서 전달받은 값 가져오기
  $(function () {
    const params = new URLSearchParams(window.location.search);
    const gotPaNo = params.get("paNo");
    console.log("gotPaNo:", gotPaNo);
    const chartNo = document.querySelector("#title");
    chartNo.innerHTML = "차트번호 " + gotPaNo + "번 환자 입원실 예약";
    //오늘 날짜
    const todayIs = new Date();

    var year = todayIs.getFullYear();
    var month = ("0" + (todayIs.getMonth() + 1)).slice(-2);
    var day = ("0" + todayIs.getDate()).slice(-2);

    var dateString = year + "-" + month + "-" + day;
    const dateBox = document.querySelector("#date-of-today");
    dateBox.innerHTML = "예약일자 :" + dateString;
    // 가져온 값을 사용하여 필요한 처리 수행
    // ...

    $.ajax({
      url: "putWaitingPatient.st",
      type: "post",
      data: {
        paNo: gotPaNo,
      },
      success: function (data) {
        console.log(data);
        const parsedData = JSON.parse(data);
        const chartNo = parsedData.paNo;
        const name = parsedData.paName;
        console.log(name);
        document.querySelector('input[name="chartNo"]').value = chartNo;
        document.querySelector('input[name="pName"]').value = name;
      },
      error: function () {
        console.log("ajax통신 실패");
      },
    });
  });
</script>
