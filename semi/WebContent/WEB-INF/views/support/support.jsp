<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

    $(function () {
        $(".slider").bxSlider({
            pager: false,
            controls: false,
            auto: true,
            pause: 2000,
            autoHover: true,
            mode: 'fade',
            speed: 200
        });
    })
</script>

<body>
    <div class="container">
       <jsp:include page="../includes/header.jsp"></jsp:include>

        <section>
            <div class="row">
                <!-- 왼쪽메뉴 -->
                <div class="col-sm-2 mt-5">
                    <h2 class="text-center mb-3">고객센터</h2>
                    <nav class="navbar bg">
						<ul class="list-group list-group-flush">
							<a href="${cp}/support/list?category=1"
								class="list-group-item list-group-item-action border border-left-0 border-right-0 ${pageDto.cri.category == 1 ? 'active' : ''}">공지사항
							</a>
							<a href="${cp}/support/list?category=2"
								class="list-group-item list-group-item-action border border-left-0 border-right-0 ${pageDto.cri.category == 2 ? 'active' : ''}">자주찾는질문
							</a>
							<a href="${cp}/support/ask"
								class="list-group-item list-group-item-action">1:1문의</a>
							
							<a href="${cp}/support/list/event"
								class="list-group-item list-group-item-action border border-left-0 border-right-0">이벤트
							</a>
						</ul>
					</nav>
                </div>

                <!-- 검색창 -->
                <div class="col-sm-7">
                    <h2 class="text-left mb-3 mt-5">제주어때 고객센터입니다. 무엇을 도와드릴까요?</h2>

                   
					
                    <!-- 자주찾는 질문 -->
                    <br>
                    <div class="clearfix">
                            <h4 class="mt-2 text-dark float-left">자주찾는질문</h4>
                        <a href="${cp}/support/list?category=2" class="float-right mt-2 text-dark">
                            <h6>더보기 <i class="fas fa-angle-right"></i></h6>
                        </a>
                    </div>

                    <div id="accordion ">
                       <c:forEach items="${supportlist}" var="l">
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
                        
                       
                        <!-- 이벤트 -->
                        <div class="clearfix">
                            <a href="${cp}/support/list/event" class="float-left">
                                <h4 class="mt-5 text-dark">이벤트</h4>
                            </a>
                            <a href="${cp}/support/list/event" class="float-right mt-5 text-dark">
                                <h6>더보기 <i class="fas fa-angle-right"></i></h6>
                            </a>
                        </div>
                        <!-- 하단 배너 -->
                        <div class="mt-2">
                            <div class="slider">
                                <div class="slide">
                                    <img src="https://image.goodchoice.kr/images/cms/home_img/3c13f7bf4ea5ef67729fa285aca7896f.jpg" alt="이미지 1">
                                </div>
                                <div class="slide">
                                    <img src="https://image.goodchoice.kr/images/cms/home_img/bc49aab10cec81991feb9d51ae6f59e0.png" alt="이미지 2">
                                </div>
                            </div>
                        </div>
                        
                    </div>

                </div>

                <!-- 오른쪽1:1문의 -->
                <div class="col-sm-3">
                    <h2 class="text-center mb-3 mt-5">1:1문의하기</h2>
                    <div class="card ">
                        <div class="card-body">1:1문의 <br>
                            궁금하신 사항을 남겨주세요.

                        </div>
                        <div class="row mx-auto">
                            <a type="button" class="btn btn-outline-primary mr-4 mb-2" href="${cp}/support/ask">문의하기</a>
                            <a type="button" class="btn btn-outline-primary mb-2" href="#">문의내역확인</a>
                        </div>
                    </div>

                    <!-- 공지사항 -->
                    <div class="clearfix border border-left-0 border-right-0 border-bottom-0 mt-4">
                        <a href="${cp}/support/list?category=1" class="float-left">
                            <h4 class="mt-2 text-dark">공지사항</h4>
                        </a>
                        <a href="${cp}/support/list?category=1" class="float-right mt-2 text-dark">
                            <h6>더보기 <i class="fas fa-angle-right"></i></h6>
                        </a>
                    </div>

                    <div id="accordion ">
                        <!-- 공지사항1 -->
                        <c:forEach items="${faq}" var="l">
							<div
								class="card border border-left-0 border-right-0 border-bottom-0">
								<div class="card-header bg-white">
									<a class="card-link text-dark bg-basic" data-toggle="collapse"
										href="#${l.bno}"> ${l.title}
									</a>
								</div>
								<div id="${l.bno}" class="collapse" data-parent="#accordion">
									<div class="card-body">${l.content}</div>
								</div>
							</div>
						</c:forEach>
                        
                        
                        
                    </div>

                    <!-- 카드 배너 -->
                    <div class="card mt-3">
                        <div class="card-body">
                            <h6>고객센터</h6>
                            <h4>1234-1234</h3>
                        </div>
                    </div>
                    <div class="card mt-3 mb-3">
                        <div class="card-body">
                            <h6>호텔 광고 문의</h6>
                            <h4>1234-1234</h3>
                        </div>
                    </div>

                </div>
            </div>
            
            <jsp:include page="../includes/footer.jsp"></jsp:include>
            
        </section>
    </div>
</body>
</html>