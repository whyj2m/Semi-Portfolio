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

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-dark">Board Read Page</h1>
			<div class="card shadow mb-4">
				<form method="post">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary mb-1">Board view</h6>
					</div>
					<div class="card-body mt-3">
						<div class="form-group ">
							<label for="bno">Bno</label> <input class="form-control mt-1"
								id="bno" name="bno" value="${board.bno}" readonly="readonly">
						</div>
						<div class="form-group mt-3">
							<label for="title">Title</label> <input class="form-control mt-1"
								id="title" name="title" value="${board.title}"
								readonly="readonly">
						</div>
						<div class="form-group mt-3">
							<label for="boardContent">Content</label>
							<textarea class="form-control mt-1" id="boardContent"
								name="content" rows="15" readonly>${board.content}</textarea>
						</div>
						<div class="form-group mt-3">
							<label for="Id">Id</label> <input class="form-control mt-1"
								id="Id" name="Id" value="${board.id}" readonly="readonly">
						</div>
						<div class="mt-3">
							<a class="btn btn-info" href="${cp}/admin/adminList">List</a> <a
								class="btn btn-primary"
								href="/adminList/modify?bno=${board.bno}">Modify</a> <a
								class="btn btn-primary"
								href="/adminList/remove?bno=${board.bno}">delete</a>
						</div>
						<%-- ${criteria} --%>
				</form>
			</div>


			<div class="card mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
				</div>
				<div class="card-body">
					<div class="upload-wrapper">
						<div class="uploadResult mt-3">
							<ul class="list-group">

							</ul>
						</div>
						<div class="thumbResult mt-3">
							<ul class="list-unstyled row">
								<c:forEach items="${attach}" var="a">
									<h6>${a.origin}</h6>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
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

</body>
</html>