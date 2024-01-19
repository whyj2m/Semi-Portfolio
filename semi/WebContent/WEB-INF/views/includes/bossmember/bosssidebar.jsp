<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item">
        <a class="nav-link " href="${cp}/bossmember">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li>

      <!-- 예약관리 -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>호텔관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
          <!-- ${cp}/admin/adminList?category=1 -->
            <a href="${cp}/bossmember/hotelregister">
              <i class="bi bi-circle"></i><span>호텔등록</span>
            </a>
          </li>
          <li>

          	<c:choose>
          		<c:when test=""></c:when>
          	</c:choose>
            <a href="${cp}/bossmember/roomlist">
              <i class="bi bi-circle"></i><span>객실관리</span>
            </a>
          </li>
        </ul>
      </li>
      
      <%-- <!-- 리뷰관리  -->
     <li class="nav-item">
	    <a class="nav-link collapsed" data-bs-target="#components-nav2" data-bs-toggle="collapse" href="#">
	        <i class="fas fa-list"></i><span> 리뷰확인</span><i class="bi bi-chevron-down ms-auto"></i>
	    </a>
	    <ul id="components-nav2" class="nav-content collapse" data-bs-parent="#sidebar-nav">
	        <c:choose>
	            <c:when test=""></c:when>
	        </c:choose>
	        <a href="${cp}/bossmember/roomreview">
	            <i class="bi bi-circle"></i><span>리뷰확인</span>
	        </a>
	    </ul>
	</li> --%>


 



    