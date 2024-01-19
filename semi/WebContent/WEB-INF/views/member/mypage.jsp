<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>Bootstrap 4 Website Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<script>
    $(function() {

	$(document).ready(function() {
		$('#myInfo').tab('show'); // myinfo 화면 킬 때 활성화 안되길래 그냥 jquery로 넣음..
        $('#infoChange').css('display', 'none');
	});

    $("#change").click(function (){
        $("input[type='text']").prop("readonly", false);
        $('#infoChange').css('display', 'block');
    })

})
</script>

<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>




	<div class="container">

		<div class="row">
			<div class="col-sm-12">
				<ul class="nav nav-tabs mb-5 mt-4">
					<li class="nav-item mx-4"><a class="nav-link active"
						data-toggle="tab" href="#myInfo">내 정보</a></li>
					<li class="nav-item mx-4"><a class="nav-link"
						data-toggle="tab" href="#changePw">비밀번호 변경</a></li>
					<li class="nav-item mx-4"><a class="nav-link"
						data-toggle="tab" href="#reservation">예약 내역</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade" id="myInfo">
						<div class="room_comment p-4">
							<div class="media p-3">
								<div class="media-body">
									<div class="card">
										<div class="card-header bg-primary text-white font-weight-bold"> 내 정보 
                                            <button class="float-right text-white bg-primary border-0" id="change">변경하기</button>
										</div>
                                        <div class="container d-flex justify-content-center">
											<div class="col-sm-6">
												<div class="card-body">
													<form method="post" action="/member/mypage?action=updateInfo">
														<div class="form-group">
															<b class="pr-5">이름</b> <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="border-0" type="text" name="name" value="${member.name}" readonly>  </b> 
														</div>
														<div class="form-group">
															<br><b class="pr-5">이메일</b> <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="border-0" type="text" name="email" value="${member.email}" readonly></b>
														</div>
														<div class="form-group">
															<br><b class="pr-5">번호</b> <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="border-0" name="tell" type="text" value="${member.tell}" readonly></b>
														</div>
                                                        <br>
														<button type="submit" class="btn btn-lg btn-primary btn-block" id="infoChange" >변경하기</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="changePw">
						<div class="room_comment p-4">
							<div class="media p-3">
								<div class="media-body">
									<div class="card">
										<div class="card-header bg-primary text-white font-weight-bold">비밀번호 변경</div>
										<div class="container d-flex justify-content-center">
											<div class="col-sm-6">
												<div class="card-body">
													<form method="post" action="/member/mypage?action=changePassword">
														<div class="form-group">
															<b class="float-left">현재 비밀번호</b> <input type="password"
																class="form-control" id="oldpw" name="oldpw"
																placeholder="현재 비밀번호를 입력해주세요.">
														</div>
														<div class="form-group">
															<b class="float-left">신규 비밀번호</b> <input type="password"
																class="form-control" id="pw" name="pw"
																placeholder="신규 비밀번호를 입력해주세요.">
														</div>
														<div class="form-group">
															<b class="float-left">신규 비밀번호 확인</b> <input
																type="password" class="form-control" id="pwd" name="pwd"
																placeholder="신규 비밀번호를 재입력해주세요.">
														</div>
														<button type="submit" class="btn btn-lg btn-primary btn-block">변경하기</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="reservation">
						<div class="room_comment p-4">
							<div class="media p-3">
								<div class="media-body">
									<div class="card">
										<div
											class="card-header bg-primary text-white font-weight-bold">예약
											내역</div>
										<div class="container">
											<div class="card-body">
												<div class=col-sm-3></div>
												<table class="table">
													<thead class="thead">
														<tr>
															<th>객실</th>
															<th>가격</th>
															<th>예약 날짜</th>
															<th>상태</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="reservations" items="${reservations}">
														<tr>
															<td>${reservations.roomName}</td>
															<td>${reservations.roomPrice}</td>
															<td><fmt:formatDate value="${reservations.checkin}" pattern="yyyy-MM-dd" /></td>
															<td>            
															<c:choose>
                												<c:when test="${reservations.bookState == 1}">
                    											예약완료
                												</c:when>
                												<c:when test="${reservations.bookState == 0}">
                    											예약취소
                												</c:when>
                											</c:choose>
                											</td>
														</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>


			</div>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>