<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정하기</title>
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
                <h1>공지사항 수정하기</h1>
                <form action="${root}/notice/edit" method="post" enctype="multipart/form-data">
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">제목</h5> 
                    <input type="text" name="title" class="form-control" id="title" value="${vo.title} ">
                    <h5 class="card-title">내용</h5>
                    	<textarea name="content" class="form-control"  id="content" style="height: 350px">
                    		${vo.content}
                    	</textarea>
                  </div>
                </div>
                <div class="mt-4">
                    <a href="${root}/notice/list" class="btn btn-secondary">목록</a>
                    <c:if test="${loginMember.no =='000000'}">
	                    <a href="${root}/notice/edit" class="btn btn-success">수정</a>
	                    <a href="${root}/notice/delete?num=${vo.no}'" class="btn btn-danger">삭제</a>
                    </c:if>
                </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
