<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
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
                <h1>게시글 수정하기</h1>
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">제목</h5> 
                    <input type="text"  class="form-control" id="floatingInput" value="일요일은 내가 짜파게티 요리사">
                    <h5 class="card-title">작성자 | 작성일</h5> 
                    <input type="text"  class="form-control" id="floatingInput" value="정문애 | 23.05.07">
                    <h5 class="card-title">내용</h5>
                    	<textarea  class="form-control"  id="floatingTextarea2" style="height: 350px">
                    		일요일이 되었습니다. 오늘은 내가 짜파게티 요리사가 되는 날입니다. 배민을 시키면 될일을...
                    		왜 내가 하게 되었을까...
                    		ㅎ
                    	</textarea>
                  </div>
                </div>
                <div class="mt-4">
                    <a href="${root}/board/list" class="btn btn-secondary">목록</a>
                    <a href="${root}/board/edit" class="btn btn-success">수정</a>
                    <a href="#" class="btn btn-danger">삭제</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
