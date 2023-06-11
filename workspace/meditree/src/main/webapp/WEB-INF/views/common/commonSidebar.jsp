<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="page" />
<link rel="stylesheet" href="${root}/resources/css/common/commonSidebar.css" />
<script
  defer
  type="text/javascript"
  src="${root}/resources/js/common/common.js"
></script>

<c:if test="${not empty alertMsg}">
  <script>
    alert("${sessionScope.alertMsg}");
  </script>
</c:if>
<c:remove var="alertMsg" scope="session" />

<div id="sidebar-holder">
  <div id="member-profile">
    <img width="100px" height="100px" alt="프로필이미지" src="${root}/resources/img/member/${loginMember.profileName}">&nbsp;&nbsp;&nbsp;
    <div class="profile-details">
      <h3>${loginMember.name}&nbsp;${loginMember.potitle}</h3>
      <p>${loginMember.title}</p>
      <a href="${root}/member/edit">
      	<button id="mypage-btn" type="button">MYPAGE</button>
      </a>
      
    </div>
  </div>
  <nav class="sidebar">
    <ul>
      <li class="category">
        <img src="${root}/resources/img/homeImg/sideHome.png" /> 메인화면
      </li>
      <ul class="sub-menu">

      </ul>
      <li class="category">
        <img src="${root}/resources/img/homeImg/sideTreatment.png" /> 진료
      </li>
      <ul class="sub-menu">
        <a href="/app/treat/prescription"><li>진료하기</li></a>
        <a href="/app/treat/waiting"><li>진료 대기</li></a>
        <a href="/app/patientInquiry/list"><li>환자 정보</li></a>
      </ul>
      <li class="category">
        <img src="${root}/resources/img/homeImg/sideReception.png" /> 원무
      </li>
      <ul class="sub-menu">
        <a href="/app/member/reception"><li>환자 접수</li></a>
        <!-- <a href="#"><li>환자 진료내역</li></a> -->
        <a href="/app/member/rsvnWaiting"><li>병실 예약 대기</li></a>
        <a href="/app/member/receiveManage"><li>수납</li></a>
        <a href="/app/member/roomCheck"><li>입원실 현황</li></a>
        <a href="/app/member/sRoomCheck"><li>수술실 현황</li></a>
      </ul>
      
      <li class="category">
        <img src="${root}/resources/img/homeImg/calendar.png" />일정
      </li>
      <ul class="sub-menu">
        <a href="/app/member/schedule"><li>병원 일정 확인</li></a>
        <a href="/app/member/pSchedule"><li>개인 일정 확인</li></a>
      </ul>
      <li class="category">
        <img src="${root}/resources/img/homeImg/sideOrganization.png" />조직도
      </li>
      <ul class="sub-menu">
        <a href="/app/organization/chartView"><li>조직도 조회</li></a>
      </ul>
      <li class="category">
        <img src="${root}/resources/img/homeImg/sideApproval.png" />전자결재
      </li>
      <ul class="sub-menu">
        <a href="${root}/eleSign/list"><li>결재하기</li></a>
      </ul>
      <li class="category">
        <img src="${root}/resources/img/homeImg/sideNotice.png" />게시판
      </li>
      <ul class="sub-menu">
        <a href="${root}/notice/list"><li>공지 사항</li></a>
        <a href="${root}/board/list"><li>사내 게시판</li></a>
      </ul>
      <c:if test="${loginMember.no == '999999'}">
      <li class="category">
        <img src="${root}/resources/img/homeImg/sideApproval.png" />관리자 전용
      </li>
      <ul class="sub-menu">
        <a href="/app/member/join"><li>직원 가입</li></a>
        <a href="/app/admin/member/list"><li>직원 관리</li></a>
        <a href="${root}/appr/list"><li>결재문서 관리</li>
        <a href="${root}/mediDevice/list"><li>의료기기 관리</li></a>
        <a href="${root}/bipum/list"><li>비품 관리</li></a>
        <a href="${root}/member/manageSchedule"><li>병원 일정 관리</li></a>
      </ul>
      </c:if>
      
    </ul>
  </nav>
</div>
