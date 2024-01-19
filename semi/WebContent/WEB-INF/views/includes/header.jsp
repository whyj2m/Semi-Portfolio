 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!-- 헤더 -->
 <header class="">
            <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
                <!-- 로고 -->
                <a class="navbar-brand" href="${pageContext.request.contextPath}/main">제주어때</a>


                    <ul class="navbar-nav float-right">
                        <li class="nav-item">
                            <a class="nav-link" href="${cp}/hotel/2051">호텔목록</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="${cp}/support">고객지원</a>
                        </li>

                        <!-- Dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="list" id="navbardrop" data-toggle="dropdown">
                                더보기
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${cp}/support/list?category=1">공지사항</a>
                                <a class="dropdown-item" href="${cp}/support/list?category=2">자주찾는질문</a>
                                <a class="dropdown-item" href="${cp}/support/ask">1:1문의</a>
                                <a class="dropdown-item" href="${cp}/support/list/event">이벤트</a>
                            </div>
                        </li>
                        
                        <!-- 비로그인  -->
                        <c:if test="${empty member}">
                        <li class="nav-item">
                            <a class="nav-link" href="${cp}/member/signin">로그인</a>
                        </li>
                        </c:if>
                        <!-- 일반회원 로그인 -->
                       <c:if test="${member.grade == 0}">
                        <li class="nav-item">
                            <a class="nav-link" href="${cp}/member/logout">로그아웃</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${cp}/member/mypage">마이페이지</a>
                        </li>
                       </c:if>
                        
                        <!-- 사업자 로그인 -->
                       <c:if test="${member.grade == 1}">
                       	<li class="nav-item">
                            <a class="nav-link" href="${cp}/member/logout">로그아웃</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${cp}/bossmember">사장님페이지</a>
                        </li>
                       </c:if>
                      
                         <!-- 관리자 로그인 -->
                       <c:if test="${member.grade == 2}">
                       	<li class="nav-item">
                            <a class="nav-link" href="${cp}/member/logout">로그아웃</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${cp}/admin">관리자페이지</a>
                        </li>
                       </c:if>
                    </ul>
            </nav>
        </header>
