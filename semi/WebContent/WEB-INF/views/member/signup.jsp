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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
</style>
</head>
<script>
	

function checkIdAvailability() {
    var id = document.getElementById('id').value;
    if (id) {
        $.ajax({
            url: '/member/checkId',
            type: 'POST',
            data: { id: id },
            success: function(response) {
                // 서버로부터 ID를 받고 사용 가능한 아이디인지 아닌지 보여줌
                if (response === 'AVAILABLE') {
                    document.getElementById('idAvailability').textContent = '사용 가능한 ID입니다.';
                    document.getElementById('idAvailability').style.color = 'green';
                } else if (response === 'UNAVAILABLE') {
                    document.getElementById('idAvailability').textContent = '이미 가입된 ID입니다.';
                    document.getElementById('idAvailability').style.color = 'red';
                }
            }
        });
    } else {
        alert('ID를 입력해주세요.');
    }
}

document.addEventListener('DOMContentLoaded', (event) => {
  document.getElementById('signupForm').addEventListener('submit', function(event) {
    var id = document.getElementById('id').value;
    var pw = document.getElementById('pw').value;
    var pwd = document.getElementById('pwd').value;
    var name = document.getElementById('name').value;
    var email = document.getElementById('email').value;
    var tell = document.getElementById('tell').value;

    var idRegex = /^[A-Za-z0-9]{4,8}$/;
    var pwRegex = /^.{8,12}$/;
    var nameRegex = /^[가-힣]+$/;
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    var tellRegex = /^\d{2,3}-\d{3,4}-\d{4}$/;

    if (!idRegex.test(id)) {
      alert('아이디는 4~8자로 구성되어야 합니다.');
      document.getElementById('id').focus();
      event.preventDefault();
      return;
    }

    if (!pwRegex.test(pw)) {
      alert('비밀번호는 8~12글자로 구성되어야 합니다.');
      document.getElementById('pw').focus();
      event.preventDefault();
      return;
    }

    if (pw !== pwd) {
      alert('비밀번호가 일치하지 않습니다.');
      document.getElementById('pwd').focus();
      event.preventDefault();
      return;
    }

    if (!nameRegex.test(name)) {
      alert('이름은 한글로 구성되어야 합니다.');
      document.getElementById('name').focus();
      event.preventDefault();
      return;
    }

    if (!emailRegex.test(email)) {
      alert('유효한 이메일 주소를 입력해주세요.');
      document.getElementById('email').focus();
      event.preventDefault();
      return;
    }

    if (!tellRegex.test(tell)) {
      alert('휴대폰 번호는 형식에 맞게 입력해야 합니다 (예: 010-1234-5678).');
      document.getElementById('tell').focus();
      event.preventDefault();
      return;
    }
  });
});
</script>
<body>


	<jsp:include page="../includes/header.jsp"></jsp:include>

	<form id="signupForm" method="post">
		<div class="container">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<h1 class="text-center mt-4">회원가입</h1>
					<div class="row m-3 btn-block">
						<div class="form-group">
							<b class="float-left">아이디</b> <input type="text"
								class="form-control" id="id" name="id"
								placeholder="4~8글자 아이디를 입력해주세요.">
						</div>
						<button type="button" id="checkId"
							class="btn btn-outline-secondary" onclick="checkIdAvailability()">중복체크</button>
						<span id="idAvailability"></span>
						<div class="form-group">
							<b class="float-left">비밀번호</b> <input type="password"
								class="form-control" id="pw" name="pw"
								placeholder="8~12 자리 비밀번호를 입력해주세요.">
						</div>
						<div class="form-group">
							<b class="float-left">비밀번호 확인</b> <input type="password"
								class="form-control" id="pwd" name="pwd"
								placeholder="비밀번호를 재입력해주세요.">
						</div>
						<div class="form-group">
							<b class="float-left">이름</b> <input type="text"
								class="form-control" id="name" name="name"
								placeholder="이름을 입력해주세요.">
						</div>
						<div class="form-group">
							<b class="float-left">이메일</b> <input type="text"
								class="form-control" id="email" name="email"
								placeholder="이메일을 입력해주세요.">
						</div>
						<div class="form-group">
							<b class="float-left">휴대폰 번호</b> <input type="text"
								class="form-control" id="tell" name="tell"
								placeholder=" - 을 포함한 휴대폰 번호를 입력해주세요.">
						</div>
						<button type="submit" class="btn btn-lg btn-primary btn-block">가입완료</button>
					</div>
				</div>
			</div>
		</div>
	</form>



	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>