<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
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
      #form-area{
        width: 100%;
    }
    textarea{
    	resize: none;
    }
 </style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
                <div id="content">
					 <h1>공지사항 작성하기</h1>
                    <form action="${root}/notice/write" method="post" enctype="multipart/form-data">
                <div id="form-area">
                    <div class="form-floating mb-3">
                   		<h3>제목</h3>
					  <input type="text" name = "title"class="form-control" id="title">
					</div>
                    <div class="form-floating">
                    	<h3>내용</h3>
					  <textarea name="content" class="form-control"  id="content" style="height: 350px"></textarea>
					</div>
                    <div class="mb-3">
                    
					  <label for="formFileMultiple" class="form-label"></label>
					  <input class="form-control" type="file" name="f" id="formFileMultiple" multiple>
					</div>
                   
                    <div id="thumbnail-area"></div>
                    <input type="submit" value="작성하기" class="btn btn-success" style="float: right;">
                </div>
            </form>

            </div>
        </div>
    </div>

</body>
</html>
<script>

    //업로드 파일 미리보기
    
    //변수 준비
    const fileTag = document.querySelector('input[name="f"]');
    const thumbnailArea = document.querySelector('#thumbnail-area');

    //이벤트 핸들러 연결
    fileTag.addEventListener('change' , ()=>{
       
        thumbnailArea.innerHTML = ''; //썸네일 에리어 지우기
        
        //파일이 있으면 미리보기 작업 진행
        if(fileTag.files.length > 0){
            for(let f of fileTag.files){
                const reader = new FileReader();
                reader.addEventListener("load" , processPreview);
                reader.readAsDataURL(f);
            }
        }
        
    });

    //이미지 요소 만들어서 화면에 추가
    function processPreview(event) {
        const imgTag = document.createElement('img');
        imgTag.setAttribute("src" , event.target.result);
        imgTag.setAttribute("width" , "100px");
        imgTag.setAttribute("heigth" , "100px");

        thumbnailArea.appendChild(imgTag);
    }
</script>