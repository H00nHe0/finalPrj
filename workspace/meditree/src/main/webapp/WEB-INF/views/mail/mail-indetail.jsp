<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 상세보기</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
    #content{
    	width: 80%;
    	margin: 30px auto auto auto;
    }
    .mt-4{
    	float: right;
    }
    textarea{
    	width:100%;
    	resize: none;
    	text-align: left;
    }
    .card-title{
    	margin-top: 10px;
    }
    
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="content">
                <h1>받은 메일 상세보기</h1>
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">제목</h5> 
                    <input type="hidden" readonly class="form-control" id="floatingInput" value="${vo.no}">
                    <input type="text" readonly class="form-control" id="floatingInput" value="${vo.title}">
                    <h5 class="card-title">보낸사람 | 작성일</h5> 
                    <input type="text" readonly class="form-control" id="floatingInput" value="${vo.writerName} | ${vo.enrollDate}">
                    <h5 class="card-title">내용</h5>
                    <textarea readonly class="form-control"  id="floatingTextarea2" style="height: 350px">${vo.content}</textarea>
                    <div id="thumbnail-area">
                        <h5>첨부파일</h5>
                               <c:forEach items="${vo.attList}" var="fvo">
                                   <a href="${root}/mail/att/down?ano=${fvo.no}">${fvo.originName}</a>
                                   <br>
                               </c:forEach>
                            
                        </div>
                </div>
                </div>
                <div class="mt-4">
                    <a href="${root}/mail/inlist" class="btn btn-secondary">목록</a>
                    <a href="${root}/mail/write" class="btn btn-success">답장</a>
                    <a href="${root}/mail/delete?no=${vo.no}" class="btn btn-danger">삭제</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>