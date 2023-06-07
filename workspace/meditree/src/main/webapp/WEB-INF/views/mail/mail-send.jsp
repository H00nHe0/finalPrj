<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기</title>
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
					 <h1>메일 작성하기</h1>
                    <form action="${root}/mail/write" method="post" enctype="multipart/form-data">
					 <div class="card">
                  <div class="card-body">
                <div id="form-area">
                    <div class="form-floating mb-3">
                    <input type="hidden" name="writer">
                   		<h5>제목</h5>
					  <input type="text" class="form-control"  name = "title">
                   		<h5>받는사람</h5>
					  <input type="text" class="form-control" name="receiver" >
					</div>
                    <div class="form-floating">
                    	<h5>내용</h5>
					  <textarea class="form-control" name="content" style="height: 350px"></textarea>
					</div>
                    <div class="mb-3">
                    
					  <label for="formFileMultiple" class="form-label"></label>
					  <input class="form-control" name="f" type="file" id="formFileMultiple" multiple>
					</div>
                   
                    <div id="thumbnail-area"></div>
                    <input type="submit" value="작성하기" class="btn btn-success" style="float: right;">
                </div>
                </div>
                </div>
            </form>

            </div>
        </div>
    </div>

</body>
</html>