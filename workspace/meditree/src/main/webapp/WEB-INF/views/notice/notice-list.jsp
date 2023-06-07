<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
    #content button {
    	float: right;
    }
    table{
    	margin-top: 20px; 
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
					<h2>공지사항</h2>
                    <table class="table table-hover">
                          <thead class="table-success">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>날짜</th>
                                <th>조회수</th>
                            </tr>
                          </thead>  
                          <tbody>
                          	<c:forEach items="${nvoList}" var="nvo">
	                          	<tr>
	                          		<td>${nvo.no}</td>
			                        <td>${nvo.title}</td>
			                        <td>${nvo.enrollDate}</td>
			                        <td>${nvo.hit}</td>
	                          	</tr>
                          	</c:forEach>
                        </tbody>    
                    </table>
                    <div id="page-area">
						<c:if test="${pv.currentPage > 1}">
							<a class = "btn btn-primary btn-sm" href="${root}/notice/list?page=${pv.currentPage-1}">이전</a>
						</c:if>
						<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class = "btn btn-primary btn-sm" href="${root}/notice/list?page=${i}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class = "btn btn-secondary btn-sm">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pv.currentPage < pv.maxPage}">
							<a class = "btn btn-primary btn-sm" href="${root}/notice/list?page=${pv.currentPage+1}">다음</a>
						</c:if>
					</div>
					<c:if test="${loginMember.no =='999999'}">
                    <button type="button" class="btn btn-success" onclick="location.href='${root}/notice/write'">작성하기</button>
					</c:if>
            </div>
        </div>
    </div>

</body>
</html>
<script>

    const table = document.querySelector("table tbody");
    table.addEventListener("click",(event)=>{
       const num = event.target.parentNode.children[0].innerText; 
       location.href = '${root}/notice/detail?num=' + num;
    });

</script>