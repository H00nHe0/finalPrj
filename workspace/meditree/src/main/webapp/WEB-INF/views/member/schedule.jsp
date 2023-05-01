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
              title: "창업멤버 정기 총회",
              start: "2023-04-30T22:00:00",
              end: "2023-04-30T23:30:00",
            },
            {
              title: "어린이날 행사",
              start: "2023-05-05T12:00:00",
              end: "2023-05-05T16:00:00",
            },
            {
              title: "어버이날 행사",
              start: "2023-05-08T10:00:00",
              end: "2023-05-08T12:00:00",
            },
            {
              title: "보건복지부 관할 세무 감사기간",
              start: "2023-05-08",
              end: "2023-05-11",
            },
            {
              title: "간호사의날 행사",
              start: "2023-05-12T10:30:00",
              end: "2023-05-12T12:30:00",
            },
            {
              title: "스승의날 행사",
              start: "2023-05-15T13:00:00",
            },
            {
              title: "병원장과의 대화",
              start: "2023-05-22T14:30:00",
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
