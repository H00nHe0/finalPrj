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
        padding: 1px;
        border-radius: 20px 20px 0 0;
        border-bottom: 2px solid grey;
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
              <div id="title"><h2>차트번호 xxxx 입원실 예약</h2></div>

              <div id="list-holder">
                <div class="rsvn-page" id="rsvn-form">
                  <div>
                    <h2>예약일자 2023-06-12</h2>
                  </div>
                  <div>
                    <table>
                      <tbody>
                        <tr>
                          <td>차트번호</td>
                          <td>
                            <input
                              type="text"
                              placeholder="EL로받아온번호"
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
                              placeholder="EL로받아온이름"
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
                              <option value="SickRm101">ESTL</option>
                              <option value="SickRm102">반복문으로</option>
                              <option value="SickRm103">사용가능한</option>
                              <option value="SickRm104">2인실</option>
                              <option value="SickRm105">조회하기</option>
                              <option value="SickRm106">할수있지?</option>
                            </select>
                            &nbsp;
                            <label for="sickroom4">4인 병실</label>
                            <select id="sickroom4" name="sickroom">
                              <option selected>선택안함</option>
                              <option value="SickRm107">ESTL</option>
                              <option value="SickRm108">반복문으로</option>
                              <option value="SickRm109">사용가능한</option>
                              <option value="SickRm110">4인실</option>
                              <option value="SickRm111">조회하기</option>
                              <option value="SickRm112">할수있지?</option>
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
                              <option selected>선택안함</option>
                              <option value="doctor1">ESTL</option>
                              <option value="doctor2">반복문으로</option>
                              <option value="doctor3">담당의</option>
                              <option value="doctor4">조회하기</option>
                              <option value="doctor5">할수있지</option>
                              <option value="doctor6">?</option>
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
</script>
