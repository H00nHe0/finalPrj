<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}" scope="page"/>
	<link rel="stylesheet" href="${root}/resources/css/common/common.css">

	<c:if test="${not empty alertMsg}">
	<script>
		alert('${sessionScope.alertMsg}');
	</script>
	</c:if>
	<c:remove var="alertMsg" scope="session"/>

        <header>
            <div id="logo-area">
		    	<a href="${root}/member/main">
		         <img id="mediLogo" src="${root}/resources/img/mediLogo.jpg" alt="로고이미지">
		     	</a>
            </div>
            <div class="group">
              <svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
              <input placeholder="Search" type="search" class="input">
            </div>

            <div id="etc-area">
              <a href="#"><img id="chat" src="${root}/resources/img/homeImg/chat.svg" alt="채팅이미지"></a>
              <a href="#"><img id="calendar" src="${root}/resources/img/homeImg/calendar2.png" alt="일정이미지"></a>
              <a href="#"><img id="alert" src="${root}/resources/img/homeImg/alert.svg" alt="알람이미지"></a>
              <a href="#"><img id="logout" src="${root}/resources/img/homeImg/logout.svg" alt="로그아웃이미지"></a>          
            </div>
        </header>

<!--           <main>
            <div id="main-division">
              <div class="dashboard">
                <div class="totalP">구역1-1</div>
                <div class="totalP">구역1-2</div>
                <div class="totalP">구역1-3</div>
              </div>
              <div class="dashboard">
                <div class="graph" id="stick">구역2-1</div>
                <div class="graph" id="circle">구역2-2</div>
              </div>
              <div class="dashboard">
                <div class="dashboard3">구역3-1</div>
                <div class="dashboard3">구역3-1</div>
              </div>
              <div class="dashboard">
                <div class="notice">구역4</div>
              </div>
            </div> 
          </main>
 -->
