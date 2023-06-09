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
    .view-area{display: none;}
    .form-area{display: none;}

    .active{
        display: block;
    }
    .noVisible {
    display: none;
  }
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="content">
                   <div class="view-area active">
                <h1>공지사항 상세보기</h1>
                <div class="card">
                  <div class="card-body">
                    <h5 class="card-title">제목</h5> 
                    <input type="text" readonly class="form-control" id="title" value="${vo.title}">
                    <c:if test="${vo.modifyDate == null}">
                    <h5 class="card-title">작성일</h5> 
                    <input type="text" readonly class="form-control" id="enrollDate" value="${vo.enrollDate}">
                    </c:if>
                    <c:if test="${vo.modifyDate != null}">
                    <h5 class="card-title">작성일</h5> 
                    <input type="text" readonly class="form-control" id="modifyDate" value="${vo.modifyDate}">
                    </c:if>
                    
                    <h5 class="card-title">내용</h5>
                    	<textarea readonly class="form-control"  id="content" style="height: 350px">${vo.content}</textarea>
                    <div id="thumbnail-area">
                    <h5>첨부파일</h5>
                   		<c:forEach items="${vo.attList}" var="fvo">
                   			<a href="${root}/notice/att/down?ano=${fvo.no}">${fvo.originName}</a>
                   			<br>
                   		</c:forEach>
						
                    </div>
                  </div>
                </div>
                <div class="mt-4">
                    <a href="${root}/notice/list" class="btn btn-secondary">목록</a>
                      <c:if test="${loginMember.no =='999999'}">  
	                    <a href="javascript:void(0);" onclick="toggleActive();" class="btn btn-success">수정</a>
	                    <a href="${root}/notice/delete?num=${vo.no}" class="btn btn-danger">삭제</a>
                      </c:if>  
                </div>
                </div>
            
             <div class="form-area">
	             <h1>공지사항 수정하기</h1>
                <form action="${root}/notice/edit" method="post" enctype="multipart/form-data">
                <div class="card">
                  <div class="card-body">
                  <input type="hidden" name="no" value="${vo.no}">
                    <h5 class="card-title">제목</h5> 
                    <input type="text" name="title" class="form-control" id="title" value="${vo.title} ">
                    <h5 class="card-title">내용</h5>
                    	<textarea name="content" class="form-control"  id="content" style="height: 350px">${vo.content}</textarea>
                 	 <h5>첨부파일</h5>
                 	 <input class="form-control" type="file" name="f" id="formFileMultiple" multiple>
                   		<div id="thumbnail-area">
                   		</div>
                   		<c:forEach items="${vo.attList}" var="fvo" varStatus="status">
                            <div class="row" style="display: inline;">
                                ${fvo.originName}<a href="javascript:void(0)" onclick="f01(this);">삭제</a>
                                 <br>
                               </div>
                   		</c:forEach>
						
                    </div>
                  </div>
                <div class="mt-4">
                    <a href="${root}/notice/list" class="btn btn-secondary">목록</a>
	                    <button type="submit" class="btn btn-success">수정</button>
                </div>
                </form>
                </div>
            </div>
            </div>
        </div>
    </div>

</body>
</html>
<script>
    //수정하기 버튼 클릭 시 동작하는 내용
    function toggleActive(){
        const viewArea = document.querySelector(".view-area");
        const formArea = document.querySelector(".form-area");

        viewArea.classList.remove('active');
        formArea.classList.add('active');

        
    }

    function f01(button) {
    var row = button.parentNode;
    var rows = document.getElementsByClassName("row");
    var index = Array.prototype.indexOf.call(rows, row);
    rows[index].style.display = "none";
  };
</script>