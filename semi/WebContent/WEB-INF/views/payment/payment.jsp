<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<script>
$(function() {
	  $(".btn-payment").click(function(event) {
	    event.preventDefault(); // 기본 폼 제출을 방지
	    var confirmPayment = confirm("결제하시겠습니까?");
	    if (confirmPayment) {
	      // 폼을 제출합니다.
	      $(this).closest("form").submit();
	    } else {
	      // 사용자가 '아니오'를 선택하면 아무것도 하지 않는다.
	    }
	  });
	  $(".btn-cancle").click(function(event) {
	        event.preventDefault(); // 기본 폼 제출을 방지합니다.
	        var confirmCancel = confirm("취소하시겠습니까?");
	        if (confirmCancel) {
	            // 취소가 완료되었음을 알리고 메인 페이지로 리디렉션합니다.
	            alert("취소가 완료되었습니다.");
	            window.location.href = '/main'; // 여기서 '/main'은 메인 페이지의 경로입니다.
	        }
	    });
	});
</script>

<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div class="container">

		<div class="row">
			<div class="col-sm-12">
				<div class="tab-content">
					<div class="media-body">
						<div class="card mt-4">
							<div class="card-header bg-primary text-white font-weight-bold">결제</div>
							<div class="container">
								<div class="card-body">
									<table class="table">
										<thead class="thead">
											<tr>
												<th>호텔명</th>
												<th>객실</th>
												<th>가격</th>
												<th>이용날짜</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${hotelName}</td>
												<td>${roomName}</td>
												<td>${roomPrice}원</td>
												<td>${start}~${end}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="media-body col-sm-8 mt-3">
				<div class="card">
					<div class="card-header bg-primary text-white font-weight-bold">결제
						수단</div>
					<div class="container">
						<div class="card-body">
							<table class="table">
								<thead class="thead">
									<tr>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="payhow" id="cash">무통장
												입금
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="payhow" id="card">카드
												결제
											</label>
										</div>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="media-body col-sm-4 mt-3">
				<div class="card">
					<div class="card-header bg-primary text-white font-weight-bold">최종결제
						정보</div>
					<div class="container">
						<div class="card-body">
							<table class="table">
								<thead class="thead">
									<tr>
										<th>결제 금액</th>
										<th>${roomPrice}원</th>
									</tr>
									<tr>
										<th>할인 금액</th>
										<th>0원</th>
									</tr>
								</thead>
							</table>
							<form method="POST">
								<input type="hidden" name="hotelName" value="${hotelName}" /> 
								<input type="hidden" name="roomName" value="${roomName}" /> 
								<input type="hidden" name="roomPrice" value="${roomPrice}" /> 
								<input type="hidden" name="start" value="${start}" /> 
								<input type="hidden" name="end" value="${end}" /> 
								<input type="hidden" name="id" value="${id}" /> 
								<input type="hidden" name="tel" value="${tel}" /> 
								<input type="hidden" name="roomNo" value="${roomNo}" /> 
								<input type="hidden" name="action" value="makeReservation" />
								<button type="submit" class="btn btn-lg btn-primary btn-block btn-payment">결제</button>
							</form>
							<form method="POST">
							<input type="hidden" name="action" value="cancel" />
								<button type="submit" class="btn btn-lg btn-secondary btn-block btn-cancle mt-4">취소</button>
								</form>
								
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>