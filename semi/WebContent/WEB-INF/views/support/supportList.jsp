<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>제주어때 - 고객지원</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha512-YK1Mz9UiZmhbFzXgMbl3bO49wZ78Xj3h8TtTBLFHEAEjUBxsEZdXd8Il5RWbhPOyB653bGQDNVGGny2mORZq4A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});

	$(function() {
		$(".slider").bxSlider({
			pager : false,
			controls : false,
			auto : true,
			pause : 2000,
			autoHover : true,
			mode : 'fade',
			speed : 200
		});
	})
</script>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="../includes/header.jsp"></jsp:include>

		<section>
			<div class="row">
				<!-- 왼쪽메뉴 -->
				<div class="col-sm-2 text-decoration-none">

					<h2 class="text-center mb-3 text-decoration-none mt-5">
						<a class="text-decoration-none text-dark" href="${cp}/support">고객센터</a>
					</h2>

					<input type="hidden" name="category"
						value="${pageDto.cri.category}">


					<nav class="navbar bg">
						<ul class="list-group list-group-flush">
							<a href="${cp}/support/list?category=1"
								class="list-group-item list-group-item-action border border-left-0 border-right-0 ${pageDto.cri.category == 1 ? 'active' : ''}">공지사항
							</a>
							<a href="${cp}/support/list?category=2"
								class="list-group-item list-group-item-action border border-left-0 border-right-0 ${pageDto.cri.category == 2 ? 'active' : ''}">자주찾는질문
							</a>
							<a href="${cp}/support/ask"
								class="list-group-item list-group-item-action ${pageDto.cri.category == 3 ? 'active' : ''}">1:1문의</a>

							<a href="${cp}/support/list/event"
								class="list-group-item list-group-item-action border border-left-0 border-right-0 ${pageDto.cri.category == 5 ? 'active' : ''}">이벤트
							</a>
						</ul>
					</nav>

				</div>
				<!-- 검색창 -->
				<div class="col-sm-10">

					<!-- 자주찾는 질문 -->
					<br>
					<%-- ${categories} --%>
					<div class="mb-4 mt-3">
						
							<h2 class="text-dark text-center">
								<strong> <c:forEach items="${categories}" var="c">
										<c:if test="${c.cno == pageDto.cri.category}">${c.cdesc}</c:if>
									</c:forEach>
								</strong>
							</h2>
					</div>
					
					
					<div id="accordion ">
					
						<c:forEach items="${list}" var="l">
							<div
								class="card border border-left-0 border-right-0 border-bottom-0">
								<div class="card-header bg-white">
									<a class="card-link text-dark bg-basic" data-toggle="collapse"
										href="#${l.bno}"> <strong>${l.title}</strong>
									</a>
								</div>
								<div id="${l.bno}" class="collapse" data-parent="#accordion">
									<div class="card-body">${l.content}</div>
								</div>
							</div>
						</c:forEach>
						
						<%-- ${pageDto} --%>
						<!-- 페이지번호 -->

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
		</section>

		<!-- 푸터 -->
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
</body>

</html>