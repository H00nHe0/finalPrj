<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
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
                <h1>공지사항 상세보기</h1>
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">제목</h5> 
                    <input type="text" readonly class="form-control" id="floatingInput" value="5월 5일 어린이날 근무 안내 ">
                    <h5 class="card-title">작성일</h5> 
                    <input type="text" readonly class="form-control" id="floatingInput" value="23.04.20">
                    <h5 class="card-title">내용</h5>
                    	<textarea readonly class="form-control"  id="floatingTextarea2" style="height: 350px">
                    		5월 5일 어린이날에는 근무가 없습니다. 쉽시다. 
                    		아 물론 당직인 분들은 일해야됨. 응급상황대응을 위해 대기하세여
                    	</textarea>
                  </div>
                </div>
                <div class="mt-4">
                    <a href="${root}/notice/list" class="btn btn-secondary">목록</a>
                    <a href="${root}/notice/edit" class="btn btn-success">수정</a>
                    <a href="#" class="btn btn-danger">삭제</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
