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
			<h1 class="h3 mb-2 text-dark">Register</h1>
			<div class="card shadow mb-4">
				<form method="post" enctype="multipart/form-data">
					<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-dark mb-3">Board Category</h6>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input text-dark" name="category" id="category"
								value="1" checked>공지사항
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="category" id="category" value="2">자주찾는질문
							</label>
						</div>
						<div class="form-check-inline disabled">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="category" id="category" value="4">이벤트
							</label>
						</div>
					</div>
					<div class="card-body mt-4">
						
						
						
						<div class="form-group">
							<label for="title">Title</label> <input class="form-control mt-1"
								id="title" name="title">
						</div>
						<br>
						<div class="form-group">
							<label for="content">Content</label>
							<textarea class="form-control" id="content" name="content"
								rows="15"></textarea>
						</div>
						<input type="hidden" name="id" value="admin">
						<%-- <div class="form-group">
							<label for="id">Id</label> ${member.id}<input class="form-control mt-1"
								id="id" name="id" value="${member.id}">
						</div> --%>
						
						<div class="form-group mt-4">
							<label for="file">File</label>
							<br>
							<input type="file" class="form-control-file border mt-2" name="files" multiple="multiple">
							
						</div>

						<%-- <button onclick="location.href='/modify?bno=${board.bno}'"></button> --%>
						<div class="float-right">
						<button type="submit" class="btn mt-4 btn-primary">Register</button>
						</div>
					</div>
				</form>
			</div>
		</div>


	</main>
	<!-- End #main -->
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

</body>
</html>