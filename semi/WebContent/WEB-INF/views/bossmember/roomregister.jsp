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
									<h3>객실 정보 등록</h3>
									
									<hr>
									<form id="form" name="frm" method="post"
										enctype="multipart/form-data">
										<div class="form-group mb-3">

										<label for="hotelGrade" class="mb-2"><strong>호텔명</strong></label>
											<select class="form-select"
												aria-label="Default select example" name="hno" >
												<option selected>호텔 이름을 선택해주세요</option>
										<c:forEach var="h" items="${hotel}"  >
												<option value="${h.hno}">${h.hotelName}</option>
										</c:forEach>
											</select>
										</div>
										
										<div class="form-group mb-3 mt-3">
											<label for="hotelName" class="mb-2"> <strong>객실명</strong></label>
											<input type="text" class="form-control" id=roomName
												placeholder="객실명을 입력해주세요" name="roomName" required>
											<div class="invalid-feedback">필수정보입니다.</div>
										</div>
										
										<div class="form-group mb-3">
											<label for="hotelJuso" class="mb-2"><strong>객실가격</strong></label>
											<input type="text" class="form-control" id="roomPrice"
												placeholder="객실가격을 입력해주세요" name="roomPrice">
										</div>

										<div class="form-group mb-3">
											<label for="hotelTel" class="mb-2"><strong>숙소정보</strong></label>
											<textarea type="text" class="form-control" id="comment"
												placeholder="숙소정보를 입력해주세요" name="comment" required rows="10"></textarea>
											<div class="invalid-feedback">필수정보입니다.</div>
										</div>

										<div class="card mb-4" style="box-shadow: 0px 0 0px">

											<h5 class="font-weight-bold text-dark mb-3">
												<strong>객실사진</strong>
											</h5>
											<div class="custom-file">
												<input type="file" class="form-control-file border mb-3"
													name="files" multiple="multiple">
													<button type="submit"
											class="btn btn-primary btn-lg float-right">등록</button>
											</div>

											<div class="upload-wrapper card-body">
												<div class="uploadResult mt-5">
													<ul class="list-group">
														<li class="image-place list-unstyled row">
														</li>
													</ul>
												</div>
											</div>

											<script>
										        $(document.frm.files).change(function (e) {
										            $(".image-place").empty();
										            
										            const files = e.currentTarget.files;
										            Object.keys(files).forEach(i => {
										                const file = files[i];
										                console.log(file);
										                if(file.type.indexOf("image") != -1) {
										                    const reader = new FileReader();
										                    reader.onload = (e) => {
										                        console.log(e);
										                        
										                        $("<img>").attr("src", e.target.result).appendTo(".image-place");
										                    }
										                    reader.readAsDataURL(file);
										                }
										            })
										        });
    										</script>
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

</body>
</html>