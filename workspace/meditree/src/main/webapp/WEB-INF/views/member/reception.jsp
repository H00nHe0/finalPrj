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
        width: 60%;
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

      button:hover {
        background-color: rgba(130, 203, 196, 0.8);
      }
      .seperate-line {
        border-bottom: 1px solid lightgrey;
      }

      #manage-form
        tr:hover:not(:nth-child(1)):not(:nth-child(2)):not(:nth-child(3)):not(
          :last-child
        ) {
        background-color: rgb(
          211,
          211,
          211,
          0.2
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
          <div id="reception-holder">
            <div class="reception-form">
              <form id="form1" action="#" method="post">
                <table>
                  <th colspan="6">환자접수</th>
                  <tr>
                    <td><h3>인적정보</h3></td>
                    <td></td>
                    <td>
                      <button type="button" class="reception-btn">
                        환자조회
                      </button>
                    </td>
                    <td>
                      <button type="button" class="reception-btn">
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
