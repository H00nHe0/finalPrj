<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴지통</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
     #content{
    	width: 80%;
    	margin: 30px auto auto auto;
    }
    
    #btn{
    	float: right;
    	margin-right: 20px;
    	margin-bottom: 20px;
    }
    #page-area{
    	text-align: center;
    }
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
                <div id="content">
                	<div id="nav">
                	<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link " aria-current="page" href="${root}/mail/inlist">받은 메일</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link " href="${root}/mail/sendlist">보낸 메일</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" href="${root}/mail/delbox">휴지통</a>
					  </li>
					</ul>
                </div>
					<h2 style="margin-top: 20px;">휴지통</h2>
						<div id="btn">
							<button type="button" class="btn btn-danger" onclick="fDelCheck();">영구삭제</button>
							<button type="button" class="btn btn-success" onclick="location.href='${root}/mail/recover'">복구</button>
						</div>
                    <table class="table table-hover">
                          <thead class="table-success">
                            <tr>
                                <th><input class="form-check-input" type="checkbox" name="allCheck" id="flexCheckDefault"></th>
                                <th></th>
                                <th>제목</th>
                                <th>보낸 사람</th>
                                <th>받는 사람</th>
                                <th>날짜</th>
                                
                            </tr>
                          </thead>  
                          <tbody>
							<c:forEach items="${mvoList}" var="mvo">
								<tr>
									<td><input class="form-check-input" type="checkbox" name="RowCheck" id="flexCheckDefault"></td>
									<td><input type="hidden" name="no" value="${mvo.no}"></td>
									<td>${mvo.title}</td>
									<td>${mvo.writerName}</td>
									<td>${mvo.receiverName}</td>
									<td>${mvo.enrollDate}</td>
								</tr>
							</c:forEach>
                          	
                        </tbody>    
                    </table>
                    <div id="page-area">
						<c:if test="${pv.currentPage > 1}">
							<a class = "btn btn-primary btn-sm" href="${root}/mail/delbox?page=${pv.currentPage-1}">이전</a>
						</c:if>
						<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class = "btn btn-primary btn-sm" href="${root}/mail/delbox?page=${i}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class = "btn btn-secondary btn-sm">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pv.currentPage < pv.maxPage}">
							<a class = "btn btn-primary btn-sm" href="${root}/mail/delbox?page=${pv.currentPage+1}">다음</a>
						</c:if>
					</div>

            </div>
        </div>
    </div>

</body>
</html>
<script>
        const arr = document.querySelectorAll("input[type=checkbox]");
        arr[0].addEventListener("click",(event)=>{
            const status = event.target.checked;
            for (let temp of arr) {
                temp.checked = status;
            }
            
            
        });

		//선택삭제
		function fDelCheck() {
		var url = "${root}/mail/chkDel"; //controller로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0; i < list.length; i++) {
		if(list[i].checked){ // 선택되어 있으면 배열에 값을 저장함
		valueArr.push(list[i].value);
		}
		}
		if(valueArr.length == 0){
		alert("선택된 글이 없습니다.");
		} 
		else{
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
		url: url, 	//전송 URL
		type : 'POST',	//POST 방식
		traditional: true,
		data : {
		valueArr : valueArr	//보내고자 하는 data 변수 설정
		},
		success: function (data){
		if (data = 1) {
			alert (" 삭제 성공");
			location.replace("list")
		}
		else{
			alert("삭제 실패");
		}
		}
		});
	}

	}
    </script>