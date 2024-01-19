<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha512-YK1Mz9UiZmhbFzXgMbl3bO49wZ78Xj3h8TtTBLFHEAEjUBxsEZdXd8Il5RWbhPOyB653bGQDNVGGny2mORZq4A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link
	href="${cp}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${cp}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${cp}/resources/assets/css/style.css" rel="stylesheet">
<script src="${cp}/resources/js/jusoPopup.jsp"></script>

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
			<h1>객실관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${cp}/adminmember">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>

		<!-- 호텔 정보 등록 -->

		<!-- Reports -->
		<div class="col-12">
			<div class="card">
				<!-- 호텔등록  -->
				<section class="section faq">
					<div class="card-body">
						<div class="container" style="margin-top: 30px">
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-sm-10">
									<div class="d-flex flex-row justify-content-between mb-4">

										<!-- 호텔 정보 -->
										<div class="dropdown">
											<button type="button" class="btn btn-primary dropdown-toggle"
												data-toggle="dropdown">객실관리</button>
											<div class="dropdown-menu">
												<c:forEach items="${hotel}" var="h">
													<a class="dropdown-item dropdown-hno-select"
														href="${h.hno}">${h.hotelName}</a>
												</c:forEach>
											</div>
										</div>
										<a type="submit" class="btn btn-primary"
											href="${cp}/bossmember/roomregister">등록하기</a>
									</div>
									<form method="post">
										<table class="table text-center tbl-rooms">
											<thead class="table-light">
												<tr>
													<th class="col-sm-1"><input
														class="form-check-input ml-2 allcheck" type="checkbox"
														name="allcheck"></th>
													<th class="col-sm-2">호텔번호</th>
													<th class="col-sm-3">객실이름</th>
													<th class="col-sm-2">가격</th>
													<th class="col-sm-2">관리</th>
												</tr>
											</thead>



											<tbody>
												<c:forEach items="${room}" var="r1" varStatus="outerStat">
													<c:forEach items="${r1}" var="r">
														<tr class="${outerStat.index > 0 ? 'd-none' : ''}"
															data-hno="${r.hno}">
															<td><input class="form-check-input ml-2 box"
																name="box" value="${r.roomNo}" type="checkbox"></td>

															<td>${r.hno}/${outerStat.index + 1}</td>
															<td>${r.roomName}</td>
															<td>${r.roomPrice}</td>
															<td><a
																href="${cp}/bossmember/roommodify?roomNo=${r.roomNo}">수정</a></td>
														</tr>
													</c:forEach>
												</c:forEach>
											</tbody>
										</table>
										<div class="col-sm-1 text-center">
										<button class="btn btn-primary deletebox" disabled id="deletebox">삭제</button>
										</div>
									</form>

									<br>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="../includes/bossmember/bossfooter.jsp"></jsp:include>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->

	<script
		src="${cp}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Template Main JS File -->
	<script src="../resources/assets/js/main.js"></script>
	<script>
		$(".dropdown-hno-select").click(function() {
			event.preventDefault();
			$("input:checkbox").prop("checked", false);
			$("#deletebox").prop("disabled", true);
			console.log($(this).attr("href"));
			const hno = $(this).attr("href");
			$(".tbl-rooms tr:not(:eq(0))").addClass("d-none").each(function() {
				if ($(this).data("hno") == hno) {
					$(this).removeClass("d-none");
				}
			})
		})
		
		// 전체선택
		$(".allcheck").change(function() {
			if ($(".allcheck").is(":checked")) {
				$("input[name=box]").prop("checked", true);
				$("tr.d-none").find("input[name=box]").prop("checked", false);
				$("#deletebox").prop("disabled", false);
				
			} else {
				$("input[name=box]").prop("checked", false);
				$("#deletebox").prop("disabled", true);
			}
		})		
		
/* 		$("input[name=box], .allcheck").change(function(){
			$("#deletebox").prop("disabled", false);
		}) */
		
		$("input[name=box]").change(function() {
			var v = $("input[name=box]:checked").length;
			$("#deletebox").prop("disabled", !v);
			if($("input[name=box]:checked").length == 0) {
				$(".allcheck").prop("checked", false);
			}
			
		})

	</script>
</body>
</html>