<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>reception</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      #main {
        display: grid;
        grid-template-columns: 1fr 8fr;
      }
      #board {
        height: 100vh;
      }

      #receive-manageForm-holder {
        margin: auto;
        margin-top: 20px;
        width: 80%;
        height: 95%;
        box-sizing: border-box;
        box-shadow: 1px 1px 1px rgba(130, 203, 196, 0.5);
        scale: 0.99;
      }

      #receive-manageForm-holder:hover {
        box-shadow: 0 4px 30px rgba(130, 203, 196, 0.5);
      }

      #title {
        text-align: center;
        background-color: #e0e0e0;
        padding: 5px;
        border-radius: 10px 10px 0 0;
      }
      table {
        width: 100%;
        height: 100%;
        text-align: center;
        padding: 0px 10px 10px 10px;
        border-collapse: collapse;
      }
      table tr:first-child {
        border-bottom: white;
      }
      .print-btn1 {
        margin: 1px;
        width: 100%;
        height: 110%;
        background-color: rgba(130, 203, 196, 0.4);
        padding: 10px 12px;
        font-weight: 600;
        border: none;
        border-radius: 5px;
      }
      .print-btn2 {
        margin: 1px;
        width: 100%;
        height: 110%;
        background-color: rgba(130, 203, 196, 0.4);
        padding: 10px 12px;
        font-weight: 600;
        border: none;
        border-radius: 5px;
      }

      td {
        padding: 10px;
        font-size: 18px;
        border-bottom: 1px solid lightgrey;
      }
      .head-btn {
        height: 100%;
        width: 80%;
        font-size: 16px;
        background-color: rgba(130, 203, 196, 0.4);
        padding: 10px 12px;
        font-weight: 600;
        border: none;
        border-radius: 5px;
      }
      button:hover {
        background-color: rgba(130, 203, 196, 0.8);
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
      tr:hover:not(:nth-child(1)):not(:nth-child(2)) {
        background-color: rgb(
          211,
          211,
          211,
          0.4
        ); /* 변경할 색상을 여기에 입력하세요 */
      }
      #page-area a{
        text-decoration: none;
      }
      #page-area {
        margin-top: 100px;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/common.jsp" %>

      <div id="main">
        <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
        <div id="board">
          <div id="receive-manageForm-holder">
            <div>
              <div id="title">
                <h2>수납관리</h2>
              </div>

              <table id="receipt-table">
                <thead id="btn-wrap">
                  <tr>
                    <td colspan="2">
                      <button
                        type="button"
                        class="head-btn"
                        id="receipt-waitCheck-btn"
                      >
                        수납대기
                      </button>
                    </td>
                    <td colspan="2">
                      <a href="${root}/member/receiveDonePage"><button
                        type="button"
                        class="head-btn"
                        id="receipt-doneCheck-btn"
                        onclick="checkReceiptDone()"
                      >
                        수납완료
                      </button>
                    </td>
                    <td colspan="5">
                      <button
                        type="button"
                        class="head-btn"
                        id="receipt-done-btn"
                      >
                        수납처리
                      </button>
                    </td>
                  </tr>
                  <tr id="tabletitle">
                    <th>전체 <input type="checkbox" /></th>
                    <th>수납번호</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>주민등록번호</th>
                    <th>진료과</th>
                    <th>진료의</th>
                    <th>처방전</th>
                    <th>수납</th>
                  </tr>
                </thead>
                <tbody id="list-area">
                  <c:forEach items="${receiptList}" var="r">
                    <tr class="receipt-row">
                      <td>
                        <input
                          type="checkbox"
                          name="change"
                          value="${r.reNo}"
                        />
                      </td>
                      <td id="receiptNo">${r.reNo}</td>
                      <td>${r.paName}</td>
                      <td>${r.paGender}</td>
                      <td id="paRRN">${r.rrn}</td>
                      <td id="changeToName">${r.deptNo}</td>
                      <td>${r.name}</td>
                      <td>
                        <button type="button" class="print-btn1">출력</button>
                      </td>
                      <td>
                        <button type="button" class="print-btn2">출력</button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <div id="page-area">
                <c:if test="${pv.currentPage > 1}">
                  <a
                    href="${root}/member/receiveManage?page=${pv.currentPage-1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
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
                    <a href="${root}/member/receiveManage?page=${i}"
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
                    href="${root}/member/receiveManage?page=${pv.currentPage+1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}"
                    class="pagingLine"
                    >다음</a
                  >
                </c:if>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
<script>
  $(document).ready(function () {
    const receiptRows = document.querySelectorAll(".receipt-row");

    receiptRows.forEach((row, index) => {
      const receiptNoElement = row.querySelector("#receiptNo");
      const receiptNoValue = parseInt(receiptNoElement.textContent);

      receiptNoElement.textContent = receiptNoValue;
    });
    // 주민등록번호 가리기
    let paRRNElements = document.querySelectorAll("#paRRN");
    paRRNElements.forEach((element) => {
      let paRRN = element.innerHTML;
      const maskedRrn = paRRN.slice(0, -6) + "******";
      element.innerHTML = maskedRrn;
    });
    let changeToName = document.querySelectorAll("#changeToName");
    let deptName = " ";
    changeToName.forEach((element) => {
      let deptNo = element.innerHTML;
      if (deptNo === "40") {
        deptName = "일반내과";
      } else if (deptNo === "50") {
        deptName = "정신과";
      } else if (deptNo === "60") {
        deptName = "이비인후과";
      } else if (deptNo === "70") {
        deptName = "산부인과";
      }
      element.innerHTML = deptName;
    });

    $("#receipt-table tr").click(function () {
      var checkbox = $(this).find('input[type="checkbox"]');
      checkbox.prop("checked", !checkbox.prop("checked"));
    });
  });
  //처방전,수납서류 출력
  const printPrescription = document.querySelector(".print-btn1");
  const printReceipt = document.querySelector(".print-btn2");

  printPrescription.addEventListener("click", (e) => {
    var prescriptionUrl =
      "${root}/resources/img/receiptionImg/PrescriptionForm.png";
    var prescriptionImage = new Image();
    prescriptionImage.src = prescriptionUrl;

    prescriptionImage.onload = function () {
      var prescriptionWindow = window.open();
      prescriptionWindow.document.write("<html><head><title>처방전</title>");
      prescriptionWindow.document.write(
        "<style>img {width: 100%; height: 100%;}</style>"
      );
      prescriptionWindow.document.write("</head>");
      prescriptionWindow.document.write(
        '<body><img src="' + prescriptionUrl + '"/></body></html>'
      );
      prescriptionWindow.print();
      prescriptionWindow.close();
    };
  });

  printReceipt.addEventListener("click", (e) => {
    var prescriptionUrl = "${root}/resources/img/receiptionImg/receiptForm.png";
    var prescriptionImage = new Image();
    prescriptionImage.src = prescriptionUrl;

    prescriptionImage.onload = function () {
      var prescriptionWindow = window.open();
      prescriptionWindow.document.write("<html><head><title>영수증</title>");
      prescriptionWindow.document.write(
        "<style>img {width: 100%; height: 100%;}</style>"
      );
      prescriptionWindow.document.write("</head>");
      prescriptionWindow.document.write(
        '<body><img src="' + prescriptionUrl + '"/></body></html>'
      );
      prescriptionWindow.print();
      prescriptionWindow.close();
    };
  });

  //수납완료 처리
  const receiptDoneButton = document.querySelector("#receipt-done-btn");
  receiptDoneButton.addEventListener("click", function () {
    // 선택한 행에서 receiptNo 값을 찾습니다.

    let selectedNoArr = new Array();
    $("input:checkbox[name=change]:checked").each(function () {
      selectedNoArr.push(this.value);
    });

    $.ajax({
      url: "changeToReceipt.done",
      type: "post",
      data: { selectedNoArr: selectedNoArr },
      success: function (data) {
        if (data === "success") {
          alert("수납처리완료!!");
          window.location.reload(); // 페이지 리로드
        } else {
          console.log("수납처리실패..!!");
        }
      },
      error: function () {
        console.log("통신 실패");
      },
    });
  });
</script>
