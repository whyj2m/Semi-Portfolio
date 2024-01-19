<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link
	href="${cp}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${cp}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${cp}/resources/assets/css/style.css" rel="stylesheet">
<script src="${cp}/resources/js/jusoPopup.jsp"></script>
<script>
	(function() {
		'use strict';
		window.addEventListener('load', function() {

			var forms = document.getElementsByClassName('needs-validation');

			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>

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
			<h1>객실등록하기</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
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
									<h3>호텔 정보 등록</h3>
									<i class="far fa-question-circle"></i> 등록하시기 전 확인해주세요<br>
                        - 호텔 정보는 1:1문의를 통해서 수정/삭제가 가능합니다.<br>
									<hr>


									<form id="form" name="form" method="post"
										class="needs-validation">
										<input type="hidden" name="id" value="${member.id}">
										<div class="form-check-inline">
											<label class="form-check-label"><strong><h5>지역정보</h5></strong>
												<input type="radio" class="form-check-input" name="ano"
												id="ano" value="2051" checked>제주시국제공항 </label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="ano" id="ano" value="2052">서귀포
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="ano" id="ano" value="2053">애월
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="ano" id="ano" value="2055">중문
											</label>
										</div>
										<div class="form-group mb-3 mt-3">
											<label for="hotelName" class="mb-2"> <strong><h5>호텔명</h5></strong></label>
											<input type="text" class="form-control" id="hotelName"
												placeholder="호텔명을 입력해주세요" name="hotelName" required>
											<div class="invalid-feedback">호텔명: 필수 정보입니다.</div>
										</div>
										<div class="form-group mb-3">
										<label for="hotelGrade" class="mb-2"><strong>호텔등급</strong></label>
											<select class="form-select"
												aria-label="Default select example" name="hotelGrade">
												<option selected>호텔의 등급을 골라주세요</option>
												<option value="1">1성</option>
												<option value="2">2성</option>
												<option value="3">3성</option>
												<option value="3">4성</option>
												<option value="3">5성</option>
											</select>
										</div>
										<div class="form-group mb-3">
											<label for="hotelJuso" class="mb-2 float-left"><strong>우편번호</strong></label>
											<div class="float-right">
												<button type="button" class="btn btn-outline-primary mb-2"
													onclick="goPopup();">주소검색하기</button>
											</div>
											<!-- <input type="text" class="form-control" id="hotelAddr"
												placeholder="주소를 입력해주세요" name="hotelAddr"> -->

											<input type="text" class="form-control mb-2"
												id="roadFullAddr" placeholder="전체주소" name="roadFullAddr">
											<input type="text" class="form-control mb-2" id="detBdNmList"
												placeholder="상세건물명" name="detBdNmList">

										</div>

										<div class="form-group mb-3">
											<label for="hotelTel" class="mb-2"><strong>호텔
														전화번호</strong></label> <input type="text" class="form-control" id="hotelTel"
												placeholder="호텔 전화번호를 입력해주세요" name="hotelTel" required>
											<div class="invalid-feedback">호텔 전화번호: 필수 정보입니다.</div>
										</div>


										<div class="form-group mb-3">
											<label for="hotelJuso" class="mb-2"><strong>오시는
														길</strong></label> <input type="text" class="form-control" id="hotelDesc"
												placeholder="사장님 한마디를 입력해주세요" name="hotelDesc">
										</div>

										<div class="form-group mb-3">
											<label for="hotelJuso" class="mb-2"><strong>사장님
														한마디</strong></label> <input type="text" class="form-control" id="hotelInfo"
												placeholder="사장님 한마디를 입력해주세요" name="hotelInfo">
										</div>

										<script>
											function goPopup() {

												var pop = window
														.open("${cp}/juso",
																"pop",
																"width=570,height=420, scrollbars=yes, resizable=yes");

											}
											function jusoCallBack(roadFullAddr,
													roadAddrPart1, addrDetail,
													roadAddrPart2, zipNo,
													jibunAddr, detBdNmList) {

												document.form.roadFullAddr.value = roadFullAddr;
												document.form.detBdNmList.value = detBdNmList;

											}
										</script>


										<!-- 객실등록 -->





										<button type="submit"
											class="btn btn-primary btn-lg float-right">등록</button>
									</form>

									<br>
									<!-- <button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#myModal">호텔 상세 조건</button> -->
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

</body>
</html>