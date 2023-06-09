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
    body h1{
      font-family: 'IBM Plex Sans KR', sans-serif;
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
    #search-area{
        display: flex;
        justify-content: center;
        margin-bottom: -30px;
    }
    #resist-btn{
        float: right;
        margin-bottom: 20px;
    }
    #page-area{
       text-align: center;
       padding-top: 20px;
    }
    table{
    	margin-top: 80px;
    }
    #out-btn{
    	float: right;
    	margin-right: 30%;
    	font-weight: 4;
    }


    
  </style>
</head>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
            
	            <form action="${root}/admin/member/list" method="get">
	               <div class="shadow p-3 mb-5 bg-body rounded">
	               		<div class="htitle">
	               			<h1>직원조회</h1>
	               		</div>
                        <div id="search-area">
                        <select name="searchType">
							<option value="name">이름</option>
							<option value="title">소속과</option>
							<option value="potitle">직급</option>
						</select>
                           <input type="text" name="searchValue" value="${searchMap.searchValue}" placeholder="검색할값을 입력하세요">
                           <input type="submit" value="검색하기">
                        </div>
                        <button type="button" id="out-btn" class="btn btn-light btn-md">입사자 보기</button>

                        
	               		<table class="table table-hover">  
	               			<thead class="table-light">
		                    	<tr> 
		                            <th>사원번호</th>
									<th>이름</th>
									<th>상태</th>
									<th>퇴사일</th>
									<th>소속과</th>
									<th>직급</th>
			                    </tr> 
	                  		</thead>
			                <tbody>
			                <c:forEach items="${voList2}" var="vo">
								<tr>
									<td>${vo.no}</td>
									<td>${vo.name}</td>
									<td>${vo.quitStatus}</td>
									<td>${vo.enrollDate}</td>
									<td>${vo.title}</td>
									<td>${vo.potitle}</td>
								</tr>
							</c:forEach>
			                </tbody> 
			             </table>
			             <div id="page-area">
		                     <c:if test="${pv.currentPage > 1}">
		                        <a class = "btn btn-primary btn-sm" href="${root}/admin/member/list2?page=${pv.currentPage-1}">이전</a>
		                     </c:if>
		                     <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
		                     <c:if test="${pv.currentPage != i}">
		                        <a class = "btn btn-primary btn-sm" href="${root}/admin/member/list2?page=${i}">${i}</a>
		                     </c:if>
		                     <c:if test="${pv.currentPage == i}">
		                        <a class = "btn btn-secondary btn-sm">${i}</a>
		                     </c:if>
		                     </c:forEach>
		                     <c:if test="${pv.currentPage < pv.maxPage}">
		                     <a class = "btn btn-primary btn-sm" href="${root}/admin/member/list2?page=${pv.currentPage+1}">다음</a>
		                     </c:if>
		                  </div>
	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>

<script>

	//행 클릭시 , 해당 회원번호로 상세조회 요청 보내기
	const tbody = document.querySelector("tbody");
	tbody.addEventListener('click' , function(event){
		const no = event.target.parentNode.children[0].innerText;
		location.href="${root}/admin/member/one/" + no;
	});

	document.getElementById('out-btn').addEventListener('click', function() {
	    window.location.href = '${root}/admin/member/list';
	});

</script>