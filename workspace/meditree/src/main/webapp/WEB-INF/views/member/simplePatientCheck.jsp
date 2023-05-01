<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body{
            width: 700px;
            height: 800px;
        }

      #board {
        width: 100%;
        height: 100%;
        box-sizing: border-box;
      }
      #simple-patient-check-form {
        margin: auto;
        margin-top: 20px;
        width: 80%;
        height: 90%;
        box-sizing: border-box;
        border-radius: 10px 10px 10px 10px;
        scale: 0.99;
      }

      #simple-patient-check-form:hover {
        box-shadow: 0 4px 30px rgba(130, 203, 196, 0.5);
      }

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
      tr:hover:not(:nth-child(1)){
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
    transition-delay: calc(var(--index) * .05s);
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
      #page-area{
        cursor: pointer;
        padding-bottom: 20px;
      }

    </style>
  </head>
  <body>

        <div id="board">
          <div id="simple-patient-check-form">
            <div>
              <div id="title">
                <h2>환자 조회</h2>
              </div>
                    <form action="#" method="post">
                        <div class="wave-group">
                            <input required="" type="text" class="input">
                            <span class="bar"></span>
                            <label class="label">
                            <span class="label-char" style="--index: 0">환</span>
                            <span class="label-char" style="--index: 1">자</span>
                            &nbsp;
                            <span class="label-char" style="--index: 2">이</span>
                            <span class="label-char" style="--index: 3">름</span>
                            </label>
                        </div>
                    </form>

                    <table id="simpleTable">
                        <tr id="tabletitle">
                        <th>선택</th>
                        <th>이름</th>
                        <th>주민등록번호</th>
                        </tr>
                        <tr>
                        <td><input type="checkbox" /></td>
                        <td>가나다</td>
                        <td>111111-1******</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>마바사</td>
                            <td>111111-1******</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>아자차</td>
                            <td>111111-1******</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>카타파</td>
                            <td>111111-1******</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" /></td>
                            <td>하가나</td>
                            <td>111111-1******</td>
                        </tr>
                    </table>
              <div id="page-area">이전 1 2 3 4 5 다음</div>
              <button type="button">환자 선택완료</button>
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
<script>
$(document).ready(function() {
  $('#simpleTable tr').click(function() {
    var checkbox = $(this).find('input[type="checkbox"]');
    checkbox.prop("checked", !checkbox.prop("checked"));
  });
});
    </script>
