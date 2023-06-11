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
      .rList {
        text-align: center;
      }
      .fc-event-time {
        display: none;
      }
      #paNo1 {
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
                              id="pChartNo"
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
                              id="pName"
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
                              <option value="noSelect" selected>
                                선택안함
                              </option>
                              <c:forEach items="${rmList}" var="r">
                                <option class="rList" value="${r.no}">
                                  ${r.no}호실
                                </option>
                              </c:forEach>
                            </select>
                            &nbsp;
                            <label for="sickroom4">4인 병실</label>
                            <select id="sickroom4" name="sickroom">
                              <option value="noSelect" selected>
                                선택안함
                              </option>
                              <c:forEach items="${rmList2}" var="r2">
                                <option class="rList" value="${r2.no}">
                                  ${r2.no}호실
                                </option>
                              </c:forEach>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>입원날짜</td>
                          <td>
                            <input
                              id="inSickRmDate"
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
                              id="outSickRmDate"
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
                                  ${e.name}(${e.potitle}) - ${e.title}
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
                          <td id="paNo1"></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="submit-btn">
                    <button type="button" onclick="f01()">예약</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
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
        const chartNo = parsedData.reNo;
        const name = parsedData.paName;
        const paNo1 = parsedData.paNo;
        console.log(name);
        document.querySelector('input[name="chartNo"]').value = chartNo;
        document.querySelector('input[name="pName"]').value = name;
        document.querySelector('td[id ="paNo1"]').innerHTML = paNo1;
      },
      error: function () {
        console.log("ajax통신 실패");
      },
    });
  });
  //입원날짜 값, 병실,특이사항
  function f01() {
    const pChartNo = document.querySelector("#pChartNo").value;
    const inDate = document.querySelector("#inSickRmDate").value;
    const outDate = document.querySelector("#outSickRmDate").value;
    const emNo = document.querySelector("#selectDoctor").value;
    const note = document.querySelector("#sickRmMemo").value;
    const pRoom2 = document.querySelector("#sickroom2").value;
    const pRoom4 = document.querySelector("#sickroom4").value;
    const paNo = document.querySelector("#paNo1").innerHTML;
    if (pRoom2 == "noSelect") {
      selectedRm = pRoom4;
    } else {
      selectedRm = pRoom2;
    }
    const title = selectedRm;
    const calStart = inDate;
    const calEnd = outDate;

    const newEventData = {
      title: title,
      calStart: calStart,
      calEnd: calEnd,
      allDay: true,
      // emNo: hiddenNo,
    };
    $.ajax({
      url: "insertPRSVNEventToDB",
      type: "post",
      data: newEventData,
      dataType: "text",
      success: function (data) {
        if (data === "success") {
          console.log("데이터 삽입성공!");
          alert("일정 등록이 성공하였습니다.");
        } else {
          console.log("데이터 삽입실패..");
        }
      },
      error: function () {
        console.log("통신 실패");
      },
    });
    //입력값 서버 전송
    var rvo = {
      admStart: inDate,
      admFinish: outDate,
      notice: note,
      paNo: paNo,
      emNo: emNo,
      prNo: selectedRm,
    };
    $.ajax({
      url: "sentToDB.pRm",
      type: "post",
      data: rvo,
      success: function () {
        const patientName = document.querySelector('input[name="pName"]').value;
        alert(patientName + "님 입원실 예약 성공");
        window.location.href = "/app/member/rsvnWaiting";
      },
      error: function () {
        console.log("입원실 예약정보 전송실패");
      },
    });
  }

  $(function () {
    $.ajax({
      url: "list.pRoomCalendar",
      type: "post",
      dataType: "json",
      success: function (list) {
        console.log(list);

        let data = [];
        for (let i = 0; i < list.length; i++) {
          let obj = {
            title: list[i].title,
            start: list[i].calStart.substring(0, 10),
            end: moment(list[i].calEnd.substring(0, 10))
              .add(1, "days")
              .format("YYYY-MM-DD"),
            allDay: true,
          };
          console.log(list[i].calStart);
          console.log(list[i].calEnd);
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
          droppable: false,
          editable: false,
          events: data,
        });

        calendar.render();
      },
      error: function () {
        console.log("통신 실패");
      },
    });
  });
</script>
