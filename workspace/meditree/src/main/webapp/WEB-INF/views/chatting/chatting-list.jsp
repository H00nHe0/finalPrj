<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅목록</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-oi53X9Oc1d2Q1BilfXDzO6p+ZtxRxzq3YjY6e0H6U9f6U5ey6mm4jK1H4Qz0dZP4w+V7N/A1N+uV8eYZEgAtvA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.chat-list {
  width: 100%;
}

.chat-list h2 {
  font-size: 16px;
  font-weight: bold;
  margin-top: 0;
}
table{
	width: 100%;
}

.user {
  display: grid;
  grid-template-columns: 2fr 6fr 2fr;
  align-items: center;
  margin-bottom: 10px;
  border: 1px solid black;
}

img#user {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  margin-right: 10px;
}

.user p {
  margin: 0;
  font-size: 14px;
  font-weight: bold;
}
img#chatImg {
	width: 30px;
	height: 30px;
	float: right;
}

    
</style>

</head>
<body>
	<div class="chat-list">
  <h1>채팅목록</h1>
  <table class="user-list">
  	
  	<tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/김승우.jpg" alt="프로필 사진"></td>
  		<td>김승우</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
  	<tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/장기태.jpg" alt="프로필 사진"></td>
  		<td>장기태</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
  	<tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/차정숙.jpg" alt="프로필 사진"></td>
  		<td>차정숙</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/장겨울.jpg" alt="프로필 사진"></td>
  		<td>장겨울</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/서인호.jpg" alt="프로필 사진"></td>
  		<td>서인호</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/양석형.jpg" alt="프로필 사진"></td>
  		<td>양석형</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/이영하.jpg" alt="프로필 사진"></td>
  		<td>이영하</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/차은재.jpg" alt="프로필 사진"></td>
  		<td>차은재</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/도재학.jpg" alt="프로필 사진"></td>
  		<td>도재학</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/유혜정.jpg" alt="프로필 사진"></td>
  		<td>유혜정</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/김재환.jpg" alt="프로필 사진"></td>
  		<td>김재환</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>
    <tr class="user">
  		<td><img id="user" src="${root}/resources/img/member/로이킴.jpg" alt="프로필 사진"></td>
  		<td>로이킴</td>
  		<td><a href="javascript:void(0)" onclick="popUp2();"><img id="chatImg" alt="" src="${root}/resources/img/test/chatimg.png"></a></td>
  	</tr>

  
  	
  </table>
    
</div>
	
	
</body>
</html>

<script>

        function popUp2() {
            window.open("${root}/chatting/window","팝업창","width = 500, height = 600 ,top=0, left = 600");
        }
    </script>