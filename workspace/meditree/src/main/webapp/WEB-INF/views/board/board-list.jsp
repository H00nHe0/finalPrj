<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사내게시판</title>
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
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
                <div id="content">
                    <h2>사내게시판</h2>
                    <table class="table table-striped">
                          <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                                <th>조회수</th>
                            </tr>
                          </thead>  
                          <tbody>
                          	<tr>
                          		<td>1</td>
                          		<td>제목1</td>
                          		<td>user1</td>
                          		<td>23.04.25</td>
                          		<td>5</td>
                          	</tr>
                          	<tr>
                          		<td>1</td>
                          		<td>제목1</td>
                          		<td>user1</td>
                          		<td>23.04.25</td>
                          		<td>5</td>
                          	</tr>
                          	<tr>
                          		<td>1</td>
                          		<td>제목1</td>
                          		<td>user1</td>
                          		<td>23.04.25</td>
                          		<td>5</td>
                          	</tr>
                          	<tr>
                          		<td>1</td>
                          		<td>제목1</td>
                          		<td>user1</td>
                          		<td>23.04.25</td>
                          		<td>5</td>
                          	</tr>
                          	<tr>
                          		<td>1</td>
                          		<td>제목1</td>
                          		<td>user1</td>
                          		<td>23.04.25</td>
                          		<td>5</td>
                          	</tr>
                          	<tr>
                          		<td>1</td>
                          		<td>제목1</td>
                          		<td>user1</td>
                          		<td>23.04.25</td>
                          		<td>5</td>
                          	</tr>
                          	<tr>
                          		<td>1</td>
                          		<td>제목1</td>
                          		<td>user1</td>
                          		<td>23.04.25</td>
                          		<td>5</td>
                          	</tr>
                        </tbody>    
                    </table>
                    <button type="button" class="btn btn-success">작성하기</button>
                </div>
        </div>
    </div>

</body>
</html>

                            <%-- <c:forEach items="${}" var="">
                                <tr>
                                    <td>${}</td>
                                    <td>${}</td>
                                    <td>${}</td>
                                    <td>${}</td>
                                    <td>${}</td>
                                </tr>
                            </c:forEach> --%>

