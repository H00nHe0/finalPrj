<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap')
	;

body h1 {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.table-light tr>th, td {
	text-align: center;
}

.shadow {
	width: 90%;
	height: 600px;
	margin: auto;
	margin-top: 40px;
}

.approve {
	margin-left: 10px;
}

.allApp {
	margin-top: 30px;
	margin-bottom: 30px;
}

#main {
	display: grid;
	grid-template-columns: 1fr 8fr;
}

#board {
	align-items: center;
	justify-content: center;
	background-color: #f3f3f4;
}

.appr-write-btn { /* 일괄결재 버튼 */
	float: right;
	margin-bottom: 20px;
	background: #82CBC4;
	color: white;
	justify-content: center;
	margin-right: 40px;
	border-color: #82CBC4;
}

.appr-write-btn:hover {
	background: #82CBC4;
	color: white;
}
#page-area{
   	text-align: center;
   	padding-top: 20px;
}
</style>
</head>
<body>

	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/common.jsp"%>

		<div id="main">
			<%@ include file="/WEB-INF/views/common/commonSidebar.jsp"%>
			<div id="board">
				<div class="shadow p-3 mb-5 bg-body rounded">
					<br>
					<div class="approve">
						<h2>
							전자결재 | <b>관리자 결재대기 문서함</b>
						</h2>
						<hr>
						<div class="allApp">

							<button type="button" class="btn appr-write-btn"
								onclick="allApprove('allApprove');">결재하기</button>
						</div>

						<table class="table table-hover" id="appr-manage-table">
							<thead class="table-light">
								<tr>
									<!-- <th>선택</th> -->
									<th>넘버</th>
									<th>제목</th>
									<th>기안일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<!-- 결재양식 리스트 조회용 ajax 스크립트 들어가는 자리 -->
							</tbody>
						</table>
					</div>

					<!-- 페이징 처리 -->
						<div id="page-area">
							<c:if test="${pv.currentPage > 1}">
								<a class = "btn btn-primary btn-sm" href="${root}/adminSign/adminList?page=${pv.currentPage-1}">이전</a>
							</c:if>
							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class = "btn btn-primary btn-sm" href="${root}/adminSign/adminList?page=${i}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class = "btn btn-secondary btn-sm">${i}</a>
							</c:if>
							</c:forEach>
							<c:if test="${pv.currentPage < pv.maxPage}">
							<a class = "btn btn-primary btn-sm" href="${root}/adminSign/adminList?page=${pv.currentPage+1}">다음</a>
							</c:if>
						</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
 <script>
    // 결재양식 리스트 조회용 ajax함수
    $(document).ready(function() {
        console.log("함수실행");
        $.ajax({
            type: 'get',
            async: false,
            //url: "${root}/adminSign/adminList",
            url: "list",
            success:function(signvoList){
                console.log("결재대기 리스트 조회용 ajax통신 성공");
                console.log(signvoList);
                
                let tableBody = $('#appr-manage-table tbody');
                tableBody.empty(); // 테이블 내용 초기화

                if (signvoList.length > 0) {
                    for (let i = 0; i < signvoList.length; i++) {
                        let row = '<tr>' +
                        	/* '<td>' + '<input type="checkbox" name="form">' + '</td>' + */
                            '<td>' + signvoList[i].no + '</td>' +
                            '<td>' + signvoList[i].signTitle + '</td>' +
                            '<td>' + signvoList[i].enrollDate + '</td>' +
                            '<td>' + signvoList[i].status + '</td>' +
                            '</tr>';
                        tableBody.append(row);
                    }
                } else {
                    let emptyRow = '<tr>' +
                        '<td colspan="3" align="center">결재대기 문서가 없습니다.</td>' +
                        '</tr>';
                    tableBody.append(emptyRow);
                }
            },
            error:function(){
                console.log("결재대기 리스트 조회용 ajax통신 실패");
                
            }
        });
    });
    
  // 기안문서 상세페이지 조회하기
  const table = document.querySelector("#appr-manage-table tbody");
    	table.addEventListener("click",(event)=>{
        const num = event.target.parentNode.children[0].innerText; 
        location.href = '${root}/mySign/signDetail?num=' + num; 
  }); 
</script>

