<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="${cp}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${cp}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${cp}/resources/assets/css/style.css" rel="stylesheet">
  <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <jsp:include page="../includes/admin/adminhead.jsp"></jsp:include>
  </header>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

   <jsp:include page="../includes/admin/adminsidebar.jsp"></jsp:include>

  </aside>
  
  <!-- 메인 -->

  <main id="main" class="main">
    <div class="pagetitle">
    
	<c:forEach items="${categories}" var="c">
      <c:if test="${c.cno == pageDto.cri.category}"><h1>${c.cdesc}</h1></c:if>
     </c:forEach>
     
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Tables</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              
              
              <h5 class="card-title"></h5>
              
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th class="col-sm-2 text-center">NO</th>
                    <th class="col-sm-5">TITLE</th>
                    <th class="col-sm-5">REGDATE</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="l">
                  <tr>
                    <th class="text-center">${l.bno}</th>
                    
                    <!-- 상세보기 -->
                    <!-- http://localhost:8080/admin/adminList/get?bno=158 -->
                    
                    <td><c:choose>
				        <c:when test="${l.category == 1 || l.category == 2 || l.category == 4}">
				            <a class="" href="/adminList/get?bno=${l.bno}">${l.title}</a>
				        </c:when>
				        <c:otherwise>
				            <a class="" href="/adminList/ask?bno=${l.bno}">${l.title}</a>
				        </c:otherwise>
				    </c:choose></td>
                    <td><fmt:formatDate value="${l.regDate}" pattern="yyyy/MM/dd" /></td>
                    
                  </tr>
                </c:forEach>
                
                <tr>
                    <th class="col-sm-2 text-center border-bottom-0"> <a href="${cp}/adminList/register${page.cri.link}" 
                    class="btn btn-primary btn text-right">register</a></th>
                    <th class="col-sm-5 border-bottom-0"></th>
                    <th class="col-sm-5 border-bottom-0"></th>
                  </tr>
                
                </tbody>
              </table>
             
              <!-- End Table with stripped rows -->
				<div class="">
					<div class="pagination justify-content-center mt-5">
						<c:if test="${pageDto.prev}">
							<a class="" href="?pageNum=${pageDto.cri.pageNum-1}&${pageDto.cri.qs2}">
							<h5 class="mr-1 text-dark"><i class="fas fa-angle-left"></i></h5></a>
						</c:if>
								
						<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}"
									var="i">
						<a class="active text-dark" href="?pageNum=${i}&${pageDto.cri.qs2}"><h5 class="mr-1 dark-black">${i}</h5></a>
					</c:forEach>

					<c:if test="${pageDto.next}">
						<a class="page-item"
						href="?pageNum=${pageDto.cri.pageNum+1}&${pageDto.cri.qs2}">
						<h5 class="mr-1 text-dark"><i class="fas fa-angle-right"></h5></i>
						</a>
						</c:if>
					</div>
				</div>
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
  <!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../includes/admin/adminfooter.jsp"></jsp:include>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
	<script
		src="${cp}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>



</body>
</html>