<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <c:set var="root" value="${pageContext.request.contextPath}" scope="page"/>
	<link rel="stylesheet" href="${root}/resources/css/common/commonSidebar.css">
	<script defer type="text/javascript" src="${root}/resources/js/common/common.js"></script>

	<c:if test="${not empty alertMsg}">
	<script>
		alert('${sessionScope.alertMsg}');
	</script>
	</c:if>
	<c:remove var="alertMsg" scope="session"/>

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
                        <a href="/app/member/reception"><li>접수</li></a>
                        <a href="#"><li>환자 조회</li></a>
                        <a href="#"><li>예약 대기</li></a>
                        <a href="#"><li>입원실 현황</li></a>
                        <a href="#"><li>수납</li></a>
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
                      <li class="category"><img src="${root}/resources/img/homeImg/calendar.png">일정</li>
                      <ul class="sub-menu">
                        <a href="#"><li>병원 일정 확인</li></a>
                        <a href="#"><li>개인 일정 확인</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideOrganization.png">조직도</li>
                      <ul class="sub-menu">
                        <a href="#"><li>부서 정보</li></a>
                        <a href="#"><li>직원 정보</li></a>
                      </ul>
                      <li class="category"><img src="${root}/resources/img/homeImg/sideNotice.png">사내 게시판<br> & 공지 사항</li>
                      <ul class="sub-menu">
                        <a href="#"><li>게시글 목록</li></a>
                        <a href="#"><li>공지 사항</li></a>
                      </ul>
                    </ul>
                </nav>
            </div>