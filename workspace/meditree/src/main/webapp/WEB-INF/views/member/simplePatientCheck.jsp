<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
      body {
        width: 700px;
        height: 800px;
        margin: 0;
        padding: 0px;
      }

      #board {
        width: 100%;
        height: 100%;
        box-sizing: border-box;
      }
      #simple-patient-check-form {
        border: 2px solid lightgrey;
        margin: auto;
        margin-top: 20px;
        width: 80%;
        height: 90%;
        box-sizing: border-box;
        border-radius: 10px 10px 10px 10px;
        scale: 0.99;
      }

      /* #simple-patient-check-form:hover {
        box-shadow: 0 4px 30px rgba(130, 203, 196, 0.5);
      } */

      #title {
        text-align: center;
        background-color: #e0e0e0;
        padding: 5px;
        border-radius: 10px 10px 0 0;
      }
      table {
        margin: auto;
        width: 95%;
        height: 100%;
        text-align: center;
        padding: 0px 10px 10px 10px;
        border-collapse: collapse;
      }
      table tr:first-child {
        border-bottom: white;
      }

      td {
        cursor: pointer;
        padding: 20px;
        font-size: 18px;
        border-bottom: 1px solid lightgrey;
      }

      th {
        font-size: 18px;
        padding-top: 5px;
        padding-bottom: 20px;
      }
      #page-area {
        margin-top: 20px;
        font-size: 18px;
        font-weight: 500;
        text-align: center;
        word-spacing: 12px;
      }
      tr:hover:not(:nth-child(1)) {
        background-color: rgb(
          130,
          203,
          196,
          0.4
        ); /* 변경할 색상을 여기에 입력하세요 */
      }
      /* 환자이름 검색창css */
      .wave-group {
        position: relative;
        margin-top: 40px;
        margin-left: 125px;
        margin-bottom: 40px;
        text-align: center;
      }

      .wave-group .input {
        font-size: 18px;
        padding: 15px 10px 5px 10px;
        display: block;
        width: 250px;
        border: none;
        border-bottom: 2px solid lightgrey;
        background: transparent;
      }

      .wave-group .input:focus {
        outline: none;
      }

      .wave-group .label {
        color: #999;
        font-size: 18px;
        font-weight: normal;
        position: absolute;
        pointer-events: none;
        left: 5px;
        top: 10px;
        display: flex;
      }

      .wave-group .label-char {
        transition: 0.2s ease all;
        transition-delay: calc(var(--index) * 0.05s);
      }

      .wave-group .input:focus ~ label .label-char,
      .wave-group .input:valid ~ label .label-char {
        transform: translateY(-20px);
        font-size: 16px;
        color: black;
      }

      .wave-group .bar {
        position: relative;
        display: block;
        width: 200px;
      }

      .wave-group .bar:before {
        left: 50%;
      }

      .wave-group .bar:after {
        right: 50%;
      }

      .wave-group .input:focus ~ .bar:before,
      .wave-group .input:focus ~ .bar:after {
        width: 50%;
      }
      /* 버튼 css */
      button {
        box-sizing: border-box;
        height: 50px;
        width: 70%;
        display: flex;
        margin: auto;
        justify-content: center;
        align-items: center;
        background-color: rgba(130, 203, 196, 0.4);
        font-size: 18px;
        padding: 10px 12px;
        font-weight: 600;
        border: none;
        border-radius: 5px;
      }

      button:hover,
      #register-btn:hover {
        background-color: rgba(130, 203, 196, 0.8);
      }

      #page-area {
        width: 280px;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-evenly;
      }
      #page-area a {
        text-decoration: none;
        font-size: 20px;
      }
      .hiddenNo {
        display: none;
      }
      #hiddenSelect {
        display: none;
      }
    </style>
    <!-- 부트스트랩 -->

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div id="board">
      <div id="simple-patient-check-form">
        <form action="simplePatientCheck" method="get">
          <div>
            <div id="title">
              <h2>환자 조회</h2>
            </div>
            <select name="searchType" id="hiddenSelect">
              <option value="paName" selected>이름</option>
              <option value="rrn">생년월일</option>
              <option value="paTel">전화번호</option>
            </select>
            <div class="wave-group">
              <input
                required=""
                type="text"
                class="input"
                name="searchValue"
                value="${searchMap.searchValue}"
              />
              <span class="bar"></span>
              <label class="label">
                <span class="label-char" style="--index: 0">환</span>
                <span class="label-char" style="--index: 1">자</span>
                &nbsp;
                <span class="label-char" style="--index: 2">이</span>
                <span class="label-char" style="--index: 3">름</span>
              </label>
            </div>

            <div>
              <table id="simpleTable">
                <tr id="tabletitle">
                  <th>선택</th>
                  <th>이름</th>
                  <th>주민등록번호</th>
                </tr>
                <c:forEach items="${pvoList}" var="p">
                  <tr onclick="selectRadio(this)">
                    <td>
                      <input
                        type="radio"
                        name="paRadio"
                        onclick="uncheckOtherRadioButtons(this)"
                      />
                    </td>
                    <td class="nameBox">${p.paName}</td>
                    <td>${p.rrn}</td>
                    <td class="hiddenNo">${p.no}</td>
                  </tr>
                </c:forEach>
              </table>
              <div id="page-area">
                <c:if test="${pv.currentPage > 1}">
                  <a
                    href="${root}/app/member/simplePatientCheck?page=${pv.currentPage-1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                    class="pagingLine"
                    >이전</a
                  >
                </c:if>
                <c:forEach
                  begin="${pv.startPage}"
                  end="${pv.endPage}"
                  step="1"
                  var="i"
                >
                  <c:if test="${pv.currentPage != i}">
                    <a
                      href="${root}/app/member/simplePatientCheck?page=${i}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                      >${i}</a
                    >
                  </c:if>
                  <c:if test="${pv.currentPage == i}">
                    <a
                      style="
                        font-size: 23px;
                        background-color: lightgrey;
                        width: 13%;
                        border-radius: 10px;
                      "
                      >${i}</a
                    >
                  </c:if>
                </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
                  <a
                    href="${root}/app/member/simplePatientCheck?page=${pv.currentPage+1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                    class="pagingLine"
                    >다음</a
                  >
                </c:if>
              </div>
            </div>
          </div>
        </form>
        <button onclick="sendSelectedInfo();">환자 선택완료</button>
      </div>
    </div>
  </body>
</html>

<script>
  // 선택한 환자 번호을 저장할 전역 변수
  var selectedPatientName = "";
  var selectedPatientNo = "";
  $(document).ready(function () {
    $("#simpleTable tr").click(function () {
      var checkbox = $(this).find('input[type="checkbox"]');
      checkbox.prop("checked", !checkbox.prop("checked"));
    });
  });

  function selectRadio(clickedRow) {
    // 클릭한 행에서 환자 이름 가져오기
    selectedPatientName = clickedRow.querySelector(".nameBox").textContent;
    selectedPatientNo = clickedRow.querySelector(".hiddenNo").textContent;
    const radioButton = clickedRow.querySelector('input[type="radio"]');
    radioButton.checked = true;
  }

  function uncheckOtherRadioButtons(clickedRadio) {
    const radioButtons = document.getElementsByName("paRadio");
    radioButtons.forEach((radioButton) => {
      if (radioButton !== clickedRadio) {
        radioButton.checked = false;
      }
    });
  }

  function sendSelectedInfo() {
    // 선택한 환자 번호 사용하기
    var patientNo = selectedPatientNo;
    // 부모 창으로 선택한 환자 정보 전달
    window.opener.setSelectedPatientInfo(patientNo);
    //window.opener.document.querySelector(patientNo);
    console.log(patientNo);
    // 팝업 창 닫기
    window.close();
  }
</script>
