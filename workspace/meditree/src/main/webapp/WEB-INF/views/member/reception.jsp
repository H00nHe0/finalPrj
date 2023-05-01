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
        display: flex;
        align-items: center;
        justify-content: center;
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
      }
      .reception-form:hover {
        box-shadow: 0 4px 30px rgba(130, 203, 196, 0.5);
      }
      #form1 td,
      #form2 td {
        padding-right: 5px;
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
        padding-top: 10px;
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
        background-color: rgba(130, 203, 196, 0.4);
        margin-top: 10px;
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
      #register-table input,
      #register-table textarea {
        box-sizing: border-box;
        margin-top: -10px;
        width: 100%;
        height: 100%;
        border: none;
        padding-left: 5px;
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
        height: 600px;
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
                <form action="#" method="post" id="register-form">
                  <table id="register-table">
                    <tr>
                      <td>이름</td>
                      <td><input type="text" name="patientName" /></td>
                    </tr>
                    <tr>
                      <td>주민등록번호</td>
                      <td><input type="text" name="rrn" /></td>
                    </tr>
                    <tr>
                      <td>연락처</td>
                      <td><input type="text" name="patientPhone" /></td>
                    </tr>
                    <tr>
                      <td>보호자연락처</td>
                      <td>
                        <input type="text" name="patientGueardianPhone" />
                      </td>
                    </tr>
                    <tr>
                      <td>주소</td>
                      <td><input type="text" name="patientAddress" /></td>
                    </tr>
                    <tr>
                      <td>메모</td>
                      <td><textarea name="parientMemo"></textarea></td>
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
              <form id="form1" action="#" method="post">
                <table>
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
                    <td colspan="3"></td>
                  </tr>
                  <tr>
                    <td>주민번호</td>
                    <td colspan="3"></td>
                  </tr>
                  <tr>
                    <td>최조내원일</td>
                    <td></td>
                    <td>최근내원일</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>최근진료과</td>
                    <td colspan="3"></td>
                  </tr>
                  <tr>
                    <td>메모</td>
                    <td colspan="3"></td>
                  </tr>
                </table>
              </form>
              <form id="form2" action="#" method="post">
                <table>
                  <th colspan="6">접수정보</th>
                  <tr>
                    <td>진료과</td>
                    <td>
                      <select class="sorting">
                        <option value="#" selected>선택</option>
                        <option value="1">내과</option>
                        <option value="2">외과</option>
                        <option value="3">정신과</option>
                        <option value="4">신경과</option>
                      </select>
                    </td>
                    <td>담당의</td>
                    <td>
                      <select class="sorting">
                        <option value="#" selected>선택</option>
                        <option value="1">의사1</option>
                        <option value="2">의사2</option>
                        <option value="3">의사3</option>
                        <option value="4">의사4</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>증상</td>
                    <td colspan="3">
                      <textarea name="" id="" cols="30" rows="10"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td colspan="2">
                      <button type="button" class="reception-btn">접수</button>
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
                      <option value="1">1</option>
                      <option value="2">2</option>
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
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                  <td>#</td>
                </tr>
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
                      <option value="#" selected>전체</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</script>
