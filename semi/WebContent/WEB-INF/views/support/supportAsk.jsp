<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>제주어때 고객센터</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
        integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha512-YK1Mz9UiZmhbFzXgMbl3bO49wZ78Xj3h8TtTBLFHEAEjUBxsEZdXd8Il5RWbhPOyB653bGQDNVGGny2mORZq4A=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<script>
    $(document).ready(function () {
        $("#myBtn").click(function () {
            $("#myModal").modal();
        });
    });
</script>

<body>
    <div class="container">
        
        <jsp:include page="../includes/header.jsp"></jsp:include>

			<div class="row">
				<!-- 왼쪽메뉴 -->
				<div class="col-sm-2">

					<h2 class="text-center mb-3 text-decoration-none mt-5">
						<a class="text-decoration-none text-dark" href="${cp}/support">고객센터</a>
					</h2>

					<input type="hidden" name="category"
						value="${pageDto.cri.category}">


					<nav class="navbar bg">
						<div class="list-group list-group-flush">
							<a href="${cp}/support/list?category=1"
								class="list-group-item list-group-item-action border border-left-0 border-right-0 ${pageDto.cri.category == 1 ? 'active' : ''}">공지사항
							</a>
							<a href="${cp}/support/list?category=2"
								class="list-group-item list-group-item-action border border-left-0 border-right-0 ${pageDto.cri.category == 2 ? 'active' : ''}">자주찾는질문
							</a>
							<a href="${cp}/support/ask"
								class="list-group-item list-group-item-action active">1:1문의</a>
							<a href="${cp}/support/list/event"
								class="list-group-item list-group-item-action border border-left-0 border-right-0">이벤트
							</a>
						</div>
					</nav>
        
                </div>


                <div class="col-sm-10">

                    <!-- 자주찾는 질문 -->
                    <br>
                    <div class="clearfix mt-5">
                        <a href="" class="float-left">
                            <h4 class="text-dark">1:1문의하기</h4>
                        </a>

                        <!-- <a href="#" class="float-right mt-2 text-dark">
                            <button type="button" class="btn btn-outline-primary mr-4 mb-2">문의하기</button>
                        </a> -->
                    </div>


                    <div>
                        <i class="far fa-question-circle"></i> 문의하시기 전 확인해주세요<br>
                        - 고객님의 소중한 의견을 빠르고 정확하게 해결하기위해 문의는 꼼꼼하게 남겨주세요<br>
                        - 문의에 대한 답변은 1:1문의내역에서 확인하실 수 있습니다.

                            <form method="post" enctype="multipart/form-data">
                        <table class="table mt-4">
                                <tbody>
                                    <tr>
                                        <td class="col-sm-3 text-center border"><strong>문의유형</strong></td>
                                        <td class="border">

                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="asktype" id="asktype"
                                                        value="예약변경" checked>예약변경
                                                </label>
                                            </div>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="asktype" id="asktype" value="예약취소">예약취소
                                                </label>
                                            </div>
                                            <div class="form-check-inline disabled">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="asktype" id="asktype" value="예약환불">예약환불
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-center border"><strong>작성자</strong></td>
                                        <!-- 멤버에서 자동으로 가져와야됌 -->
                                        <td class="border">${member.id}</td>
                                        <input type="hidden" name="id" value="${member.id}">
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-center border align-middle"><strong>예약번호</strong></td>
                                        <td class="border">

                                            <div class="form-group">
                                                <input type="text" class="form-control mb-1" id="bookno"
                                                    placeholder="예약번호를 입력해주세요." name="bookno" required>
                                                <div class="invalid-feedback">예약번호는 반드시 작성해야합니다.</div>
                                                <h6 class="text-secondary">예약번호를 등록해주세요(영문+숫자 조합)<br>
                                                    문의 내용과 관련된 예약번호를 입력해주세요.</h6>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-center border align-self-center"><strong>답변알림</strong>
                                        </td>
                                        <td class="border">
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input checked"
                                                       id="alram" name="alram" value="${member.tell}" checked>${member.tell}
                                                </label>
                                            </div>
                                            <div class="form-check-inline">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" value="${member.email}" name="alram" id="alram">
                                                    ${member.email}
                                                </label>
                                            </div>
                                            <a href="mypage.html"><button type="button" class="btn btn-outline-primary">정보 수정</button></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-center border align-middle"><strong>제목</strong></td>
                                        <td class="border">
                                            <div class="form-group">
                                                <input type="text" class="form-control mt-3" id="title" name="title" placeholder="제목을 입력해주세요"
                                                    id="asktitle">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-center border align-middle"><strong>문의내용</strong></td>
                                        <td class="border">
                                            <div class="form-group">
                                                <textarea class="form-control" rows="5" name="content" id="content"
                                                    placeholder="최대 3000자까지 가능합니다. 문의할 내용을 입력해주세요."></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- <form method="post" enctype="multipart/form-data"></form> -->
                                        <td class="col-sm-3 text-center border"><strong>파일첨부</strong></td>
                                        <td class="border">
                                            <input type="file" class="form-control-file border" name="files" multiple="multiple">
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                    	<button type="submit" class="btn btn-primary float-right" >등록하기</button>
                        </form>
                    </div>    
                </div>
            </div>
    </div>


    <jsp:include page="../includes/footer.jsp"></jsp:include>

</body>

</html>