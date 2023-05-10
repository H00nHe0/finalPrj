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
                    <input type="text" readonly class="form-control" id="title" value="${vo.title}">
                    <c:if test="${vo.modifyDate == null}">
                    <h5 class="card-title">작성일</h5> 
                    <input type="text" readonly class="form-control" id="enrollDate" value="${vo.enrollDate}">
                    </c:if>
                    <c:if test="${vo.modifyDate != null}">
                    <h5 class="card-title">작성일</h5> 
                    <input type="text" readonly class="form-control" id="nDate" value="${vo.modifyDate}">
                    </c:if>
                    
                    <h5 class="card-title">내용</h5>
                    	<textarea readonly class="form-control"  id="content" style="height: 350px">
                    		${vo.content}
                    	</textarea>
                    <div id="thumbnail-area">
						<ul id="file-list">
    					</ul>
                    </div>
                  </div>
                </div>
            
                <div class="mt-4">
                    <a href="${root}/notice/list" class="btn btn-secondary">목록</a>
                    <c:if test="${loginMember.no =='000000'}">
	                    <a href="${root}/notice/edit" class="btn btn-success">수정</a>
	                    <a href="${root}/notice/delete?num=${vo.no}'" class="btn btn-danger">삭제</a>
                    </c:if>
                </div>
            
            
            </div>
        </div>
    </div>

</body>
</html>
<script>

const div = document.querySelector('#thumbnail-area');

let imgTag;
let aTag;
<c:forEach items = "${nvo.attList}" var="fvo">
    //a태그 만들기
    aTag = document.createElement('a');
    aTag.href = "${root}/notice/att/down?ano=${fvo.no}";
    
    //이미지 요소 만들기
    imgTag = document.createElement('img');
    imgTag.setAttribute("src","${root}/${path}/${fvo.changeName}");
    imgTag.setAttribute("alt","${fvo.originName}");
    imgTag.setAttribute("width",'100px');
    imgTag.setAttribute("height",'100px');
    
    //a태그 내부에 img 추가
    aTag.appendChild(imgTag);
    
    //div 안에 aTag 추가
    div.appendChild(aTag);
    
 	// 파일 목록 추가
    const liTag = document.createElement('li');
    const fileLink = document.createElement('a');
    fileLink.href = "${root}/notice/att/down?ano=${fvo.no}";
    fileLink.innerText = "${fvo.originName}";
    fileLink.addEventListener('click', (event) => {
        event.stopPropagation();
    });
    liTag.appendChild(fileLink);
    fileList.appendChild(liTag);
    
</c:forEach>

</script>

