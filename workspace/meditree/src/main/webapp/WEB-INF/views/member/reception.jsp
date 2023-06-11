<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>reception</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
      #main {
        display: grid;
        grid-template-columns: 1fr 8fr;
      }
      #board {
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: rgb(211, 211, 211, 0.3);
      }
      #board #reception-holder {
        width: 65%;
        height: 90%;
        display: flex;
      }
      .reception-form {
        display: grid;
        grid-template-rows: 1.2fr 1fr;
        width: 100%;
        height: 100%;
        /*         border: 1px solid black; */
        margin-right: 30px;
        font-size: 17px;
        background-color: white;
        border: 1px solid lightgrey;
      }
      .bggray {
        background-color: lightgray;
      }

      #form1 td,
      #form2 td {
        padding-right: 5px;
      }
      #form2 {
        height: 80%;
      }
      #form2 tbody th {
        padding-bottom: 10px;
        height: 8%;
      }
      #form2 tbody > tr:nth-child(2) {
        margin-top: 10px;
        height: 8%;
      }
      #form2 tbody > tr:nth-child(3) {
        height: 45%;
      }
      #form2 tbody > tr:nth-child(4) {
        height: 15%;
      }

      table {
        /* margin: auto; */
        border-collapse: collapse;
        width: 100%;
        height: 90%;
      }
      th {
        background-color: #e0e0e0;
        height: 50px;
        font-size: 20px;
      }

      td {
        /* padding-top: 10px; */
        width: 100px;
        text-align: center;
        font-size: 16px;
      }
      .sorting {
        width: 100%;
        height: 100%;
      }

      #waiting,
      #waiting-done {
        height: 100%;
        width: 80%;
      }
      td > p {
        height: 80%;
        margin: auto;
        font-size: 18px;
        font-weight: 600;
      }

      textarea {
        box-sizing: border-box;
        width: 100%;
      }
      .reception-btn {
        box-sizing: border-box;
        width: 90%;
        margin: 10px;
        margin-top: -10px;
        padding-top: -10px;
        background-color: rgba(130, 203, 196, 0.4);
        font-size: 16px;
        padding: 10px 12px;
        height: auto;
        font-weight: 600;
        border: none;
        border-radius: 5px;
      }

      button:hover,
      #register-btn:hover {
        background-color: rgba(130, 203, 196, 0.8);
      }
      .seperate-line {
        border-bottom: 1px solid lightgrey;
      }

      #manage-form
        tr:hover:not(:nth-child(1)):not(:nth-child(2)):not(:nth-child(3)):not(
          :last-child
        ) {
        background-color: rgb(211, 211, 211, 0.2);
      }
      #manage-form #holder tr:hover {
        background-color: rgb(211, 211, 211, 0.2);
      }
      #manage-form #ing-holder tr:hover {
        background-color: rgb(211, 211, 211, 0.2);
      }

      /* 모달창 관련 css */
      #register-table input {
        box-sizing: border-box;
        width: 100%;
        height: 100%;
        border: none;
        padding-left: 5px;
      }

      #register-table textarea {
        margin-top: 5px;
        height: 100%;
        border: none;
      }

      #register-table {
        height: 350px;
        width: 450px;
        margin: auto;
        font-weight: 600;
      }
      #register-table td {
        border: 1px solid lightgrey;
      }
      #modal-container {
        display: none;
        width: 100%;
        height: 120%;
        position: absolute;
        left: 0;
        top: 0;

        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(137, 141, 140, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
      }
      #modal-window {
        background: rgba(255, 255, 255, 1);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(13.5px);
        -webkit-backdrop-filter: blur(13.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        width: 500px;
        height: 650px;
        position: relative;
        top: -100px;
        padding: 10px;
      }
      #title-line {
        text-align: center;
      }
      #title-line > div {
        display: inline-block;
        vertical-align: middle;
      }
      #title-line #form-title {
        width: 80%;
      }
      #title-line #form-title h2 {
        padding-left: 30px;
      }
      #title-line #close-icon {
        width: 15%;
      }
      .modal img {
        width: 30px;
        height: 30px;
      }
      #close-icon button {
        border: none;
        background-color: white;
      }
      #register-form #register-btn-area {
        margin: auto;
        padding-top: 30px;
        margin-left: 25px;
      }
      .radio-group {
        display: flex;
        flex-direction: row;
        align-items: center;
      }
      /* 라디오 버튼 스타일 지정 */
      input[type="radio"] {
        margin: auto;
      }
      #patientInfo tr:not(:first-child) {
        font-weight: 600;
      }
      #waiting-list tr:nth-child(2) {
        height: 10%;

        padding-top: -50px;
        margin-top: -100px;
      }
      #paNo {
        display: none;
      }
      #waiting-list,
      #ing-list {
        display: block;
        width: 100%;
        height: 400px;
      }
      #waiting-list #holder,
      #ing-list #ing-holder {
        display: block;
        height: 70%;
        width: 100%;
        overflow-y: auto;
      }
      #waiting-list #holder tr,
      #ing-list #ing-holder tr {
        height: 60px;
      }
      #waiting-list #holder tr td:last-child,
      .seperate-line td:last-child {
        width: 20%;
      }

      tfoot {
        display: block;
        width: 100%;
        display: flex;
        justify-content: center;
      }
      #waiting-change {
        padding-top: 10px;
        margin-top: 10px;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/common.jsp" %>
      <div id="main">
        <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
        <div id="board">
          <div id="modal-container" class="modal">
            <div id="modal-window">
              <div id="title-line">
                <div id="form-title">
                  <h2>신규 환자 등록</h2>
                </div>
                <div id="close-icon">
                  <button type="button" id="close-btn">
                    <img
                      src="${root}/resources/img/receiptionImg/cxl.png"
                      alt="닫기"
                    />
                  </button>
                </div>
              </div>
              <div id="modal-content" class="modal">
                <form
                  action="${root}/member/reception"
                  method="post"
                  id="register-form"
                >
                  <table id="register-table">
                    <tr>
                      <td>이름</td>
                      <td><input type="text" name="paName" /></td>
                    </tr>
                    <tr>
                      <td>주민등록번호</td>
                      <td><input type="text" name="rrn" /></td>
                    </tr>
                    <tr>
                      <td>성별</td>
                      <td>
                        <div class="radio-group">
                          <label
                            ><input
                              type="radio"
                              name="paGender"
                              value="M"
                              required
                            />남자</label
                          >
                          <label
                            ><input
                              type="radio"
                              name="paGender"
                              value="F"
                              required
                            />여자</label
                          >
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>연락처</td>
                      <td><input type="text" name="paTel" /></td>
                    </tr>
                    <tr>
                      <td>보호자연락처</td>
                      <td>
                        <input type="text" name="caregiver" />
                      </td>
                    </tr>
                    <tr>
                      <td>주소</td>
                      <td>
                        <input type="text" name="address" id="address_kakao" />
                      </td>
                    </tr>
                    <tr>
                      <td>메모</td>
                      <td><textarea name="memo"></textarea></td>
                    </tr>
                  </table>
                  <div id="register-btn-area">
                    <input
                      type="submit"
                      value="등록하기"
                      class="reception-btn"
                      id="register-btn"
                    />
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div id="reception-holder">
            <div class="reception-form">
              <table id="patientInfo">
                <th colspan="6">환자접수</th>
                <tr>
                  <td><h3>인적정보</h3></td>
                  <td></td>
                  <td>
                    <button
                      type="button"
                      class="reception-btn"
                      id="registed-patients-btn"
                    >
                      환자조회
                    </button>
                  </td>
                  <td>
                    <button
                      type="button"
                      class="reception-btn"
                      id="register-patient-btn"
                    >
                      환자등록
                    </button>
                  </td>
                </tr>
                <tr>
                  <td>이름</td>
                  <td colspan="3" id="nameBox"></td>
                  <td colspan="3" id="paNo"></td>
                </tr>
                <tr>
                  <td>주민번호</td>
                  <td colspan="3" id="gotPaRrn"></td>
                </tr>
                <tr>
                  <td>최근내원일</td>
                  <td colspan="3" id="gotPaDate"></td>
                </tr>
                <tr>
                  <td>최근진료과</td>
                  <td colspan="3" id="gotRecentTreat"></td>
                </tr>
                <tr>
                  <td>메모</td>
                  <td colspan="3" id="gotPaMemo"></td>
                </tr>
              </table>

              <table id="form2">
                <th colspan="6">접수정보</th>
                <tr>
                  <!-- 진료과 db에서 진료과목이름만 조회하고 과목선택하면 그 과목의 의사만 보이게 조회하기 만들기!!! -->
                  <td>진료과</td>
                  <td>
                    <select
                      class="sorting"
                      name="deptNo"
                      id="deptNo"
                      onchange="selectDoctor(this)"
                    >
                      <option value="#" selected>선택</option>
                      <c:forEach items="${mvoList}" var="m">
                        <option value="${m.NO}">${m.TITLE}</option>
                      </c:forEach>
                    </select>
                  </td>
                  <td>담당의</td>
                  <td>
                    <select class="sorting" name="empNo" id="empNo">
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
                  <td>증상</td>
                  <td colspan="3">
                    <textarea
                      id="symptom"
                      name="symptom"
                      cols="30"
                      rows="10"
                    ></textarea>
                  </td>
                </tr>
                <tr>
                  <td></td>
                  <td colspan="2">
                    <button class="reception-btn" onclick="EnrollTreatment();">
                      접수
                    </button>
                  </td>
                  <td></td>
                </tr>
              </table>
            </div>
            <div class="reception-form" id="manage-form">
              <table id="waiting-list">
                <th colspan="6">진료 예약</th>
                <tr>
                  <td colspan="2"><p>진료 과 선택</p></td>
                  <td colspan="4">
                    <select
                      name="waitingDeptNo"
                      id="waiting"
                      onchange="changeWaitingCondition(this)"
                    >
                      <option value="1" selected>전체</option>
                      <c:forEach items="${mvoList}" var="m">
                        <option value="${m.NO}">${m.TITLE}</option>
                      </c:forEach>
                    </select>
                  </td>
                </tr>
                <tr class="seperate-line">
                  <td>
                    <input type="checkbox" />
                  </td>
                  <td>순번</td>
                  <td>이름</td>
                  <td>성별</td>
                  <td>나이(만)</td>
                  <td>진료과</td>
                </tr>

                <tbody id="holder"></tbody>
                <tfoot id="tablefoot">
                  <tr>
                    <td colspan="6">
                      <button
                        type="button"
                        class="reception-btn"
                        id="waiting-change"
                        onclick="changePatientStatus();"
                      >
                        상태변경
                      </button>
                    </td>
                  </tr>
                </tfoot>
              </table>
              <table id="ing-list">
                <th colspan="5">진료 중 환자</th>
                <tr>
                  <td colspan="2"><p>진료 과 선택</p></td>
                  <td colspan="3">
                    <select
                      name="ingDeptNo"
                      id="waiting-done"
                      onchange="changeIngCondition(this)"
                    >
                      <option value="1" selected>전체</option>
                      <c:forEach items="${mvoList}" var="m">
                        <option value="${m.NO}">${m.TITLE}</option>
                      </c:forEach>
                    </select>
                  </td>
                </tr>
                <tr class="seperate-line">
                  <td>진료</td>
                  <td>이름</td>
                  <td>성별</td>
                  <td>나이</td>
                  <td>진료과</td>
                </tr>
                <tbody id="ing-holder"></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  window.onload = function () {
    document
      .getElementById("address_kakao")
      .addEventListener("click", function () {
        //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
          oncomplete: function (data) {
            //선택시 입력값 세팅
            document.getElementById("address_kakao").value = data.address; // 주소 넣기
          },
        }).open();
      });
  };
  // const popUpList = document.querySelector("#registed-patients-btn");
  const modalOn = document.querySelector("#register-patient-btn");
  const modal = document.querySelector("#modal-container");

  function isModalOn() {
    return modal.style.display === "flex";
  }
  function modalOff() {
    modal.style.display = "none";
  }

  // popUpList.addEventListener("click", (x) => {
  //   window.open("");
  // });

  modalOn.addEventListener("click", (x) => {
    modal.style.display = "flex";
  });
  const closeBtn = modal.querySelector("#close-btn");
  closeBtn.addEventListener("click", (e) => {
    modalOff();
  });

  $(document).ready(function () {
    $("#holder tr").click(function () {
      var checkbox = $(this).find('input[type="checkbox"]');
      checkbox.prop("checked", !checkbox.prop("checked"));
    });
  });

  function selectCB(clickedRow) {
    const checkboxButton = clickedRow.querySelector('input[type="checkbox"]');
    checkboxButton.checked = !checkboxButton.checked;
  }

  function uncheckOthercbButtons(clickedcheckbox) {
    const checkboxButtons = document.getElementsByName("change");
    checkboxButtons.forEach((checkboxButton) => {
      if (checkboxButton !== clickedcheckbox) {
        checkboxButton.checked = false;
      }
    });
  }
</script>
<script>
  $(document).ready(function () {
    $("#registed-patients-btn").click(function () {
      window.open(
        "simplePatientCheck",
        "popup",
        "width=700px,height=800px,left=50%,top=50%"
      );
    });
  });

  function setSelectedPatientInfo(patientNo) {
    // 선택한 환자 정보 처리
    var gotNo = patientNo;

    var paNo = document.getElementById("paNo");

    paNo.innerHTML = gotNo;

    const gotPaNo = document.querySelector("td[id = paNo]").innerHTML;
    $.ajax({
      url: "/app/member/selectName",
      type: "post",
      data: {
        paNo: gotPaNo,
      },
      success: function (data) {
        console.log("통신성공");
        const obj = JSON.parse(data);
        console.log(obj);
        // 주민등록번호 가리기
        if (obj.rrn.length > 10) {
          const maskedRrn = obj.rrn.slice(0, -6) + "******";
          obj.rrn = maskedRrn;
        }
        // 최근 내원일 형식 변경
        const paDate = new Date(obj.paDate);
        const options = { year: "numeric", month: "numeric", day: "numeric" };
        const formattedPaDate = paDate.toLocaleDateString(undefined, options); // 연월일 형식으로 변환
        obj.paDate = formattedPaDate;
        console.log(obj.paDate);
        //jsp에 데이터 넣기
        if (obj.paDate == "2023. 6. 11.") {
          obj.paRecentTreat = "최초 방문";
        } else {
          obj.paRecentTreat = "일반 내과";
        }

        const paName = document.querySelector("#nameBox");
        paName.innerHTML = obj.paName;
        const gotPaRrn = document.querySelector("#gotPaRrn");
        gotPaRrn.innerHTML = obj.rrn;
        const gotPaDate = document.querySelector("#gotPaDate");
        gotPaDate.innerHTML = obj.paDate;
        const gotRecentTreat = document.querySelector("#gotRecentTreat");
        gotRecentTreat.innerHTML = obj.paRecentTreat;
        const gotPaMemo = document.querySelector("#gotPaMemo");
        gotPaMemo.innerHTML = obj.memo;
        //innerHTML
      },
      error: function (x) {
        console.log("통신실패..");
      },
    });
    // simplePatientCheck 팝업 창 닫기
    window.close("simplePatientCheck");
  }

  //선택한 진료과에 속한 의사만 보이게
  function selectDoctor(deptNo) {
    const selectDeptNo = $(deptNo).val();

    if (selectDeptNo == "") {
      //console.log("선택안함");
    } else if (selectDeptNo == 40) {
      $("select option[class*='일반내과']").prop("disabled", false);
      $("select option[class*='일반내과']").removeClass("bggray");

      $("select option[class*='정신과']").prop("disabled", true);
      $("select option[class*='정신과']").addClass("bggray");

      $("select option[class*='이비인후과']").prop("disabled", true);
      $("select option[class*='이비인후과']").addClass("bggray");

      $("select option[class*='산부인과']").prop("disabled", true);
      $("select option[class*='산부인과']").addClass("bggray");
    } else if (selectDeptNo == 50) {
      $("select option[class*='일반내과']").prop("disabled", true);
      $("select option[class*='일반내과']").addClass("bggray");

      $("select option[class*='정신과']").prop("disabled", false);
      $("select option[class*='정신과']").removeClass("bggray");

      $("select option[class*='이비인후과']").prop("disabled", true);
      $("select option[class*='이비인후과']").addClass("bggray");

      $("select option[class*='산부인과']").prop("disabled", true);
      $("select option[class*='산부인과']").addClass("bggray");
    } else if (selectDeptNo == 60) {
      $("select option[class*='일반내과']").prop("disabled", true);
      $("select option[class*='일반내과']").addClass("bggray");

      $("select option[class*='정신과']").prop("disabled", true);
      $("select option[class*='정신과']").addClass("bggray");

      $("select option[class*='이비인후과']").prop("disabled", false);
      $("select option[class*='이비인후과']").removeClass("bggray");

      $("select option[class*='산부인과']").prop("disabled", true);
      $("select option[class*='산부인과']").addClass("bggray");
    } else if (selectDeptNo == 70) {
      $("select option[class*='일반내과']").prop("disabled", true);
      $("select option[class*='일반내과']").addClass("bggray");

      $("select option[class*='정신과']").prop("disabled", true);
      $("select option[class*='정신과']").addClass("bggray");

      $("select option[class*='이비인후과']").prop("disabled", true);
      $("select option[class*='이비인후과']").addClass("bggray");

      $("select option[class*='산부인과']").prop("disabled", false);
      $("select option[class*='산부인과']").removeClass("bggray");
    }
  }

  // 진료 접수
  $(function () {
    selectClinicList();
  });

  function EnrollTreatment() {
    $.ajax({
      url: "insert.tr",
      type: "post",
      data: {
        paNo: $("#paNo").html(),
        deptNo: $("#deptNo").val(),
        emNo: $("#empNo").val(),
        symptom: $("#symptom").val(),
        fee: 15000,
      },
      success: function (result) {
        console.log(result);
        location.href = "checkList.tr";
      },
      error: function () {
        console.log("ajax통신 실패");
        alert("인적정보 및 접수정보를 다시 확인해주세요.");
      },
    });
  }

  // 진료 대기, 진료중 환자 조회
  function selectClinicList() {
    $.ajax({
      url: "treatList.tr",
      success: function (data) {
        let wlist = data.wlist;
        let plist = data.plist;
        console.log(wlist);

        let waitingValue = "";

        for (let i = 0; i < wlist.length; i++) {
          let deptName = "";
          if (wlist[i].deptNo === "40") {
            deptName = "일반내과";
          } else if (wlist[i].deptNo === "50") {
            deptName = "정신과";
          } else if (wlist[i].deptNo === "60") {
            deptName = "이비인후과";
          } else if (wlist[i].deptNo === "70") {
            deptName = "산부인과";
          }

          waitingValue +=
            "<tr onclick='selectCB(this)'>" +
            "<td><input type='checkbox' name='change' value='" +
            wlist[i].no +
            "' onclick='uncheckOthercbButtons(this)'></td>" +
            "<td>" +
            (i + 1) +
            "</td>" +
            "<td>" +
            wlist[i].paName +
            "</td>" +
            "<td>" +
            wlist[i].paGender +
            "</td>" +
            "<td>" +
            wlist[i].age +
            "세" +
            "</td>" +
            "<td>" +
            deptName +
            "</td>" +
            "</tr>";
        }

        let ingValue = "";

        for (let i = 0; i < plist.length; i++) {
          let deptName = "";
          if (plist[i].deptNo === "40") {
            deptName = "일반내과";
          } else if (plist[i].deptNo === "50") {
            deptName = "정신과";
          } else if (plist[i].deptNo === "60") {
            deptName = "이비인후과";
          } else if (plist[i].deptNo === "70") {
            deptName = "산부인과";
          }

          ingValue +=
            "<tr onclick='selectCB(this)'>" +
            "<td>" +
            (i + 1) +
            "</td>" +
            "<td>" +
            plist[i].paName +
            "</td>" +
            "<td>" +
            plist[i].paGender +
            "</td>" +
            "<td>" +
            plist[i].age +
            "세" +
            "</td>" +
            "<td>" +
            deptName +
            "</td>" +
            "</tr>";
        }

        $("#waiting-list #holder").html(waitingValue);
        $("#ing-list #ing-holder").html(ingValue);
      },
      error: function () {
        console.log("진료 대기 환자 조회용 ajax통신 실패");
      },
    });
  }

  // 진료중으로 상태변경
  function changePatientStatus() {
    let changeArray = new Array();

    $("input:checkbox[name=change]:checked").each(function () {
      changeArray.push(this.value);
    });

    $.ajax({
      url: "change.tr",
      data: {
        changeArray: changeArray,
      },
      success: function (result) {
        console.log(result);
        location.href = "checkList.tr";
      },
      error: function () {
        console.log("ajax통신 실패");
      },
    });
  }
  function changeWaitingCondition(deptNo) {
    let selectDeptNo = $(deptNo).val();
    //console.log(selectDeptNo);

    $.ajax({
      url: "wlist.pt",
      data: {
        deptNo: selectDeptNo,
      },
      success: function (data) {
        //console.log(wlist);
        let wlist = data.wlist;

        let waitingValue = "";

        for (let i = 0; i < wlist.length; i++) {
          let deptName = "";
          if (wlist[i].deptNo === "40") {
            deptName = "일반내과";
          } else if (wlist[i].deptNo === "50") {
            deptName = "정신과";
          } else if (wlist[i].deptNo === "60") {
            deptName = "이비인후과";
          } else if (wlist[i].deptNo === "70") {
            deptName = "산부인과";
          }

          waitingValue +=
            "<tr onclick='selectCB(this)'>" +
            "<td><input type='checkbox' name='change' value='" +
            wlist[i].no +
            "' onclick='uncheckOthercbButtons(this)'></td>" +
            "<td>" +
            (i + 1) +
            "</td>" +
            "<td>" +
            wlist[i].paName +
            "</td>" +
            "<td>" +
            wlist[i].paGender +
            "</td>" +
            "<td>" +
            wlist[i].age +
            "세" +
            "</td>" +
            "<td>" +
            deptName +
            "</td>" +
            "</tr>";
        }

        $("#waiting-list #holder").html(waitingValue);
      },
      error: function () {
        console.log("진료 대기 환자 조회용 ajax통신 실패");
      },
    });
  }
  function changeIngCondition(deptNo) {
    let selectDeptNo = $(deptNo).val();
    //console.log(selectDeptNo);

    $.ajax({
      url: "plist.pt",
      data: {
        deptNo: selectDeptNo,
      },
      success: function (data) {
        //console.log(wlist);
        let plist = data.plist;

        let ingValue = "";

        for (let i = 0; i < plist.length; i++) {
          let deptName = "";
          if (plist[i].deptNo === "40") {
            deptName = "일반내과";
          } else if (plist[i].deptNo === "50") {
            deptName = "정신과";
          } else if (plist[i].deptNo === "60") {
            deptName = "이비인후과";
          } else if (plist[i].deptNo === "70") {
            deptName = "산부인과";
          }

          ingValue +=
            "<tr onclick='selectCB(this)'>" +
            "<td>" +
            (i + 1) +
            "</td>" +
            "<td>" +
            plist[i].paName +
            "</td>" +
            "<td>" +
            plist[i].paGender +
            "</td>" +
            "<td>" +
            plist[i].age +
            "세" +
            "</td>" +
            "<td>" +
            deptName +
            "</td>" +
            "</tr>";
        }

        $("#ing-list #ing-holder").html(ingValue);
      },
      error: function () {
        console.log("진료 대기 환자 조회용 ajax통신 실패");
      },
    });
  }
</script>
