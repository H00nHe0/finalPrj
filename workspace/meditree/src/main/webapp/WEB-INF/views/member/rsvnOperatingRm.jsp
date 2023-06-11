<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>OperatingRm</title>
    <link
      rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"
    />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.6/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.6/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.6/index.global.min.js"></script>
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
        height: 33px;
        width: 60%;
      }
      #operatingRm {
        height: 33px;
        width: 60%;
      }
      #selectDoctor {
        height: 33px;
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
      #mypage-btn {
        width: 100%;
        font-weight: 500;
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
      .rsvn-date input,
      .finish-time input,
      .finish-time select {
        box-sizing: border-box;
        width: 30%;
        height: 33px;
      }

      .rsvn-date input:last-child {
        box-sizing: border-box;
        font-size: 15px;
        height: 33px;
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
      #hiddenDept {
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
                          <td id="hiddenDept"></td>
                          <td>차트번호</td>
                          <td>
                            <input
                              id="chartNo"
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
                          <td>수술실</td>
                          <td>
                            <select id="sRmList" name="surgeryRoom">
                              <option value="noSelect" selected>
                                선택안함
                              </option>
                              <c:forEach items="${sRmList}" var="s">
                                <option class="sList" value="${s.srmNo}">
                                  ${s.note}
                                </option>
                              </c:forEach>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td>예약날짜</td>
                          <td class="rsvn-date">
                            <input
                              id="surgeryDate"
                              name="surgeryDate"
                              type="date"
                              max="2023-12-31"
                              min="2023-05-01"
                              required
                            />
                            <input
                              type="text"
                              class="timepicker"
                              id="surgeryTime"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>예상완료 시각</td>
                          <td class="finish-time">
                            <select id="operatingFinish" name="operatingFinish">
                              <option selected>소요시간</option>
                              <option value="1">1hour</option>
                              <option value="2">2hour</option>
                              <option value="3">3hour</option>
                              <option value="4">4hour</option>
                              <option value="5">5hour</option>
                              <option value="6">6hour</option>
                            </select>
                            <input
                              id="surgeryFinish"
                              type="text"
                              readonly
                              class="readOnly"
                              placeholder="수술완료 예상시각"
                            />
                          </td>
                        </tr>
                        <tr>
                          <td>담당의</td>
                          <td>
                            <select id="selectDoctor" name="attendingDoctor">
                              <option value="#" selected>선택</option>
                              <c:forEach items="${evoList}" var="e">
                                <option
                                  class="${e.title}"
                                  value="${e.name}"
                                  data-hidden-no="${e.no}"
                                >
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
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  </body>
</html>
<script src="${root}/resources/js/index.global.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
  $(document).ready(function () {
    $(".timepicker").timepicker({
      timeFormat: "h:mm p",
      interval: 30,
      minTime: "6",
      maxTime: "22:00pm",
      defaultTime: "6",
      startTime: "06:00",
      dynamic: false,
      dropdown: true,
      scrollbar: true,
    });
    //수술 완료시간 나오게
    $("#surgeryTime, #operatingFinish").change(function () {
      var surgeryDate = $("#surgeryDate").val();
      var surgeryTime = $("#surgeryTime").val();
      var operatingFinish = $("#operatingFinish").val();

      if (surgeryDate && surgeryTime && operatingFinish) {
        var dateTime = new Date(surgeryDate + " " + surgeryTime);
        dateTime.setHours(dateTime.getHours() + parseInt(operatingFinish));

        var finishTime = dateTime.toLocaleTimeString([], {
          hour: "numeric",
          minute: "2-digit",
          hour12: true,
        });
        $("#surgeryFinish").val(finishTime);
      }
    });
  });

  // member/rsvnInpatientRm 페이지에서 전달받은 값 가져오기
  $(function () {
    const params = new URLSearchParams(window.location.search);
    const gotPaNoS = params.get("paNo");
    console.log("gotPaNoS:", gotPaNoS);
    const chartNo = document.querySelector("#title");
    chartNo.innerHTML = "차트번호 " + gotPaNoS + "번 환자 수술실 예약";
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
      url: "putWaitingSPatient.op",
      type: "post",
      data: {
        paNo: gotPaNoS,
      },
      success: function (data) {
        //console.log("data : " + data);
        const parsedData = JSON.parse(data);
        const chartNo = parsedData.reNo;
        const name = parsedData.paName;
        const title = parsedData.title;
        document.querySelector('input[name="chartNo"]').value = chartNo;
        document.querySelector('input[name="pName"]').value =
          name + "   (진료과 :" + title + " )";
        document;
        const hiddenDept = document.querySelector('td[id="hiddenDept"]');
        hiddenDept.innerHTML = title;
      },
      error: function () {
        console.log("ajax통신 실패");
      },
    });
  });

  function f01() {
    const patientNo = document.querySelector("#chartNo").value;
    const suDate = document.querySelector("#surgeryDate").value;
    const suStart = document.querySelector("#surgeryTime").value;
    const suEnd = document.querySelector("#surgeryFinish").value;
    const doctor = document.querySelector("#selectDoctor").value;
    const rmNo = document.querySelector("#sRmList").value;
    const dept = document.querySelector("#hiddenDept").innerHTML;
    var selectElement = document.querySelector("#selectDoctor");
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    const emNo = selectedOption.getAttribute("data-hidden-no");

    var selectElement = document.getElementById("sRmList");
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    const title = selectedOption.text.trim();
    console.log(title);
    const surgeryData = {
      suDate: suDate,
      suStart: suStart,
      suEnd: suEnd,
      dept: dept,
      doctor: doctor,
      rmNo: rmNo,
      allDay: true,
    };
    $.ajax({
      url: "insertSRSVNEventToDB",
      type: "post",
      data: surgeryData,
      dataType: "text",
      success: function (data) {
        if (data === "success") {
          console.log("데이터 삽입성공!");
          console.log(data);
          alert("수술일정 등록이 성공하였습니다.");
        } else {
          console.log("데이터 삽입실패..");
        }
      },
      error: function () {
        console.log("통신 실패");
      },
    });
    const calendarData = {
      title: title,
      calStart: suDate,
      calEnd: suDate,
      paNo: patientNo,
      emNo: emNo,
    };
    $.ajax({
      url: "sendToCalendar.sRm",
      type: "post",
      data: calendarData,
      success: function () {
        window.location.href = "/app/member/rsvnWaiting";
      },
      error: function () {
        console.log("수술실 캘린더 등록실패");
      },
    });
  }

  //달력 표시
  $(function () {
    $.ajax({
      url: "list.sRoomCalendar",
      type: "post",
      dataType: "json",
      success: function (list) {
        console.log(list);

        let data = [];
        for (let i = 0; i < list.length; i++) {
          let title = list[i].title.trim().slice(-6); // title 값을 가져와서 좌우 공백 제거 후 6자리까지 자르기
          let obj = {
            title: title,
            start: list[i].calStart.substring(0, 10),
            end: moment(list[i].calEnd.substring(0, 10))
              .add(1, "days")
              .format("YYYY-MM-DD"),
            allDay: true,
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
