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
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.6/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.6/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.6/index.global.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  
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
      height: 950px;
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
    #calender-area{
    }
    #calendar{
    }
	
    
    
    
  </style>
</head>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
				<form id="tmForm" action="${root}/treat/prescription" method="post">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<div class="htitle">
							<h1>진료</h1>
						</div>
						<input type="hidden" name="no" value="${nowPatient.no}">
						<input type="hidden" name="paNo" value="${nowPatient.paNo}">
						<input type="hidden" name="emNo" value="${loginMember.no}">
						<input type="hidden" name="tmContent" id="tmContent" value="">
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
									<td>${nowPatient.no}</td>
								    <td>${nowPatient.paName}</td>
								    <td>${nowPatient.paGender}</td>
								    <td>${nowPatient.age}</td>
								    <td>${loginMember.name}</td>
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
                    <c:choose>
					  <c:when test="${not empty tmvoList}">
					    <c:forEach items="${tmvoList}" var="tmvo" varStatus="status" end="${3}">
					      <tr>
					        <td>${tmvo.prDate}</td>
					        <td>${tmvo.tmContent}</td>
					        <td>${tmvo.departmentTitle}</td>
					      </tr>
					    </c:forEach>
					  </c:when>
					  <c:otherwise>
					    <tr>
					      <td colspan="6">과거 진료 내역이 없습니다.</td>
					    </tr>
					  </c:otherwise>
					</c:choose>
                  </tbody>
                </table>
              </div>
              <div class="symptom-area">
                <textarea name="prContent" cols="30" rows="6" style="border-radius: 10px; text-align: left;">${nowPatient.symptom}</textarea>
              </div>
              <div id="calender-area">
               	 <!-- <div id='calendar'></div> -->
              </div>
            </div>
            <hr>
              <div id="select-area">
                <div>병명</div>
                <div>
                  <input type="radio" class="form-check-input" name="checkSurgery" value="yes" checked>수술O&nbsp;
                  <input type="radio" class="form-check-input" name="checkSurgery" value="no" >수술X&nbsp;&nbsp;
                </div>
                <div>
                  <input type="radio" class="form-check-input" name="checkHospital" value="yes" checked>입원O&nbsp;
                  <input type="radio" class="form-check-input" name="checkHospital" value="no" >입원X&nbsp;&nbsp;
                </div>
                <div>
                  <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="sickness" id="sickness" required>
                    <option selected>병명을 선택하세요.</option>
                    <option value="감기">감기</option>
                    <option value="담낭염 ">담낭염 </option>
                    <option value="천식">천식</option>
                    <option value="탈장">탈장</option>
                    <option value="심근경색증">심근경색증</option>
                    <option value="고혈압 ">고혈압 </option>
                    <option value="아펜딕시토미">고혈압 </option>
                    <option value="위염">위염</option>
                    <option value="당뇨병 ">당뇨병 </option>
                  </select>
                </div>
                
                <script>
				  function submitForm() {
				    var selectedSickness = document.getElementById("sickness").value;
				    
				    // 선택한 옵션의 값을 변수에 저장
				    
				    // 폼 제출 (Controller로 전달)
				    document.getElementById("tmForm").submit();
				  }
				</script>
                
                <script>
	               	$("#sickness").change(function(){
	               		
	               		console.log($("#sickness>option:selected").text());
	               		console.log($("#sickness>option:selected").val());
	               		
	               		$("#dCode").val(($("#sickness>option:selected").val()));
	               		//$("#saveTmt").attr("disabled", false);
	               	})
	               	
	               	function updateValue() {
					  var checkbox = document.getElementById("operation");
					  var value = checkbox.checked ? "yes" : "no";
					
					  console.log(value);
					}
	               	
	               	$('input[name=checkSurgery]').click(function(){
                		
                		if($('input[name=checkSurgery]:checked').val() == "no"){
                    		$("#chooseSurgery>option").prop('disabled', true);
                    		$("#sCode").prop('disabled', true);
                    		$("#choose").prop('selected', true);
                    		$("#sCode").val("");
                    	}else{
                    		$("#chooseSurgery>option").prop('disabled', false);
                    		$("#sCode").prop('disabled', false);
                    	}
                		
                		//$("#saveTmt").prop('disabled', false);
                	})
                	
                
                	$("#chooseSurgery").change(function(){
                		console.log($("#chooseSurgery>option:selected").text());
                		console.log($("#chooseSurgery>option:selected").val());
                		$("#sCode").val($("#chooseSurgery>option:selected").val());
                	})
	               	
               </script>
                
                
                <div>
                  <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="chooseSurgery" id="chooseSurgery" required>
                    <option selected>수술을 선택하세요.</option>
                    <option value="1">담낭절제술</option>
                    <option value="2">맹장절재수술</option>
                    <option value="3">종양절재수술</option>
                    <option value="4">봉합술</option>
                    <option value="5">결석제거수술</option>
                    <option value="6">판막치환수술</option>
                  </select>
                </div>
                <div></div>
              </div>
            <hr>
            <div id="drug-area">
              <div><h5>투여약</h5></div>
              <button type="button" id="medicine-btn" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#chooseMedicine">약 처방</button>
              <table class="table table-hover"  id="preMed">
                <thead class="table-light">
                  <tr>
                    <th>코드</th>
                    <th>명칭</th>
                    <th>1일 투여횟수</th>
                    <th>총 투여일수</th>
                  </tr>
                </thead>

                <tbody  id="table1">

                </tbody>
              </table>
              <div id="submit-btn">
                <button type="reset" class="btn btn-secondary">초기화</button>
                <button type="submit" class="btn btn-secondary">저장</button>
              </div>
            </div>							
					</div>				
				</form>
	        </div>
        </div>
    </div>
  
			<!-- 약처방 모달모달모달 -->
              <div class="container">
                
                <!-- The Modal -->
                <div class="modal" id="chooseMedicine">
                  <div class="modal-dialog">
                    <div class="modal-content" style="background: white; width: 600px;">
                    
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h3 class="modal-title" style="text-weight:bold;">약 입력</h4>
                        <hr>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>
                      
                      <!-- Modal body -->
                      <div class="modal-body">
                      	<span>약 명칭</span>
                      	<br>
                      	<table id="gg">
                  			<c:forEach var="m" items="${ drvoList }" varStatus="s">
                  				
                  				<c:if test="${ s.index mod 4 eq 0 }">
                  					<tr style="height: 25px;">
                  				</c:if>
                  				
                  				<td><input id="sss" type="checkbox" name="aa" value="${ m.no }"><span>${ m.name }</span></td>
         				
                  				<c:if test="${ s.index mod 4 eq 3 }">
                  					</tr>
                  				</c:if>
                  			</c:forEach>
                      	</table>
                      	<br>
                        <span>총 투여일수</span><br><br>
                        <select name="injectDay" id="injectDay" class="custom-select">
                          <option selected value="0" required>선택</option>
                          <option value="3">3일</option>
                          <option value="4">4일</option>
                          <option value="5">5일</option>
                          <option value="6">6일</option>
                          <option value="7">7일</option>
                          <option value="8">8일</option>
                          <option value="9">9일</option>
                          <option value="10">10일</option>
                        </select>
                      </div>
                      
                      <!-- Modal footer -->
                      <div class="modal-footer">
                      	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-secondary btn-sm" id="saveMed" data-dismiss="modal" style="background: rgb(29, 92, 99); color: white;" disabled>저장</button>
                      </div>
                      
                    </div>
                  </div>
                </div>
                
              </div>
              <!-- 모달 끝 -->  
  
</body>

<script>
$("select[name=injectDay]").click(function(){
		
		if($("#injectDay").val() == 0){
			$("#saveMed").prop("disabled", true);
  	}else{
  		$("#saveMed").prop("disabled", false);
  	}
	})

$("#saveMed").click(function(){
	
	let list = [];
	
	if($("input:checkbox[name=aa]:checked").length != 0){
		$("input:checkbox[name=aa]:checked").each(function(){
			let arr = {medNo : $(this).val(), medName : $(this).next().text(), times : $("select[name=injectDay]").val()};
			list.push(arr);
		})
	}
	$.each(list, function(index, obj){
		var row = '<tr>'
			     		+ '<td>' + '<span name="medNo">' + '<input type="hidden" value="' + obj.medNo + '" name="medNo">' + obj.medNo + '</span>' + '</td>'
			     		+ '<td>' + '<span name="medName">' + '<input type="hidden" value="' + obj.medName + '" name="medName">' + obj.medName + '</span>' + '</td>'
			     		+ '<td>' +  
			     					'<select name="datail[' + index + '].dosetime" class="custom-select" id="preMedList">'
			     				 +    '<option selected value="0">선택</option>'
			     				 +	  '<option value="1">1회</option>'
			     				 +    '<option value="2">2회</option>'
			     				 +    '<option value="3">3회</option>'
		                     +  '</select>'  + '</td>'
			     		+ '<td>' +  '<span name="tiems">' + obj.times + "</span>" + '</td>'
			     	 + '</tr>';
		$("#table1").append(row);
	})
	
	let drug = document.querySelector("#drug").innerHtml;

	$.ajax({
		url: "drugName",
		data:{
			drug : drug
		},
		success:function(){
			console.log("성공");
		},
		error: function(){
			console.log("실패");
		}
	});
	$("#preMedList").change(function(){
  		
  		if($("#preMedList option:selected").val() != 0){
  			alert($("#preMedList option:selected").val());
  			$("#saveTmt").prop("disabled", false);
  		}else{
  			$("#saveTmt").prop("disabled", true);
  		}
  		
		})
		
	})
	console.log(document.querySelector("#drug").innerHtml);
	
</script>

<script>
  function submitForm() {
    var checkSurgery = document.querySelector('input[name="checkSurgery"]:checked').value;
    var checkHospital = document.querySelector('input[name="checkHospital"]:checked').value;
    
    // 선택된 라디오 버튼의 값 변수에 저장
    
    // 폼 제출 (Controller로 전달)
    document.getElementById("tmForm").submit();
  }
</script>

<script>
  // 선택한 옵션 값을 hidden 필드에 설정
  document.getElementById("sickness").addEventListener("change", function() {
    var selectedSickness = this.value;
    document.getElementById("tmContent").value = selectedSickness;
  });
</script>


<script src="${root}/resources/js/index.global.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var calendarEl = document.getElementById("calendar");

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth,timeGridWeek,timeGridDay",
      },
      // initialDate: "2023-01-12",
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function (arg) {
        var title = prompt("일정의 제목을 지정해주세요:");
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
          });
        }
        calendar.unselect();
      },
      eventClick: function (arg) {
        if (confirm("일정을 삭제 하시겠습니까?")) {
          arg.event.remove();
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: "All Day Event",
          start: "2023-01-01",
        },
        {
          title: "전염성 균질 세미나",
          start: "2023-04-28",
          end: "2023-04-30",
        },
        {
          title: "KH주관 등급평가",
          start: "2023-05-01T09:00:00",
          end: "2023-05-01T12:00:00",
        },
        {
          title: "병원장과 점심",
          start: "2023-05-01T13:00:00",
          end: "2023-05-01T14:00:00",
        },
        {
          title: "외과전공의 협회 저녁식사",
          start: "2023-05-04T18:00:00",
          end: "2023-05-04T21:00:00",
        },
        {
          title: "와이프 생일",
          start: "2023-05-07",
        },
        {
          title: "보건복지부 주관 전공의 대상 컨퍼런스",
          start: "2023-05-19T10:30:00",
          end: "2023-05-21T12:30:00",
        },
        {
          title: "Lunch",
          start: "2023-01-12T12:00:00",
        },
        {
          title: "Meeting",
          start: "2023-01-12T14:30:00",
        },
        {
          title: "Happy Hour",
          start: "2023-01-12T17:30:00",
        },
        {
          title: "Dinner",
          start: "2023-01-12T20:00:00",
        },
        {
          title: "Birthday Party",
          start: "2023-01-13T07:00:00",
        },
        {
          title: "Click for Google",
          url: "http://google.com/",
          start: "2023-01-28",
        },
      ],
    });

    calendar.render();
  });
  </script>
</html>


  
  
  
  