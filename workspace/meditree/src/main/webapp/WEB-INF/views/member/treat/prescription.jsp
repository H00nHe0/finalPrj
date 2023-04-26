<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap');
    body h1 , h5{
      font-family: 'IBM Plex Sans KR', sans-serif;
      text-align: center;
    }
    
    .table-light tr>th, td {
       text-align: center;
    }

    .htitle {
      width: 300px;
      height: 100px;
      margin: auto;  
      padding-top: 10px; 
      text-align: center;
    }
    .shadow {
      width: 90%;
      height: 900px;
      margin: auto;
      margin-top: 40px;
    }
    
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
    #board{
        align-items: center;
        justify-content: center;
        background-color: #f3f3f4;
    }
    .grid-area{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        grid-template-rows: 1fr 6fr;
    }
    .symptom-area{
      display: flex;
      align-items: center;
      justify-content: center;
    }
    #select-area{
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      grid-template-rows: 1fr 1fr;
    }
    #medicine-btn{
      margin-bottom: 15px;
      float: right;
    }
    #submit-btn {
      float: right;
    }
    textarea {
      resize: none;
    }

    


    
  </style>
</head>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
				<form action="">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<div class="htitle">
							<h1>진료</h1>
						</div>
						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th>차트번호</th>   
							        <th>이름</th>
							        <th>성별</th>
							        <th>나이</th>
							        <th>담당교수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>000001</td>
								    <td>김승우</td>
								    <td>남</td>
								    <td>26</td>
								    <td>김강토</td>
								</tr>
							</tbody>
						</table>
						
						<div class="grid-area">
              <div><h5>과거내역조회</h5></div>
              <div><h5>증상</h5></div>
              <div><h5>달력</h5></div>
              <div>
                <table class="table" id="history-list">
                  <thead class="table-light">
                    <tr>
                      <th>내원일</th>   
                      <th>병명</th>
                      <th>진료과</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>2021/01/23</td>
                      <td>화상</td>
                      <td>피부과</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="symptom-area">
                <textarea name="" cols="30" rows="6" style="border-radius: 10px;"></textarea>
              </div>
              <div>
                달력을 넣을것임
              </div>
            </div>
            <hr>
              <div id="select-area">
                <div>병명</div>
                <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox" role="switch" id="operation">
                  <label class="form-check-label" for="flexSwitchCheckDefault">수술여부</label>
                </div>
                <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox" role="switch" id="hospitalization">
                  <label class="form-check-label" for="flexSwitchCheckDefault">입원여부</label>
                </div>
                <div>
                  <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option selected>병명을 선택하세요.</option>
                    <option value="1">화상</option>
                    <option value="2">탈장</option>
                    <option value="3">장염</option>
                  </select>
                </div>
                <div>
                  <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option selected>수술을 선택하세요.</option>
                    <option value="1">절개술</option>
                    <option value="2">봉합술</option>
                    <option value="3">이식술</option>
                  </select>
                </div>
                <div></div>
              </div>
            <hr>
            <div id="drug-area">
              <div><h5>투여약</h5></div>
              <button type="button" id="medicine-btn" class="btn btn-secondary btn-sm">약 처방</button>
              <table class="table table-hover">
                <thead class="table-light">
                  <tr>
                    <th>코드</th>
                    <th>명칭</th>
                    <th>1일 투여횟수</th>
                    <th>총 투여일수</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                    <td>001</td>
                    <td>apatoxin4869</td>
                    <td>3</td>
                    <td>3</td>
                  </tr>
                  <tr>
                    <td>002</td>
                    <td>ganadara</td>
                    <td>3</td>
                    <td>5</td>
                  </tr>
                  <tr>
                    <td>003</td>
                    <td>baeapa</td>
                    <td>2</td>
                    <td>2</td>
                  </tr>
                </tbody>
              </table>
              <div id="submit-btn">
                <button type="button" class="btn btn-secondary">초기화</button>
                <button type="button" class="btn btn-secondary">저장</button>
              </div>
            </div>							
					</div>				
				</form>
	        </div>
        </div>
    </div>
  
</body>
</html>
  
  
  
  