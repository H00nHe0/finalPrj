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
        width: 65%;
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
      }
      .sub-title {
        padding-left: 10px;
        padding-top: 10px;
        height: 40px;
        font-size: 20px;
        font-weight: 600;
      }
      form {
        height: 80%;
        overflow: scroll;
        overflow-x: hidden;
      }
      table {
        margin: auto;
        width: 90%;
        height: 80%;
        border-collapse: collapse;
      }
      table td {
        text-align: center;
        height: 60px;
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
      }
      th {
        padding-bottom: 5px;
      }

      form > button {
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
                    <form action="">
                      <table>
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
                        <tbody>
                          <tr>
                            <td>99999</td>
                            <td>허훈</td>
                            <td>남</td>
                            <td>929292-1******</td>
                            <td>일반외과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>10399</td>
                            <td>허훗</td>
                            <td>여</td>
                            <td>559292-1******</td>
                            <td>신경외과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                        </tbody>
                      </table>
                    </form>
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
                    <form action="">
                      <table>
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
                        <tbody>
                          <tr>
                            <td>99999</td>
                            <td>허훈</td>
                            <td>남</td>
                            <td>929292-1******</td>
                            <td>일반외과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>10399</td>
                            <td>허훗</td>
                            <td>여</td>
                            <td>559292-1******</td>
                            <td>신경외과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                          <tr>
                            <td>87559</td>
                            <td>허양</td>
                            <td>여</td>
                            <td>948292-2******</td>
                            <td>이비인후과</td>
                            <td><button type="button">예약하기</button></td>
                          </tr>
                        </tbody>
                      </table>
                    </form>
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
