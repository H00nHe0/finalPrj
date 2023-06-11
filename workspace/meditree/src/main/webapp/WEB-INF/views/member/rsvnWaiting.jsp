<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>reception</title>
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
      #board-inner {
        width: 70%;
        height: 80%;
        margin: auto;
        margin-top: 30px;
        box-shadow: 0 0 0 rgba(130, 203, 196, 0.5);
        scale: 0.99;
      }
      #board-inner:hover {
        box-shadow: 0 4px 30px rgba(130, 203, 196, 0.5);
      }
      .list img {
        height: 30px;
        width: 30px;
        margin-bottom: -3px;
        margin-right: 10px;
      }
      #title {
        text-align: center;
        background-color: #e0e0e0;
        padding: 3px;
        border-radius: 10px 10px 0 0;
      }
      #wait-list-holder {
        height: 90%;
      }
      #list-holder {
        height: 100%;
        display: grid;
        grid-template-rows: 1fr 1fr;
      }
      .table-holder {
        box-sizing: border-box;
        height: 80%;
        margin-bottom: -100px;
        overflow-y: auto;
      }
      .sub-title {
        padding-left: 10px;
        padding-top: 10px;
        height: 40px;
        font-size: 20px;
        font-weight: 600;
      }
      table {
        margin: auto;
        width: 100%;
        height: 80%;
        border-collapse: collapse;
      }
      table td {
        text-align: center;
        height: 50px;
      }
      tbody tr:hover {
        background-color: rgb(
          211,
          211,
          211,
          0.4
        ); /* 변경할 색상을 여기에 입력하세요 */
      }
      th,
      tbody td {
        border-bottom: 1px solid lightgrey;
        height: 50px;
      }
      th {
        padding-bottom: 5px;
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

      #PRoomWaitingArea #PRoomWaitingArea-holder,
      #SurgeryWaitingArea #SurgeryWaitingArea-holder {
        overflow-y: auto;
      }
      #PRoomWaitingArea tbody tr {
        height: 50px;
        max-height: 50px;
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
            <div id="wait-list-holder">
              <div id="title"><h2>입원실/ 수술실 예약 대기</h2></div>

              <div id="list-holder">
                <div class="list" id="sick-ward-list">
                  <div class="sub-title">
                    <img
                      src="${root}/resources/img/receiptionImg/sickWard.png"
                      alt="입원실사진"
                    />
                    입원실
                  </div>
                  <div class="table-holder">
                    <table id="PRoomWaitingArea">
                      <thead>
                        <tr>
                          <th>차트번호</th>
                          <th>이름</th>
                          <th>성별</th>
                          <th>주민등록번호</th>
                          <th>진료과</th>
                          <th>예약</th>
                        </tr>
                      </thead>
                      <tbody id="PRoomWaitingArea-holder"></tbody>
                    </table>
                  </div>
                </div>

                <div class="list" id="surgery-list">
                  <div class="sub-title">
                    <img
                      src="${root}/resources/img/receiptionImg/surgery.png"
                      alt="수술실사진"
                    />
                    수술실
                  </div>
                  <div class="table-holder">
                    <table id="SurgeryWaitingArea">
                      <thead>
                        <tr>
                          <th>차트번호</th>
                          <th>이름</th>
                          <th>성별</th>
                          <th>주민등록번호</th>
                          <th>진료과</th>
                          <th>예약</th>
                        </tr>
                      </thead>
                      <tbody id="SurgeryWaitingArea-holder"></tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  // 예약 대기 환자 조회
  function ajaxSelectWaitingList() {
    $.ajax({
      url: "rsvWaitinglist.pt",
      success: function (data) {
        let slist = data.slist;
        console.log(slist);
        let plist = data.plist;
        console.log(plist);

        let surgeryValue = "";
        let deptName = "";

        for (let i = 0; i < slist.length; i++) {
          if (slist[i].deptNo === "40") {
            deptName = "일반내과";
          } else if (slist[i].deptNo === "50") {
            deptName = "정신과";
          } else if (slist[i].deptNo === "60") {
            deptName = "이비인후과";
          } else if (slist[i].deptNo === "70") {
            deptName = "산부인과";
          }
          surgeryValue +=
            "<tr><td id = 'reNo'>" +
            slist[i].reNo +
            "</td>" +
            "<td>" +
            slist[i].paName +
            "</td>" +
            "<td>" +
            slist[i].paGender +
            "</td>" +
            "<td>" +
            slist[i].rrn +
            "</td>" +
            "<td>" +
            deptName +
            "</td>" +
            "<td>" +
            "<button class='button' type ='button' name='rsvSRoom' value='" +
            slist[i].paNo +
            "'>예약하기</button></td>" +
            "</tr>";
        }

        let pRoomValue = "";

        for (let i = 0; i < plist.length; i++) {
          if (plist[i].deptNo === "40") {
            deptName = "일반내과";
          } else if (plist[i].deptNo === "50") {
            deptName = "정신과";
          } else if (plist[i].deptNo === "60") {
            deptName = "이비인후과";
          } else if (plist[i].deptNo === "70") {
            deptName = "산부인과";
          }
          //수술실 따라해서 paNo아닌 reNo로 바꾸기
          pRoomValue +=
            "<tr><td id = 'reNo'>" +
            plist[i].reNo +
            "</td>" +
            "<td>" +
            plist[i].paName +
            "</td>" +
            "<td>" +
            plist[i].paGender +
            "</td>" +
            "<td>" +
            plist[i].rrn +
            "</td>" +
            "<td id = 'deptName'>" +
            deptName +
            "</td>" +
            "<td>" +
            "<button class='button' type ='button' name='rsvPRoom' value='" +
            plist[i].paNo +
            "'>예약하기</button></td>" +
            "</tr>";
        }

        $("#SurgeryWaitingArea tbody").html(surgeryValue);
        $("#PRoomWaitingArea tbody").html(pRoomValue);
      },
      error: function () {
        console.log("예약 대기 환자 조회용 ajax통신 실패");
      },
    });
  }
  // 버튼 클릭 이벤트 핸들러-입원실
  $(document).on("click", "button[name='rsvPRoom']", function () {
    //alert("클릭!!");
    const gotPaNo = $(this).closest("tr").find("td#reNo").text();
    const gotPaDept = $(this).closest("tr").find("td#deptName").text();
    const patientNo = $("button[name='rsvPRoom']").val();
    // ... 기존 코드 내용 ...
    $.ajax({
      url: "rsvnScreen.pRm",
      type: "post",
      data: {
        paNo: gotPaNo,
        paDept: gotPaDept,
      },
      success: function (data) {
        console.log("통신성공(입원실예약화면)!");
        const obj = JSON.parse(data);
        console.log(obj);
        // 다른 화면으로 값 전달을 위한 form 생성
        const form = document.createElement("form");
        form.method = "GET";
        form.action = "/app/member/rsvnInpatientRm";

        // 값 전달을 위한 hidden input 추가
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "paNo";
        input.value = gotPaNo;
        form.appendChild(input);

        // form을 body에 추가하고 submit
        document.body.appendChild(form);
        form.submit();
      },
      error: function (x) {
        console.log("통신실패(입원실예약화면)");
      },
    });
  });
  // 버튼 클릭 이벤트 핸들러-수술실
  $(document).on("click", "button[name='rsvSRoom']", function () {
    const gotPaNoS = $(this).closest("tr").find("td#reNo").text();
    // ... 기존 코드 내용 ...
    $.ajax({
      url: "rsvnScreenS.sRm",
      type: "post",
      data: {
        paNo: gotPaNoS,
      },
      success: function (data) {
        console.log("통신성공(수숳실예약화면)!");
        const obj = JSON.parse(data);
        console.log(obj);
        // 다른 화면으로 값 전달을 위한 form 생성
        const form = document.createElement("form");
        form.method = "GET";
        form.action = "/app/member/rsvnOperatingRm";

        // 값 전달을 위한 hidden input 추가
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "paNo";
        input.value = gotPaNoS;
        form.appendChild(input);

        // form을 body에 추가하고 submit
        document.body.appendChild(form);
        form.submit();
      },
      error: function (x) {
        console.log("통신실패(수술실예약화면)");
      },
    });
  });
  $(function () {
    ajaxSelectWaitingList();
  });
</script>
