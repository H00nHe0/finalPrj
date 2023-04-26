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
      .print-btn {
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

              <table>
                <tr id="btn-wrap">
                  <td colspan="2">
                    <button type="button" class="head-btn">수납대기</button>
                  </td>
                  <td colspan="2">
                    <button type="button" class="head-btn">수납완료</button>
                  </td>
                  <td colspan="5">
                    <button type="button" class="head-btn">수납처리</button>
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
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>265</td>
                  <td>저그</td>
                  <td>남</td>
                  <td>111111-1******</td>
                  <td>흉부외과</td>
                  <td>해처리</td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>259</td>
                  <td>테란</td>
                  <td>여</td>
                  <td>222222-2******</td>
                  <td>정신과</td>
                  <td>커맨드</td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>250</td>
                  <td>프로토스</td>
                  <td>중성</td>
                  <td>333333-3******</td>
                  <td>통증의학과</td>
                  <td>넥서스</td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>265</td>
                  <td>저그</td>
                  <td>남</td>
                  <td>111111-1******</td>
                  <td>흉부외과</td>
                  <td>해처리</td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>259</td>
                  <td>테란</td>
                  <td>여</td>
                  <td>222222-2******</td>
                  <td>정신과</td>
                  <td>커맨드</td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                  <td>
                    <button type="button" class="print-btn">출력</button>
                  </td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>250</td>
                  <td>프로토스</td>
                  <td>중성</td>
                  <td>333333-3******</td>
                  <td>통증의학과</td>
                  <td>넥서스</td>
                  <td><button class="print-btn">출력</button></td>
                  <td><button class="print-btn">출력</button></td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>265</td>
                  <td>저그</td>
                  <td>남</td>
                  <td>111111-1******</td>
                  <td>흉부외과</td>
                  <td>해처리</td>
                  <td><button class="print-btn">출력</button></td>
                  <td><button class="print-btn">출력</button></td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>259</td>
                  <td>테란</td>
                  <td>여</td>
                  <td>222222-2******</td>
                  <td>정신과</td>
                  <td>커맨드</td>
                  <td><button class="print-btn">출력</button></td>
                  <td><button class="print-btn">출력</button></td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>250</td>
                  <td>프로토스</td>
                  <td>중성</td>
                  <td>333333-3******</td>
                  <td>통증의학과</td>
                  <td>넥서스</td>
                  <td><button class="print-btn">출력</button></td>
                  <td><button class="print-btn">출력</button></td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>259</td>
                  <td>테란</td>
                  <td>여</td>
                  <td>222222-2******</td>
                  <td>정신과</td>
                  <td>커맨드</td>
                  <td><button class="print-btn">출력</button></td>
                  <td><button class="print-btn">출력</button></td>
                </tr>
              </table>
              <div id="page-area">이전 1 2 3 4 5 다음</div>
              <!-- <div id="page-area">
                <c:if test="${pv.currentPage > 1}">
                  <a
                    class="btn btn-primary btn-sm"
                    href="${root}/notice/list?page=${pv.currentPage-1}"
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
                      class="btn btn-primary btn-sm"
                      href="${root}/notice/list?page=${i}"
                      >${i}</a
                    >
                  </c:if>
                  <c:if test="${pv.currentPage == i}">
                    <a class="btn btn-secondary btn-sm">${i}</a>
                  </c:if>
                </c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage}">
                  <a
                    class="btn btn-primary btn-sm"
                    href="${root}/notice/list?page=${pv.currentPage+1}"
                    >다음</a
                  >
                </c:if>
              </div> -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
