<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}" scope="page"/>
	<link rel="stylesheet" href="${root}/resources/css/common/common.css">
	<script defer type="text/javascript" src="${root}/resources/js/common/common.js"></script>

	<c:if test="${not empty alertMsg}">
	<script>
		alert('${sessionScope.alertMsg}');
	</script>
	</c:if>
	<c:remove var="alertMsg" scope="session"/>

        <header>
            <div id="logo-area">
		    	<a href="${root}/home">
		         <img id="mediLogo" src="${root}/resources/img/mediLogo.jpg" alt="로고이미지">
		     	</a>
            </div>
            <div class="group">
              <svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
              <input placeholder="Search" type="search" class="input">
            </div>

            <div id="etc-area">
              <a href="#"><img id="chat" src="${root}/resources/img/homeImg/chat.svg" alt="채팅이미지"></a>
              <a href="#"><img id="mail" src="${root}/resources/img/homeImg/mail.svg" alt="메일이미지"></a>
              <a href="#"><img id="alert" src="${root}/resources/img/homeImg/alert.svg" alt="알람이미지"></a>
              <a href="#"><img id="logout" src="${root}/resources/img/homeImg/logout.svg" alt="로그아웃이미지"></a>          
            </div>
        </header>

          <main>
            <div id="sidebar-holder">
                <div id="member-profile">
                    <img src="${root}/resources/img/homeImg/profile.png" alt="프로필사진" class="profile-image" >
                    <div class="profile-details">
                      <h3>홍길동</h3>
                      <p>개발부</p>
                      <button id="mypage-btn">MYPAGE</button>
                    </div>
                </div>
                <nav class="sidebar">
                    <ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideHome.png"> 메인화면 </li>
                      <ul class="sub-menu">
                        <a href="#"><li>대시 보드</li></a>
                        <a href="#"><li>공지 사항</li></a>
                        <a href="#"><li>최근 진료</li></a>
                        <a href="#"><li>최근 결제</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideTreatment.png"> 진료</li>
                      <ul class="sub-menu">
                        <a href="#"><li>진료 현황</li></a>
                        <a href="#"><li>환자 정보</li></a>
                        <a href="#"><li>진료 기록</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideReception.png"> 원무</li>
                      <ul class="sub-menu">
                        <a href="#"><li>수납 현황</li></a>
                        <a href="#"><li>청구 내역</li></a>
                        <a href="#"><li>통계 정보</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideCommute.png">근태관리</li>
                      <ul class="sub-menu">
                        <a href="#"><li>근무 일정</li></a>
                        <a href="#"><li>휴가 신청</li></a>
                        <a href="#"><li>출.퇴근 기록</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideApproval.png">전자결재</li>
                      <ul class="sub-menu">
                        <a href="#"><li>결재 현황</li></a>
                        <a href="#"><li>결재 등록</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideEmail.png">메일</li>
                      <ul class="sub-menu">
                        <a href="#"><li>받은 메일</li></a>
                        <a href="#"><li>보낸 메일</li></a>
                        <a href="#"><li>메일 작성</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideOrganization.png">조직도</li>
                      <ul class="sub-menu">
                        <a href="#"><li>부서 정보</li></a>
                        <a href="#"><li>직원 정보</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideNotice.png">공지사항</li>
                      <ul class="sub-menu">
                        <a href="#"><li>공지 목록</li></a>
                        <a href="#"><li>공지 등록</li></a>
                      </ul>
                    </ul>
                </nav>
            </div>
             <div id="main-division">
              <!-- <div class="dashboard">
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
              </div> -->
            </div> 
          </main>

