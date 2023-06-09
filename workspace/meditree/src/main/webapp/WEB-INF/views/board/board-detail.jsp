<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

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
 #comment-area {
        width: 100%;
        padding-bottom:15px;
        display: grid;
        grid-template-columns: 8fr 2fr;
        

    }
.comment-line{
	padding-bottom:15px;
	padding-top:15px;
	border-bottom: 1px solid lightgray;
}
.card{
	margin-bottom: 20px;
}
.view-area{display: none;}
.form-area{display: none;}

.active{
    display: block;
}
#delBtn{
	padding-right: 20px;
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
              <h1>게시글 상세보기</h1>
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">제목</h5> 
                  <input type="text" readonly class="form-control" id="title" value="${vo.title}">
                  <h5 class="card-title">작성자 | 작성일</h5> 
                  <input type="text" readonly class="form-control" id="enrollDate" value="${vo.writerName} | ${vo.enrollDate}">
                  <h5 class="card-title">내용</h5>
                  <textarea readonly class="form-control"  id="content" style="height: 350px; text-align:left;">${vo.content}</textarea>
                  
                  <div id="thumbnail-area">
                  <h5>첨부파일</h5>
                    <c:forEach items="${vo.attList}" var="fvo">
                     <a href="${root}/board/att/down?ano=${fvo.no}">${fvo.originName}</a>
                     <br>
                    </c:forEach>
                  </div>
            
                  <div id="comment-header">
                    <h5>댓글</h5>
                        <div class="input-group mb-3" style="margin-top: 15px">
                          <input type="text" name="comment" class="form-control" placeholder="댓글을 작성해 주세요"  aria-describedby="button-addon2">
                          <button onclick="writeComment();" class="btn btn-outline-success" id="button-addon2">등록</button>
                        </div>
                    <div id="comment-area">
                      
                     
                    </div>
                  </div>
              
                  <div class="mt-4">
                            <a href="${root}/board/list" class="btn btn-secondary">목록</a>
                            <c:if test="${loginMember.no == vo.empNo}">
						    	<a href="javascript:void(0);" onclick="toggleActive();" class="btn btn-success">수정</a>
							</c:if>						    	
                            <c:if test="${loginMember.no == '999999' || loginMember.no == vo.empNo}">
						    	<a href="${root}/board/delete?num=${vo.no}" class="btn btn-danger">삭제</a>
							</c:if>

                  </div>
                </div>
              </div>
            </div>  
            <div class="form-area">
              <h1>게시판 수정하기</h1>
                <form action="${root}/board/edit" method="post" enctype="multipart/form-data">
                <div class="card">
                  <div class="card-body">
                    <input type="hidden" name="no" value="${vo.no}">
                    <h5 class="card-title">제목</h5> 
                    <input type="text" name="title" class="form-control" id="title" value="${vo.title} ">
                    <h5 class="card-title">작성자 | 작성일</h5> 
                  <input type="text" readonly class="form-control" id="enrollDate" value="${vo.writerName} | ${vo.enrollDate}">
                    <h5 class="card-title">내용</h5>
                    <textarea name="content" class="form-control"  id="content" style="height: 350px">${vo.content}</textarea>
                 	  <h5>첨부파일</h5>
                 	  <input class="form-control" type="file" name="f" id="formFileMultiple" multiple>
                   		
                     <div id="thumbnail-area">
                      <c:forEach items="${vo.attList}" var="fvo" varStatus="status">
                        <div class="row" style="display: inline;">
                         ${fvo.originName}<a href="javascript:void(0)" onclick="f01(this);">삭제</a>
                          <br>
                        </div>
                      </c:forEach>
                    </div>
                    
						
                    </div>
                  </div>
                <div class="mt-4">
                    <a href="${root}/board/list" class="btn btn-secondary">목록</a>
	                    <button type="submit" class="btn btn-success">수정</button>
                </div>
                </form>
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
  
  function writeComment() {
      //로그인 안되어 있으면 ㄴㄴ
      const writerNo = '${loginMember.no}';
      if(writerNo <= 0 ){
          alert("로그인 후 작성 가능합니다.");
          return;
      }


      //ajax 이용해서 서버에 (댓글내용) 데이터 보내기
      
      const content = document.querySelector("input[name=comment]").value;

      $.ajax({
          url : "${root}/board/reply/write",
          type : 'POST',
          data : {
              'bno' : '${vo.no}',
              'content' : content
          },
          success : function(data){
              if(data == 'ok'){
                  alert("댓글 작성 완료");
                  document.querySelector("input[name=comment]").value = '';
                  loadReply();
              }else if(data == 'unauthor'){
                  alert("로그인 후 작성 가능합니다.");
              }
              else{
                  alert("댓글 작성 실패");
              }
          },
          error : function (){
              alert('댓글 작성 실패');
          }

      })

  }

  //댓글 불러오기
 loadReply();

function loadReply(){

  const commentArea = document.querySelector("#comment-area");
  commentArea.innerHTML = '';
  const writerNo = '${loginMember.no}';

 $.ajax({
    url :  '${root}/board/reply/list' ,
    type : 'GET' ,
    data : {
       'bno' : '${vo.no}'
    },
    dataType : 'json',
    success : function(data){
       console.log(data);

       for(let replyVo of data){

          
          let str = "";
          str += "<div class='comment-line'>";
          str += replyVo.content;
          str += "</div>";
          str += "<div class='comment-line'>";
          str += "<span id='delBtn'>";
              str += replyVo.writerName;
          str += "</span>";
           if(writerNo == replyVo.writerNo || writerNo == 999999){
              str += "<button  class='btn btn-outline-danger btn-sm' onclick = 'deleteReply(" +  replyVo.no +");'>삭제</button>";
           } 
          str += "</div>";
          commentArea.innerHTML += str;
      }

    },
    error : function(error){
       console.log(error);
    }
 });

}

//댓글 삭제 함수
function deleteReply(rno) {

  const result = confirm("삭제하시겠습니까?");
  if (!result) {
      return;
  }

  $.ajax({
      url : "${root}/board/reply/delete?rno=" + rno,
      type : "delete",
     // data : {
      //    'rno' : rno
      //},
      success : function(data){
          alert("삭제완료");
          loadReply();
      },
      error : function(error){
          console.log(error);
          alert("삭제실패");

      } 
  });
}                       
function f01(button) {
    var row = button.parentNode;
    var rows = document.getElementsByClassName("row");
    var index = Array.prototype.indexOf.call(rows, row);
    rows[index].style.display = "none";
  };




</script>