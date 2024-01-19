<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>나는야 제주어때</title>
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
    <script>
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
        // 슬라이더2
        $(function () {
            $(".slider2").bxSlider({
                pager: false,
                auto: true,
                pause: 3000,
                autoHover: true,
                mode: 'fade',
                speed: 200
            });
        })
        $(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});
    </script>
</head>

<body>
    <div class="container">
        
        <jsp:include page="includes/header.jsp"></jsp:include>

        <!-- 배너 -->
        <section class="mt-3">
            <div class="slider">
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/display?path=/main&uuid=0.jpg" alt="이미지 1">
                </div>
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/display?path=/main&uuid=1.jpg" alt="이미지 2">
                </div>
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/display?path=/main&uuid=2.jpg" alt="이미지 3">
                </div>
                <!-- <div class="slide">
                    <img src="https://placehold.co/1100x480" alt="이미지 4">
                </div> -->
            </div>
        </section>
        <section>
		    <h3 class="mb-3">지금 JEJU에서 만나보세요 ! </h3>
		    <div class="row">
		        <c:forEach items="${hotels}" var="hotel" begin="0" end="3"> 
		            <div class="col-12 col-sm-6 col-xl-3">
		                <a href="/hotel/room?ano=${hotel.ano}&hno=${hotel.hno}" style="background: url('${pageContext.request.contextPath}/display?path=${hotel.ano}/${hotel.hno}&uuid=0.jpg') no-repeat center; background-size: cover;">
		                    <div class="card border-0">
							    <img class="card-img-top" src="https://placehold.co/200x200/0004/0000" alt="Card image">
							    <div class="card-img-overlay text-center mt-5">
							        <h4 class="text-white align-middle ">${hotel.hotelname}</h4>
							        <h4><p class="text-white badge badge-pill badge-warning"><strong class="">${hotel.cdesc}</strong></p></h4>
							    </div>
							        <a href="/hotel/room?ano=${hotel.anos}&hno=${hotel.hno}" class="btn btn-warning mt-auto">지금 예약하기</a>
							</div>
		                </a>
		            </div>
		        </c:forEach>
		    </div>
		    <!-- 긴 배너 -->
		  <div class="banner mt-5 text-center">
		    <a href="" class="d-block">
		        <img class="img-fluid mx-auto" src="${pageContext.request.contextPath}/display?path=/main&uuid=long1.png" alt="긴배너 1">
		    </a>
		    <a href="" class="d-block mt-3">
		        <img class="img-fluid mx-auto" src="${pageContext.request.contextPath}/display?path=/main&uuid=long2.png" alt="긴배너 2">
		    </a>
		</div>
		</section>
        <!-- 호텔 리스트 -->
        <section>
            <div class="row mt-5 clearfix">
                <c:forEach items="${hotels}" var="hotel" begin="4" end="12"> 
                	<a href="/hotel/room?ano=${hotel.ano}&hno=${hotel.hno}" style="background: url('${pageContext.request.contextPath}/display?path=${hotel.ano}/${hotel.hno}&uuid=0.jpg') no-repeat center; background-size: cover;">
                	<div class="card col-12 col-sm-6 col-xl-3 border-light mb-3">
                    <img class="card-img-top" src="https://placehold.co/200x200/0004/0000" alt="Card image">
                    <div class="card-body text-center">
                        <h4 class="card-title h5 font-weight-bold text-dark">${hotel.hotelname}</h4>
                        <h5><p class="text-white badge badge-pill badge-warning "><strong class="">${hotel.cdesc}</strong></p></h5>
                        <div class="card-text float-right h6 text-dark"><strong>${hotel.price} 원</strong></div>
                        <br>
                        <a href="/hotel/room?ano=${hotel.ano}&hno=${hotel.hno}"  class="btn btn-block btn-primary mt-2"> 확인하기 </a>
                    </div>
                </div>
                    </a>
                </c:forEach>
            </div>
        </section>

        <!-- 슬라이더2 -->
        <section class="mt-3">
            <div class="slider2">
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/display?path=/main&uuid=3.jpg" alt="이미지 3">
                </div>
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/display?path=/main&uuid=4.jpg" alt="이미지 4">
                </div>
                <div class="slide">
                    <img src="${pageContext.request.contextPath}/display?path=/main&uuid=5.jpg" alt="이미지 5">
                </div>
            </div>
        </section>
        
        <jsp:include page="includes/footer.jsp"></jsp:include>

    </div>
</body>


</html>