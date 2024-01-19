 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 헤더 -->
   <div class="d-flex align-items-center">
      <a href="${cp}/bossmember" class="logo d-flex align-items-center">
        <span class="d-none d-lg-block">제주어때 사장님 페이지</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div>

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item dropdown pe-3">
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
           
            <span class="d-none d-md-block dropdown-toggle ps-2">${member.id}</span>
          </a><!-- End Profile Iamge Icon -->

          <!-- 프로필 메뉴 -->
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${member.id}</h6>
              <span>사장님</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="${cp}/member/logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
