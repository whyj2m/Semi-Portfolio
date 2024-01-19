<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${cp}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${cp}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${cp}/resources/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha512-YK1Mz9UiZmhbFzXgMbl3bO49wZ78Xj3h8TtTBLFHEAEjUBxsEZdXd8Il5RWbhPOyB653bGQDNVGGny2mORZq4A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	
	
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

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-dark">Board Read Page</h1>
			<div class="card shadow mb-4">
				<form method="post">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary mb-1">1:1문의 내용</h6>
					</div>
					<div class="card-body mt-3">
						<div>
							<i class="far fa-question-circle"></i> 답변하시기 전 확인해주세요<br> -
							고객님의 소중한 의견을 빠르고 정확하게 해결하기위해 답변은 꼼꼼하게 남겨주세요<br>



								<table class="table mt-4">
									<tbody>
										<tr>
											<td class="col-sm-3 text-center border"><strong>문의유형</strong></td>
											<td class="border">${board.asktype}</td>

										</tr>
										<tr>
											<td class="col-sm-3 text-center border"><strong>작성자</strong></td>
											<!-- 멤버에서 자동으로 가져와야됌 -->
											<td class="border">${board.id}</td>

										</tr>
										<tr>
											<td class="col-sm-3 text-center border align-middle"><strong>예약번호</strong></td>

											<td class="border">${board.bookno}</td>

										</tr>
										<tr>
											<td class="col-sm-3 text-center border align-self-center"><strong>답변알림</strong>
											</td>
											<td class="border">${board.alram}</td>
										</tr>
										<tr>
											<td class="col-sm-3 text-center border align-middle"><strong>제목</strong></td>
											<td class="border">${board.title}</td>
										</tr>
										<tr>
											<td class="col-sm-3 text-center border align-middle"><strong>문의내용</strong></td>
											<td class="border">${board.content}</td>
										</tr>
										<tr>
											<!-- <form method="post" enctype="multipart/form-data"></form> -->
											<td class="col-sm-3 text-center border"><strong>파일첨부</strong></td>
											<c:forEach items="${attach}" var="a">
												<td class="border">${a.origin}</td>
											</c:forEach>
										</tr>
									</tbody>
								</table>


						</div>
						<div class="mt-3">
							<a class="btn btn-info" href="${cp}/admin/adminList?category=3">List</a>
							<a class="btn btn-primary"
								href="${cp}/adminList/remove?bno=${board.bno}">delete</a>
						</div>
						<%-- ${criteria} --%>
				</form>
			</div>


			<div class=" mb-4">
			<form method="post" class="">
			<input type="hidden" name="bno" value="${board.bno}">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">1:1 문의 답변</h6>
				</div>
				<div class="card-body">
				
				<c:if test="${not empty askboard}">
					<div class="form-group answer">
					<br>
						<textarea class="form-control" rows="5" name=""
							id="content" readonly>${askboard.content}</textarea>
							<br>
							
					</div>
				</c:if>
				<c:if test="${empty askboard}">	
					
					<div class="form-group showanswer">
					<br>
						<textarea class="form-control" rows="5" name="content"
							id="content" placeholder="최대 3000자까지 가능합니다. 답변할 내용을 입력해주세요."></textarea>
							<br>
							<button class="btn btn-primary" type="submit">등록</button>
					</div>
				</c:if>
				</div>
				</form>
			</div>
		</div>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../includes/admin/adminfooter.jsp"></jsp:include>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${cp}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="../resources/assets/js/main.js"></script>

<!-- <script>
    $(document).ready(function() {
        if ($("textarea").val().length >= 0) {
            $(".answer").hide();
            $(".showanswer").show();
        }
        else {
        	 $(".answer").show();
             $(".showanswer").hide();
        }
    });
</script> -->
</body>
</html>