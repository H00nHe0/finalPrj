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
      #hiddenNo {
        display: none;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/common.jsp" %>

      <div id="main">
        <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
        <div id="board">
          <div id="calendar"></div>
          <div id="hiddenNo">${loginMember.no}</div>
        </div>
      </div>
    </div>
  </body>
</html>
<script src="${root}/resources/js/index.global.js"></script>

<script>
  $(function () {
    const hiddenNo = document.querySelector("#hiddenNo").innerHTML;
    $.ajax({
      url: "list.hosCalendar",
      type: "post",
      dataType: "json",
      data: { emNo: hiddenNo },
      success: function (list) {
        console.log(list);

        let data = [];
        for (let i = 0; i < list.length; i++) {
          let obj = {
            title: list[i].title,
            start: list[i].calStart,
            end: list[i].calEnd,
          };
          data.push(obj);
        }

        var initialLocaleCode = "ko";
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: "dayGridMonth",
          locale: "ko",
          headerToolbar: {
            left: "prev,next today",
            center: "title",
            right: "dayGridMonth,timeGridWeek,timeGridDay",
          },
          selectable: true,
          droppable: true,
          editable: true,
          events: data,
          select: function (arg) {
            var title = prompt("일정의 제목을 지정해주세요:");
            if (title != null) {
              var startTime = prompt(
                "일정의 시작 시간을 입력해주세요 (HH:mm):"
              );
              var endTime = prompt("일정의 종료 시간을 입력해주세요 (HH:mm):");
            }
            if (title) {
              var startDate = new Date(arg.start);
              var endDate = new Date(arg.end - 1);

              // 사용자 입력 시간을 적용
              startDate.setHours(
                Number(startTime.split(":")[0]),
                Number(startTime.split(":")[1])
              );
              endDate.setHours(
                Number(endTime.split(":")[0]),
                Number(endTime.split(":")[1])
              );
              // 형식 변환
              function formatDate(date) {
                var year = date.getFullYear();
                var month = ("0" + (date.getMonth() + 1)).slice(-2);
                var day = ("0" + date.getDate()).slice(-2);
                var hours = ("0" + date.getHours()).slice(-2);
                var minutes = ("0" + date.getMinutes()).slice(-2);
                var seconds = ("0" + date.getSeconds()).slice(-2);

                var formattedDate =
                  year +
                  "-" +
                  month +
                  "-" +
                  day +
                  " " +
                  hours +
                  ":" +
                  minutes +
                  ":" +
                  seconds;

                return formattedDate;
              }
              var formattedStartDate = formatDate(startDate);
              var formattedEndDate = formatDate(endDate);
              arg.title = title;
              arg.start = formattedStartDate;
              arg.end = formattedEndDate;
              arg.allDay = false;
              const newEventData = {
                title: title,
                calStart: formattedStartDate,
                calEnd: formattedEndDate,
                allDay: false,
                emNo: hiddenNo,
              };
              console.log(newEventData);
              $.ajax({
                url: "insertEventToDB",
                type: "post",
                data: newEventData,
                dataType: "text",
                success: function (data) {
                  if (data === "success") {
                    console.log("데이터 삽입성공!");
                    console.log(arg);
                    alert("일정 등록이 성공하였습니다.");
                  } else {
                    console.log("데이터 삽입실패..");
                  }
                },
                error: function () {
                  console.log("통신 실패");
                },
              });
              calendar.addEvent(arg); // 캘린더에 이벤트 추가
              calendar.addEvent(newEventData); // 캘린더에 이벤트 추가
              calendar.render(); // 캘린더를 다시 렌더링하여 화면 새로고침
            }
            calendar.unselect();
          },
          //관리자만
          eventClick: function (arg) {
            //const deleteTitle = arg.val("title");
            const title = arg.event.title;
            console.log(title);
            if (confirm("일정을 삭제 하시겠습니까?")) {
              $.ajax({
                url: "deleteEventFromDB",
                type: "post",
                data: { title: title },
                dataType: "text",
                success: function (data) {
                  if (data === "success") {
                    console.log("데이터 삭제성공!");
                    arg.event.remove();
                    calendar.render(); // 캘린더를 다시 렌더링하여 화면 새로고침
                    alert("일정 삭제가 성공하였습니다.");
                  } else {
                    console.log("데이터 삭제실패..");
                  }
                },
                error: function () {
                  console.log("통신 실패");
                },
              });
            }
          },
        });

        calendar.render();
      },
      error: function () {
        console.log("통신 실패");
      },
    });
  });
</script>
