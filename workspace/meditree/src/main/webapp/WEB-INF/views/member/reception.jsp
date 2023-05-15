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
        font-size: 18px;
        background-color: white;
        border: 1px solid lightgrey;
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
        font-size: 17px;
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
                      <td><input type="text" name="address" /></td>
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
              <form
                id="form1"
                action="${root}/member/sendToWaiting"
                method="post"
              >
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
                      <select class="sorting">
                        <option value="#" selected>선택</option>
                        <option value="일반외과">일반외과</option>
                        <option value="일반외과">일반내과</option>
                        <option value="일반외과">정신과</option>
                        <option value="일반외과">이비인후과</option>
                      </select>
                    </td>
                    <td>담당의</td>
                    <td>
                      <select class="sorting" name="searchValue">
                        <option value="#" selected>선택</option>
                        <c:forEach items="${mvoList}" var="mvo">
                          <option value="${mvo.name}">
                            ${mvo.name}(${mvo.major})
                          </option>
                        </c:forEach>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>증상</td>
                    <td colspan="3">
                      <textarea name="symptom" cols="30" rows="10"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td colspan="2">
                      <button class="reception-btn">접수</button>
                    </td>
                    <td></td>
                  </tr>
                </table>
              </form>
            </div>
            <div class="reception-form" id="manage-form">
              <table id="waiting-list">
                <th colspan="6">진료관리</th>
                <tr>
                  <td colspan="2"><p>진료 과 선택</p></td>
                  <td colspan="4">
                    <select name="" id="waiting">
                      <option value="#" selected>전체</option>
                      <option value="일반외과">일반외과</option>
                      <option value="일반외과">일반내과</option>
                      <option value="일반외과">정신과</option>
                      <option value="일반외과">이비인후과</option>
                    </select>
                  </td>
                </tr>
                <tr class="seperate-line">
                  <td>전체 <input type="checkbox" /></td>
                  <td>순번</td>
                  <td>이름</td>
                  <td>성별</td>
                  <td>나이(만)</td>
                  <td>진료과</td>
                </tr>
                <c:forEach items="${pvoList}" var="p">
                  <!-- <tr>
                    <td><input type="checkbox" /></td>
                    <td>${p.paName}</td>
                    <td>${p.paName}</td>
                    <td>${p.paGender}</td>
                    <td>${p.rrn}</td>
                    <td>${p.paGender}</td>
                  </tr> -->
                </c:forEach>
                <tr>
                  <td colspan="6">
                    <button type="button" class="reception-btn">
                      상태변경
                    </button>
                  </td>
                </tr>
              </table>
              <table>
                <th colspan="5">진료 중 환자</th>
                <tr>
                  <td colspan="2"><p>진료 과 선택</p></td>
                  <td colspan="3">
                    <select name="" id="waiting-done">
                      <option value="#" selected>선택</option>
                      <option value="일반외과">일반외과</option>
                      <option value="일반외과">일반내과</option>
                      <option value="일반외과">정신과</option>
                      <option value="일반외과">이비인후과</option>
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
                <tr>
                  <td>진료완료</td>
                  <td>허훈</td>
                  <td>남</td>
                  <td>30</td>
                  <td>통증의학과</td>
                </tr>
                <tr>
                  <td>진료중</td>
                  <td>허훈여</td>
                  <td>여</td>
                  <td>30</td>
                  <td>내과</td>
                </tr>
                <tr>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                </tr>
                <tr>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                </tr>
                <tr>
                  <td colspan="5"></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

<script>
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

  function setSelectedPatientInfo(patientName) {
    // 선택한 환자 정보 처리
    var gotName = patientName;
    var nameBox = document.getElementById("nameBox");
    nameBox.innerHTML = gotName;

    const paName = document.querySelector("td[id = nameBox]").innerHTML;
    $.ajax({
      url: "/app/member/selectName",
      type: "post",
      data: {
        paName: paName,
      },
      success: function (data) {
        console.log("통신성공");
        const obj = JSON.parse(data);
        console.log(obj);
        //jsp에 데이터 넣기
        obj.paRecentTreat = obj.paRecentTreat || "최초 방문";
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
</script>
