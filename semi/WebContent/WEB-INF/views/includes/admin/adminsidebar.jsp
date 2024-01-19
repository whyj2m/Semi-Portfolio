<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="${cp}/admin">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li>

     
      <!-- 공지사항, 게시판 관리 -->
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms" data-bs-toggle="collapse" href="#">
          <i class="bi bi-question-circle"></i><span>F.A.Q</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${cp}/admin/adminList?category=1">
              <i class="bi bi-circle"></i><span>공지사항</span>
            </a>
          </li>
          <li>
            <a href="${cp}/admin/adminList?category=2">
              <i class="bi bi-circle"></i><span>자주찾는 질문</span>
            </a>
          </li>
          <li>
            <a href="${cp}/admin/adminList?category=3">
              <i class="bi bi-circle"></i><span>1:1문의</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->


      