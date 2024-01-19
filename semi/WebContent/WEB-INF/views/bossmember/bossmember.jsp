<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="${cp}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${cp}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${cp}/resources/assets/css/style.css" rel="stylesheet">
</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <jsp:include page="../includes/bossmember/bosshead.jsp"></jsp:include>
  </header>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

   <jsp:include page="../includes/bossmember/bosssidebar.jsp"></jsp:include>

  </aside>
  
  <!-- 메인 -->

 <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div>

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-10">
          <div class="row">

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

               

                <div class="card-body">
                  <h5 class="card-title">Reports <span>/Today</span></h5>

                  <!-- Line Chart -->
                  <div id="reportsChart mb-5"></div>

    <div class="pagetitle mt-5">
      <h1>제주어때 F.A.Q</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cp}/admin">Home</a></li>
          <li class="breadcrumb-item">support</li>
          <li class="breadcrumb-item active">Frequently Asked Questions</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section faq">
      <div class="row">
        <div class="col-lg-6">

          <!-- F.A.Q 공지사항 -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title d-flex justify-content-between">공지사항<a href="${cp}/admin/adminList?category=1" class="d-flex">더보기</a></h5>
              <div class="accordion accordion-flush" id="faq-group-1">
          <c:forEach items="${faq}" var="f">

                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" data-bs-target="#faqsne-${f.bno}" type="button" data-bs-toggle="collapse">
                      ${f.title}
                    </button>
                  </h2>
                  <div id="faqsne-${f.bno}" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
                    <div class="accordion-body">
                      ${f.content}
                    </div>
                  </div>
                </div>
            </c:forEach>
              </div>

            </div>
          </div><!-- End F.A.Q Group 1 -->

        </div>

        <div class="col-lg-6">
          <!-- F.A.Q 자주찾는질문 -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title d-flex justify-content-between">자주찾는질문<a href="${cp}/admin/adminList?category=1" class="d-flex">더보기</a></h5>

              <div class="accordion accordion-flush" id="faq-group-2">
				
				<c:forEach items="${board}" var="b">
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" data-bs-target="#faqsTwo-${b.bno}" type="button" data-bs-toggle="collapse">
                    ${b.title}
                    </button>
                  </h2>
                  <div id="faqsTwo-${b.bno}" class="accordion-collapse collapse" data-bs-parent="#faq-group-2">
                    <div class="accordion-body">
                      ${b.content}
                    </div>
                  </div>
                </div>    
                </c:forEach>           
                </div>
              </div>

            </div>
          </div><!-- End F.A.Q Group 2 -->
          </div>
    </section>
        </div>
      </div>

  </main><!-- End #main -->
 

  <!-- ======= Footer ======= -->
  <jsp:include page="../includes/bossmember/bossfooter.jsp"></jsp:include>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->

  <script src="${cp}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

</body>
</html>