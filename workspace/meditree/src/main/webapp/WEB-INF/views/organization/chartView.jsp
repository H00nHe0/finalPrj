<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      #main {
        display: grid;
        grid-template-columns: 1fr 8fr;
      }
      #board {
        background-color: rgb(211, 211, 211, 0.3);
        width: 100%;
        height: 90%;
        box-sizing: border-box;
      }
      h2 {
        text-align: center;
      }
      /* --- 공통 ---*/
      .wrap11 {
        margin: auto;
        margin-top: 30px;
        width: 90%;
        height: 80%;
        background-color: white;
        border-radius: 20px 20px 20px 20px;
        box-shadow: 3px 3px 3px 3px lightgray;
      }
      .col-4,
      .col-8 {
        height: 90%;
      }

      #att-area {
        padding-bottom: 80px;
        padding-top: 20px;
      }

      body {
        font-family: "IBM Plex Sans KR", sans-serif;
        font-family: "Nanum Gothic", sans-serif;
        font-size: 15px;
      }

      .row {
        height: 100%;
        display: grid;
        grid-template-columns: 1fr 2fr;
      }
      /* 조직도 영역 스타일 */
      .org-wrap {
        margin: auto;
        height: 75%;
        margin-top: 40px;
        padding-bottom: 50px;
        background: rgb(243, 243, 243);
        border-radius: 5px;
      }

      .org-wrap > h4 {
        text-align: center;
        font-size: 20px;
        padding-top: 8px;
      }
      .org-wrap a,
      span {
        color: black !important;
      }
      #chartArea ul {
        display: none;
        margin-left: 10px;
      }

      #chartArea ul.show {
        display: block;
      }
      #chartArea > li {
        font-size: 18px;
        font-weight: 600;
        list-style: none;
        margin-left: 20px;
        cursor: pointer;
      }
      .nav-link {
        color: black;
      }
      #chartArea {
        padding-left: 30px;
      }
      #chartArea * {
        font-size: 1rem;
      }
      #org-chart ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
      }

      #org-chart li {
        cursor: pointer;
        position: relative;
        padding: 0 0 0 1.2em;
        line-height: 2em;
      }

      #org-chart li::before {
        content: "";
        position: absolute;
        top: 0.9em;
        left: -1em;
        height: 100%;
      }

      #org-chart li:first-child::before {
        top: 1.4em;
        height: calc(100% - 1.4em);
      }

      #org-chart .show {
        display: block;
      }

      #org-chart ul ul {
        margin-left: 1em;
        font-weight: 600;
      }

      #org-chart ul ul li::before {
        border-left: none;
      }

      #org-chart {
        max-height: 600px;
        overflow-y: auto;
      }
      #org-chart img {
        width: 25px;
        height: 25px;
        margin-right: 10px;
        margin-bottom: -5px;
      }
      #org-chart li img {
        width: 13px;
        height: 13px;
        margin-bottom: 1px;
      }
      #org-chart #editImg {
        width: 20px;
        height: 20px;
      }
      /* 사원 조회 테이블 스타일 */

      #org-mem hr {
        width: 95%;
      }
      #org-mem > p {
        font-size: 1rem;
      }

      #mem-tb {
        width: 90%;
        margin-left: 35px;
        text-align: center;
        border-collapse: collapse;
      }

      #mem-tb tr {
        height: 50px;
        font-size: 1rem;
      }

      #mem-tb td,
      #mem-tb th {
        vertical-align: middle !important;
        font-size: 1rem;
        border-top: 1px solid lightgray;
        padding-top: 10px;
        padding-bottom: 10px;
      }

      #mem-tb img {
        border-radius: 50%;
        width: 70px;
        height: 70px;
      }

      .jobNo {
        width: 20%;
      }
      .empName {
        width: 15%;
      }

      /* 테이블 내의 아이콘 */
      #mem-tb i {
        font-size: 17px;
      }

      /* 초록 버튼 */
      .green-btn {
        background: RGB(29, 92, 99);
        color: white;
      }
      .green-btn:hover {
        background: #1d5c83;
        color: white;
      }
      /* 작은 버튼 */
      .small-btn {
        width: 70px;
        height: 40px;
        border-style: none;
        border-radius: 7px;
        font-weight: 400;
      }

      #chartArea li ul li {
        font-weight: 300;
      }
      #chartArea > li:nth-of-type(2) > ul > li {
        font-weight: 600;
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="/WEB-INF/views/common/common.jsp" %>

      <div id="main">
        <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
        <div id="board">
          <div class="wrap11" id="att-area">
            <h2><b>조직도 조회</b></h2>
            <hr />
            <br />
            <div class="row">
              <!-- 조직도 영역 (왼쪽) -->
              <div class="col-4">
                <div
                  class="org-wrap"
                  id="org-chart"
                  style="width: 80%; margin-right: 20px"
                >
                  <br />
                  <h4>
                    <b>
                      <img
                        src="${root}/resources/img/orgImg/building.png"
                        alt="병원이미지"
                      />메디병원</b
                    >
                  </h4>
                  <ul id="chartArea">
                    <li>
                      <img
                        id="editImg"
                        src="${root}/resources/img/orgImg/captin.png"
                        alt="병원이미지"
                      />병원장
                    </li>
                    <li>
                      <img
                        src="${root}/resources/img/orgImg/arrows.png"
                        alt="병원이미지"
                      />
                      진료부
                      <ul>
                        <li>
                          <img
                            src="${root}/resources/img/orgImg/arrows.png"
                            alt="병원이미지"
                          />
                          일반외과
                          <ul>
                            <li>111교수</li>
                            <li>222교수</li>
                            <li>333교수</li>
                          </ul>
                        </li>
                        <li>
                          <img
                            src="${root}/resources/img/orgImg/arrows.png"
                            alt="병원이미지"
                          />
                          일반내과
                          <ul>
                            <li>444교수</li>
                            <li>555교수</li>
                          </ul>
                        </li>
                        <li>
                          <img
                            src="${root}/resources/img/orgImg/arrows.png"
                            alt="병원이미지"
                          />
                          정신과
                          <ul>
                            <li>666교수</li>
                            <li>777교수</li>
                          </ul>
                        </li>
                        <li>
                          <img
                            src="${root}/resources/img/orgImg/arrows.png"
                            alt="병원이미지"
                          />
                          이비인후과
                          <ul>
                            <li>코코코교수</li>
                            <li>입입입레지던트</li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li>
                      <img
                        src="${root}/resources/img/orgImg/arrows.png"
                        alt="병원이미지"
                      />
                      간호부
                      <ul>
                        <li>허훈 수간호사</li>
                        <li>김승우 섭간호사</li>
                        <li>후훈 신입간호사</li>
                      </ul>
                    </li>
                    <li>
                      <img
                        src="${root}/resources/img/orgImg/arrows.png"
                        alt="병원이미지"
                      />
                      원무부
                      <ul>
                        <li>허훈 팀장</li>
                        <li>김승우 대리</li>
                        <li>후훈 사원</li>
                      </ul>
                    </li>
                    <li>
                      <img
                        src="${root}/resources/img/orgImg/arrows.png"
                        alt="병원이미지"
                      />
                      경영지원부
                      <ul>
                        <li>울랄라 전무</li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>

              <!-- 부서별 사원 조회 영역 (오른쪽) -->
              <div class="col-8">
                <div
                  class="org-wrap"
                  id="org-mem"
                  style="width: 90%; margin-left: 10px"
                >
                  <h4 style="padding-top: 20px"><b>셀렉한 과</b></h4>
                  <p
                    style="float: right; margin-right: 20px; margin-top: -10px"
                  >
                    총인원 : x 명
                  </p>

                  <hr />
                  <table id="mem-tb" class="table">
                    <tr>
                      <td>
                        <img
                          src="${root}/resources/img/orgImg/terry.jpg"
                          alt="terry"
                        />
                      </td>
                      <td>직함1</td>
                      <td>이름1</td>
                      <td>전화번호1</td>
                    </tr>
                    <tr>
                      <td>
                        <img
                          src="${root}/resources/img/orgImg/sohee.jpg"
                          alt="sohee"
                        />
                      </td>
                      <td>직함2</td>
                      <td>이름2</td>
                      <td>전화번호2</td>
                    </tr>
                    <tr>
                      <td>
                        <img
                          src="${root}/resources/img/orgImg/irin.jpg"
                          alt="irin"
                        />
                      </td>
                      <td>직함3</td>
                      <td>이름3</td>
                      <td>전화번호3</td>
                    </tr>
                    <tr>
                      <td>
                        <img
                          src="${root}/resources/img/orgImg/yubi.jpg"
                          alt="yubi"
                        />
                      </td>
                      <td>직함4</td>
                      <td>이름4</td>
                      <td>전화번호4</td>
                    </tr>
                  </table>
                  <br /><br />
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
  const orgChart = document.querySelector("#chartArea");

  orgChart.addEventListener("click", function (event) {
    const target = event.target;
    if (target.tagName === "LI") {
      const sublist = target.querySelector("ul");
      if (sublist) {
        sublist.classList.toggle("show");
      }
    }
  });
</script>
