<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일보관함</title>
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
					    <a class="nav-link active" aria-current="page" href="${root}/mail/inlist">받은 메일</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${root}/mail/sendlist">보낸 메일</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link " href="${root}/mail/delete">휴지통</a>
					  </li>
					</ul>
                </div>
					<h2 style="margin-top: 20px;">받은 메일</h2>
						<div id="btn">
						  <button type="button" class="btn btn-danger" onclick="location.href='${root}/mail/delete'">휴지통</button>
						  <button type="button" class="btn btn-success" onclick="location.href='${root}/mail/write'">메일 작성</button>
						</div>
                    <table class="table table-hover">
                          <thead class="table-success">
                          
                            <tr>
                                <th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
                                <th>보낸사람</th>
                                <th>제목</th>
                                <th>날짜</th>
                                
                            </tr>
                          </thead>  
                          <tbody>
							<c:forEach items="${mvoList}" var="mvo">
	                          	<tr>
	                          		<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
	                          		<td>${mvo.writerName}</td>
	                          		<td>${mvo.title}</td>
	                          		<td>${mvo.enrollDate}</td>
	                          	</tr>
                          	</c:forEach>
                        </tbody>    
                    </table>
                    <div id="page-area">
                   
						<c:if test="${pv.currentPage > 1}">
							<a class = "btn btn-primary btn-sm" href="${root}/mail/inlist?page=${pv.currentPage-1}">이전</a>
						</c:if>
						<c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
							<c:if test="${pv.currentPage != i}">
								<a class = "btn btn-primary btn-sm" href="${root}/mail/inlist?page=${i}">${i}</a>
							</c:if>
							<c:if test="${pv.currentPage == i}">
								<a class = "btn btn-secondary btn-sm">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pv.currentPage < pv.maxPage}">
							<a class = "btn btn-primary btn-sm" href="${root}/mail/inlist?page=${pv.currentPage+1}">다음</a>
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
    </script>