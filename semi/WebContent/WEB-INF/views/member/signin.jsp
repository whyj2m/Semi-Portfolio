<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>Bootstrap 4 Website Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>

	/* 로그인시 action */
	$(function() {

		$("loginButton").click(function() {

			$("#loginForm").attr("action", "/member/login");
			$("#loginForm").submit();
		})

	})

	/* 회원 로그인 버튼 선택시 색 변경 */
	function login() {
		document.getElementById('log').style.backgroundColor = '#007bff';
		document.getElementById('bossLogin').style.backgroundColor = '#343a40';
		document.getElementById('loginButton').style.backgroundColor = '#007bff';
	}
	/* 사업자 로그인 버튼 선택시 색 변경 */
	function boss() {
		document.getElementById('log').style.backgroundColor = '#343a40';
		document.getElementById('bossLogin').style.backgroundColor = '#ffc107';
		document.getElementById('loginButton').style.backgroundColor = '#ffc107';
	}
</script>
<style>
.container .row .col-sm-6 .m-3 input {
	height: 60px;
}

.container .row .col-sm-6 .m-3 .btn-block button {
	height: 60px;
}
</style>
</head>

<body>

	<jsp:include page="../includes/header.jsp"></jsp:include>
	<form id="loginForm" method="post">
		<div class="container">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="row m-3">
						<img src="">
						<!-- jeju 로고 이미지 들어갈 위치 -->
						<div class="btn-group btn-block mb-2 mt-5">
							<button type="button" class="btn btn-primary" id="log"
								onclick="login()">회원로그인</button>
							<button type="button" class="btn btn-dark" id="bossLogin"
								onclick="boss()">사업자로그인</button>
						</div>
						<input type="text" class="form-control my-3" id="id" name="id"
							placeholder="아이디"> <input type="password"
							class="form-control my-1" id="pw" name="pw" placeholder="비밀번호">
						<button type="submit"
							class="btn-lg btn-primary btn-block border-0 mb-2 mt-4"
							id="loginButton" value="login">로그인</button>
					</div>
					<a href="/member/signup" class="text-decoration-none"><p class="text-center text-dark">회원가입 | 아이디 찾기 | 비밀번호 찾기</p></a>
					<img>
					<!-- 밑에 배너 이미지 들어갈 위치 -->
				</div>
			</div>
		</div>
	</form>



	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>