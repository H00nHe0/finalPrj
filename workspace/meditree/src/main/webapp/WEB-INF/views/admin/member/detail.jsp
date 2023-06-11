<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
  <style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap');
    body h1{
      font-family: 'IBM Plex Sans KR', sans-serif;
    }
    
    .table-light tr>th, td {
       text-align: center;
    }

    .htitle {
      width: 300px;
      height: 100px;
      margin: auto;  
      padding-top: 10px;
      text-align: center; 
    }
    .shadow {
      width: 90%;
      height: 600px;
      margin: auto;
      margin-top: 40px;
    }
    
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
    #board{
        align-items: center;
        justify-content: center;
        background-color: #f3f3f4;
    }
    #search-area{
        display: flex;
        justify-content: center;
        margin-bottom: -30px;
    }
    #resist-btn{
        float: right;
        margin-bottom: 20px;
    }
    #page-area{
       text-align: center;
       padding-top: 20px;
    }
    .table-area{
    	display: flex;
        justify-content: center;
    }
    .table-bordered{
        justify-content: center;
    	text-align: center;
    	width: 60%;
    	margin-left: 20%;
    }
    #quit-btn {
    	float: right;
   		margin-right: 280px;
    }
    #edit-btn {
    	margin-left: 1010px;
    }
    #back-btn {
    	margin-left: 1080px;
    	margin-top: 20px;
    }
    .profile-area{
    	vertical-align: middle;
    }


    
  </style>
</head>
<body>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
            
	            <form action="${root}/admin/member/quit" method="post">
	               <div class="shadow p-3 mb-5 bg-body rounded">
	               		<div class="htitle">
	               			<h1>직원조회</h1>
	               		</div>
                        
	               		<table class="table table-bordered" id="personal">
	               			<tr>
							  <th class="profile-area">프로필</th>
							  <td><div id="preview-area"> </div></td>
							</tr>
							<tr>
							  <th>사원번호</th>
							  <td>${vo.no}</td>
							</tr>
							<tr>
							  <th>이름</th>
							  <td>${vo.name}</td>
							</tr>
							<tr>
							  <th>소속과</th>
							  <td>${vo.title}</td>
							</tr>
							<tr>
							  <th>직급</th>
							  <td>${vo.potitle}</td>
							</tr>
							<tr>
							  <th>연락처</th>
							  <td>${vo.tel}</td>
							</tr>
							<tr>
							  <th>이메일</th>
							  <td>${vo.email}</td>
							</tr>
							

						</table>
						
						<c:if test="${vo.quitYn == 'Y'}">
						    <style>
						        #quit-btn {
						            display: none;
						        }
						        #edit-btn {
						            display: none;
						        }
						    </style>
						</c:if>
			
						<a>
                   		</a>
						<a>
                			<button type="button" id="edit-btn" class="btn btn-secondary btn-sm">수정하기</button>	
                			<button type="button" id="quit-btn" class="btn btn-secondary btn-sm" >퇴사처리</button>	
                			<button type="button" id="back-btn"  onclick="history.back()" class="btn btn-secondary btn-sm">뒤로가기</button>	
                   		</a>
						<a>
                   		</a>

			            
	
	                </div>
	            </form>
            </div>
        </div>
    </div>
  
</body>
</html>

<script>

/* var tdElement = document.querySelector("#personal td:nth-child(1)"); // 첫 번째 <td> 요소 가져오기
var no = tdElement.innerText; // innerText 값 가져오기 */
var no = "${vo.no}";

var button = document.querySelector("#quit-btn"); // 버튼 요소 가져오기

button.addEventListener("click", function() {
	  var link = "/app/admin/member/quit/" + no; // 링크 생성
	  window.location.href = link; // 링크로 이동
	});
var button = document.querySelector("#edit-btn"); // 버튼 요소 가져오기

button.addEventListener("click", function() {
	  var link = "/app/admin/member/edit/" + no; // 링크 생성
	  window.location.href = link; // 링크로 이동
	});
	
//이미지 미리보기
const div = document.querySelector('#preview-area');
let imgTag;
	//이미지 요소 만들기
	imgTag = document.createElement('img');
	imgTag.setAttribute("src" , "${root}/resources/img/member/${vo.profileName}");
	imgTag.setAttribute("alt" , "${vo.profileName}");
	imgTag.setAttribute("width" , "70px");
	imgTag.setAttribute("height" , "70px");
	
	// 이미지 로딩이 완료되면 썸네일처럼 보여주기
	imgTag.addEventListener('load', function() {
	  // 이미지가 로드되면 썸네일처럼 표시할 너비와 높이 설정
	  const thumbnailWidth = 70;
	  const thumbnailHeight = 70;

	  // 이미지의 실제 너비와 높이를 가져옴
	  const imageWidth = imgTag.width;
	  const imageHeight = imgTag.height;

	  // 이미지의 비율을 유지한 채로 썸네일 크기 조정
	  let thumbnailWidthAdjusted, thumbnailHeightAdjusted;
	  if (imageWidth > imageHeight) {
	    thumbnailWidthAdjusted = thumbnailWidth;
	    thumbnailHeightAdjusted = (imageHeight / imageWidth) * thumbnailWidth;
	  } else {
	    thumbnailHeightAdjusted = thumbnailHeight;
	    thumbnailWidthAdjusted = (imageWidth / imageHeight) * thumbnailHeight;
	  }

	  // 썸네일처럼 이미지 크롭 및 중앙 정렬
	  imgTag.setAttribute("width", thumbnailWidthAdjusted + "px");
	  imgTag.setAttribute("height", thumbnailHeightAdjusted + "px");
	  imgTag.style.objectFit = "cover";
	  imgTag.style.objectPosition = "center";

	  // 이미지 요소를 div 안에 추가하기
	  div.appendChild(imgTag);
	});

	// 이미지 로딩 실패 시 대체 텍스트 표시
	imgTag.addEventListener('error', function() {
	  imgTag.setAttribute("alt", "Image not found");
	});

	// 이미지 요소를 div 안에 추가하기 전에 src를 설정
	imgTag.src = "${root}/resources/img/member/${vo.profileName}";


</script>


