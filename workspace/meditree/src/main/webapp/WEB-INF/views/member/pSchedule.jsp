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
    <style>
      #main {
        display: grid;
        grid-template-columns: 1fr 8fr;
      }
      #board {
        width: 100%;
        height: 100%;
        box-sizing: border-box;
      }
      #calendar {
        margin: 0 auto;
        width: 75%;
        height: 75%;
      }
    </style>
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
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/common.jsp" %>

      <div id="main">
        <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
        <div id="board">
          <div id="calendar"></div>
        </div>
      </div>
    </div>
  </body>
</html>
<script src="${root}/resources/js/index.global.js"></script>
