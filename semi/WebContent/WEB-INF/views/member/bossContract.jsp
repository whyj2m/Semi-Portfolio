<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 모두 동의 버튼 클릭시 버튼 전부다 체크
    function selectAll(selectAll) {
      const checkboxes = document.querySelectorAll('input[type="checkbox"]');
      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
      });

      enableButtonIfThreeChecked();
    }

    function enableButtonIfThreeChecked() {
      const checkboxes = document.querySelectorAll('input[name="example1"]:checked');
      const button = $('button');
      if (checkboxes.length >= 3) {
        button.prop('disabled', false);
      } else {
        button.prop('disabled', true);
      }
    }

    $(document).ready(function() {
      $('input[name="example1"]').change(function() {
        enableButtonIfThreeChecked();
      });
    });
  </script>
</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>




	<div class="container d-flex justify-content-center">
		<div class="row m-5">
			<form action="/action_page.php">
				<div class="custom-control custom-checkbox mb-3">
					<input type="checkbox" class="custom-control-input"
						id="customCheck1" name="example1" value="selectAll"
						onclick='selectAll(this)'> <label
						class="custom-control-label" for="customCheck1">모두 동의 합니다</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
					<input type="checkbox" class="custom-control-input"
						id="customCheck2" name="example1"> <label
						class="custom-control-label" for="customCheck2">이용약관 동의<strong>(필수)</strong></label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
					<input type="checkbox" class="custom-control-input"
						id="customCheck3" name="example1"> <label
						class="custom-control-label" for="customCheck3">개인정보 수집.이용
						동의<strong>(필수)</strong>
					</label>
				</div>
				<div class="custom-control custom-checkbox mb-3">
					<input type="checkbox" class="custom-control-input"
						id="customCheck4" name="example1"> <label
						class="custom-control-label" for="customCheck4">개인정보 이용 동의<strong>(필수)</strong></label>
				</div>

			</form>
			<button onclick="location.href='bossSignup'" type="button" class="btn btn-primary w-50 rounded p-2 bg-primary flex-fill" name="next" disabled>다음</button>
		</div>
	</div>



	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>

</html>