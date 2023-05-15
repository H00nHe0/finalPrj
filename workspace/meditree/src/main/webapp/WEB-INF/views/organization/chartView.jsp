<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        font-size: 1.2rem;
        font-weight: bold;
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
      img #king {
        min-width: 170px;
        min-height: 170px;
        width: 200px;
        height: 200px;
      }

      #chartArea li ul li {
        font-weight: 300;
      }
      #chartArea > li:nth-of-type(2) > ul > li {
        font-weight: 600;
      }
      .col-4 a {
        text-decoration: none;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                          <a id="selectSurgery">일반외과</a>
                          <ul>
                            <c:forEach items="${mvoList}" var="mvo">
                              <li>${mvo.name}</li>
                            </c:forEach>
                          </ul>
                        </li>
                        <li>
                          <img
                            src="${root}/resources/img/orgImg/arrows.png"
                            alt="병원이미지"
                          />
                          <a id="generalMedicine">일반내과</a>
                          <c:forEach items="${mvoList}" var="mvo">
                            <li>${mvo.name}</li>
                          </c:forEach>
                        </li>
                        <li>
                          <img
                            src="${root}/resources/img/orgImg/arrows.png"
                            alt="병원이미지"
                          />
                          <a id="psychiatry">정신과</a>
                          <c:forEach items="${mvoList}" var="mvo">
                            <li>${mvo.name}</li>
                          </c:forEach>
                        </li>
                        <li>
                          <img
                            src="${root}/resources/img/orgImg/arrows.png"
                            alt="병원이미지"
                          />
                          <a id="ent">이비인후과</a>
                          <c:forEach items="${mvoList}" var="mvo">
                            <li>${mvo.name}</li>
                          </c:forEach>
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
                  <c:if test="${not empty mvoList}">
                    <h4 style="padding-top: 20px">
                      <b id="setMajor">${mvoList.major}</b>
                    </h4>

                    <p
                      style="
                        float: right;
                        margin-right: 20px;
                        margin-top: -10px;
                      "
                    >
                      총인원 : ${fn:length(mvoList)} 명
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
                        <td id="setTitle"></td>
                        <td id="setName"></td>
                        <td id="setTel"></td>
                      </tr>
                      <tr>
                        <td>
                          <img
                            src="${root}/resources/img/orgImg/terry.jpg"
                            alt="terry"
                          />
                        </td>
                        <td id="setTitle1"></td>
                        <td id="setName1"></td>
                        <td id="setTel1"></td>
                      </tr>
                    </table>
                  </c:if>

                  <c:if test="${empty mvoList}">
                    <h4 style="padding-top: 20px">
                      <b id="setMajor">관리자</b>
                    </h4>

                    <p
                      style="
                        float: right;
                        margin-right: 20px;
                        margin-top: -10px;
                      "
                    >
                      화이팅
                    </p>
                    <hr />
                    <table id="mem-tb" class="table">
                      <tr style="height: 200px">
                        <td>
                          <img
                            id="king"
                            src="${root}/resources/img/orgImg/manager.jpg"
                            alt="kin1"
                          />
                        </td>
                        <td>대통령</td>
                        <td>윤석열</td>
                        <td>010-4738-7265</td>
                      </tr>
                    </table>
                  </c:if>

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

  $("#selectSurgery").click(function (event) {
    const major = document.querySelector("a[id = selectSurgery]").innerHTML;

    $.ajax({
      url: "/app/organization/surgery",
      type: "post",
      data: {
        major: major,
      },
      success: function (data) {
        console.log("통신성공");
        const obj = JSON.parse(data);
        console.log(obj);
        //innerHTML
        const setTitle = document.querySelector("#setTitle");
        setTitle.innerHTML = obj[0].title;
        // console.log(obj[].title);
        const setName = document.querySelector("#setName");
        setName.innerHTML = obj[0].name;
        const setTel = document.querySelector("#setTel");
        setTel.innerHTML = obj[0].tel;
        const setMajor = document.querySelector("#setMajor");
        setMajor.innerHTML = obj[0].major;

        const setTitle1 = document.querySelector("#setTitle1");
        setTitle1.innerHTML = obj[1].title;

        const setName1 = document.querySelector("#setName1");
        setName1.innerHTML = obj[1].name;
        const setTel1 = document.querySelector("#setTel1");
        setTel1.innerHTML = obj[1].tel;
      },
      error: function (x) {
        console.log("통신실패..");
      },
    });
  });

  $("#generalMedicine").click(function (event) {
    const major = document.querySelector("a[id = generalMedicine]").innerHTML;

    $.ajax({
      url: "/app/organization/generalMedicine",
      type: "post",
      data: {
        major: major,
      },
      success: function (data) {
        console.log("통신성공");
        const obj = JSON.parse(data);
        console.log(obj);
        //innerHTML
        const setTitle = document.querySelector("#setTitle");
        setTitle.innerHTML = obj[0].title;
        // console.log(obj[].title);
        const setName = document.querySelector("#setName");
        setName.innerHTML = obj[0].name;
        const setTel = document.querySelector("#setTel");
        setTel.innerHTML = obj[0].tel;
        const setMajor = document.querySelector("#setMajor");
        setMajor.innerHTML = obj[0].major;
        const setTitle1 = document.querySelector("#setTitle1");
        setTitle1.innerHTML = obj[1].title;

        const setName1 = document.querySelector("#setName1");
        setName1.innerHTML = obj[1].name;
        const setTel1 = document.querySelector("#setTel1");
        setTel1.innerHTML = obj[1].tel;
      },
      error: function (x) {
        console.log("통신실패..");
      },
    });
  });
  $("#psychiatry").click(function (event) {
    const major = document.querySelector("a[id = psychiatry]").innerHTML;

    $.ajax({
      url: "/app/organization/psychiatry",
      type: "post",
      data: {
        major: major,
      },
      success: function (data) {
        console.log("통신성공");
        const obj = JSON.parse(data);
        console.log(obj);
        //innerHTML
        const setTitle = document.querySelector("#setTitle");
        setTitle.innerHTML = obj[0].title;
        // console.log(obj[].title);
        const setName = document.querySelector("#setName");
        setName.innerHTML = obj[0].name;
        const setTel = document.querySelector("#setTel");
        setTel.innerHTML = obj[0].tel;
        const setMajor = document.querySelector("#setMajor");
        setMajor.innerHTML = obj[0].major;
        const setTitle1 = document.querySelector("#setTitle1");
        setTitle1.innerHTML = obj[1].title;

        const setName1 = document.querySelector("#setName1");
        setName1.innerHTML = obj[1].name;
        const setTel1 = document.querySelector("#setTel1");
        setTel1.innerHTML = obj[1].tel;
      },
      error: function (x) {
        console.log("통신실패..");
      },
    });
  });
  $("#ent").click(function (event) {
    const major = document.querySelector("a[id = ent]").innerHTML;

    $.ajax({
      url: "/app/organization/ent",
      type: "post",
      data: {
        major: major,
      },
      success: function (data) {
        console.log("통신성공");
        const obj = JSON.parse(data);
        console.log(obj);
        //innerHTML
        const setTitle = document.querySelector("#setTitle");
        setTitle.innerHTML = obj[0].title;
        // console.log(obj[].title);
        const setName = document.querySelector("#setName");
        setName.innerHTML = obj[0].name;
        const setTel = document.querySelector("#setTel");
        setTel.innerHTML = obj[0].tel;
        const setMajor = document.querySelector("#setMajor");
        setMajor.innerHTML = obj[0].major;
        const setTitle1 = document.querySelector("#setTitle1");
        setTitle1.innerHTML = obj[1].title;

        const setName1 = document.querySelector("#setName1");
        setName1.innerHTML = obj[1].name;
        const setTel1 = document.querySelector("#setTel1");
        setTel1.innerHTML = obj[1].tel;
      },
      error: function (x) {
        console.log("통신실패..");
      },
    });
  });
</script>
