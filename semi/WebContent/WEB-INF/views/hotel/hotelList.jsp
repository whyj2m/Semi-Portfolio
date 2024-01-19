<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제주어때 - 제주시/제주국제공항</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
    integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha512-YK1Mz9UiZmhbFzXgMbl3bO49wZ78Xj3h8TtTBLFHEAEjUBxsEZdXd8Il5RWbhPOyB653bGQDNVGGny2mORZq4A=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    
    
    <script>
        $(function () {
            $('input[name="datefilter"]').daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                }
            });

            $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
            });

            $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });
            $('.btn-number').click(function(e){
            e.preventDefault();
            
            fieldName = $(this).attr('data-field');
            type      = $(this).attr('data-type');
            var input = $("input[name='"+fieldName+"']");
            var currentVal = parseInt(input.val());
            if (!isNaN(currentVal)) {
                if(type == 'minus') {
                    
            if(currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            } 
            if(parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if(parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
        });
        $('.input-number').focusin(function(){
        $(this).data('oldValue', $(this).val());
        });
        $('.input-number').change(function() {
            
            minValue =  parseInt($(this).attr('min'));
            maxValue =  parseInt($(this).attr('max'));
            valueCurrent = parseInt($(this).val());
            
            name = $(this).attr('name');
            if(valueCurrent >= minValue) {
                $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
            } else {
                alert('Sorry, the minimum value was reached');
                $(this).val($(this).data('oldValue'));
            }
            if(valueCurrent <= maxValue) {
                $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
            } else {
                alert('Sorry, the maximum value was reached');
                $(this).val($(this).data('oldValue'));
            }
        });

        $(".input-number").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                // Allow: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) || 
                // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
            }
	            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });
     });
    </script>
</head>
<body>
    <div class="header bg-primary">
        <div class="container">
            <jsp:include page="../includes/header.jsp"></jsp:include>
        </div>
    </div>
    <div class="top">
        <div class="top bg-primary">
            <div class="container">
                <h2 class="pt-5 pl-4 text-light"> 호텔 / 리조트</h2>
                    <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
				    <!-- Links -->
				    <ul class="navbar-nav">
				        <li class="nav-item dropdown">
				            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				                <c:choose>
				                    <c:when test="${area.ano == 2051}">
				                        제주 > 제주시/제주국제공항
				                    </c:when>
				                    <c:when test="${area.ano == 2052}">
				                        제주 > 서귀포
				                    </c:when>
				                    <c:when test="${area.ano == 2053}">
				                        제주 > 애월
				                    </c:when>
				                    <c:when test="${area.ano == 2055}">
				                        제주 > 중문
				                    </c:when>
				                    <c:otherwise>
				                        다른 지역
				                    </c:otherwise>
				                </c:choose>
				            </a>
				            <div class="dropdown-menu">
				                <a class="dropdown-item" href="${cp}/hotel/2051"> 제주시/제주국제공항 </a>
				                <a class="dropdown-item" href="${cp}/hotel/2052""> 서귀포 </a>
				                <a class="dropdown-item" href="${cp}/hotel/2053""> 애월 </a>
				                <a class="dropdown-item" href="${cp}/hotel/2055""> 중문 </a>
				            </div>
				        </li>
				    </ul>
				</nav>
            </div>
        </div>
    </div>
    <div class="content container p-3 row mx-auto mt-4">
        <div class="filter col-3 border border-light rounded mr-5">
            <div class="datepick m-3 pb-3 border-bottom">
                <div>
                    <h4>날짜</h4>
                </div>
                <div class="datepick mt-3 mb-3 ">
                    <input type="text" name="datefilter" value="" />
                </div>
            </div>
            <div class="m-3 pb-3 border-bottom">
                <h4>상세조건</h4>
                <div class="btn w-100 p-0">
                    <button type="button" class="btn btn-primary col-6 p-2">초기화</button>
                    <button type="button" class="btn btn-primary col-6 p-2">적용</button>
                </div>
            </div>
            <div class="m-3 pb-3 h6">
                <div class="form-check form-check-inline ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                    <label class="form-check-label" for="inlineCheckbox1">예약가능</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                    <label class="form-check-label" for="inlineCheckbox2">프로모션</label>
                </div>
            </div>
            <div class="m-3 pb-3 h5">
                <h4> 인원 </h4>
                <div class="row">
                    <div class="mx-auto">
                        <div class="input-group">
                            <span class="input-group-prepend">
                                <button type="button" class="btn btn-outline-secondary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                    <span class="fa fa-minus"></span>
                                </button>
                            </span>
                            <input type="text" name="quant[1]" class="form-control input-number text-center" value="1" min="1" max="10">
                            <span class="input-group-append">
                                <button type="button" class="btn btn-outline-secondary btn-number" data-type="plus" data-field="quant[1]">
                                    <span class="fa fa-plus"></span>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-3 pb-3 h6">
                <h4 class="mb-4"> 공용시설 </h4>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                    <label class="form-check-label" for="inlineCheckbox3">피트니스</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
                    <label class="form-check-label" for="inlineCheckbox4">수영장</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
                    <label class="form-check-label" for="inlineCheckbox5">사우나</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
                    <label class="form-check-label" for="inlineCheckbox6">골프장</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
                    <label class="form-check-label" for="inlineCheckbox7">레스토랑</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option8">
                    <label class="form-check-label" for="inlineCheckbox8">엘레베이터</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option9">
                    <label class="form-check-label" for="inlineCheckbox9">라운지</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option10">
                    <label class="form-check-label" for="inlineCheckbox10">공용PC</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option11">
                    <label class="form-check-label" for="inlineCheckbox11">BBQ</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox12" value="option12">
                    <label class="form-check-label" for="inlineCheckbox12">카페</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox13" value="option13">
                    <label class="form-check-label" for="inlineCheckbox13">공용스파</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox14" value="option14">
                    <label class="form-check-label" for="inlineCheckbox14">족구장</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox15" value="option15">
                    <label class="form-check-label" for="inlineCheckbox15">세미나실</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox16" value="option16">
                    <label class="form-check-label" for="inlineCheckbox16">편의점</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox17" value="option17">
                    <label class="form-check-label" for="inlineCheckbox17">노래방</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox18" value="option18">
                    <label class="form-check-label" for="inlineCheckbox18">주방/식당</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox19" value="option19">
                    <label class="form-check-label" for="inlineCheckbox19">세탁기</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox20" value="option20">
                    <label class="form-check-label" for="inlineCheckbox20">건조기</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox21" value="option21">
                    <label class="form-check-label" for="inlineCheckbox21">탈수기</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox22" value="option22">
                    <label class="form-check-label" for="inlineCheckbox22">주차장</label>
                </div>
            </div>
            <div class="m-3 pb-3 h6">
                <h4 class="mb-4"> 객실 내 시설 </h4>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox23" value="option23">
                    <label class="form-check-label" for="inlineCheckbox23">객실스파</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox24" value="option24">
                    <label class="form-check-label" for="inlineCheckbox24">미니바</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox25" value="option25">
                    <label class="form-check-label" for="inlineCheckbox25">와이파이</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox26" value="option26">
                    <label class="form-check-label" for="inlineCheckbox26">욕실용품</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox27" value="option27">
                    <label class="form-check-label" for="inlineCheckbox27">TV</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox28" value="option28">
                    <label class="form-check-label" for="inlineCheckbox28">에어컨</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox29" value="option29">
                    <label class="form-check-label" for="inlineCheckbox29">냉장고</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox30" value="option30">
                    <label class="form-check-label" for="inlineCheckbox30">객실샤워실</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox31" value="option31">
                    <label class="form-check-label" for="inlineCheckbox31">욕조</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox32" value="option32">
                    <label class="form-check-label" for="inlineCheckbox32">드라이기</label>
                </div>
                <div class="form-check form-check-inline mb-4 ">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox33" value="option33">
                    <label class="form-check-label" for="inlineCheckbox33">다리미</label>
                </div>
                <div class="form-check form-check-inline mb-4">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox34" value="option34">
                    <label class="form-check-label" for="inlineCheckbox34">전기밥솥</label>
                </div>
            </div>
        </div> 	
        <div class="list col-8 border border-light rounded">
            <div class="btn-group w-100 border-dark btn-sort-group">
                <button type="button" class="btn btn-info col-4 border border-right">추천순</button>
                <button type="button" class="btn btn-info col-4">높은 가격순</button>
                <button type="button" class="btn btn-info col-4">낮은 가격순</button>
            </div>
            <div class="pt-4">
            <c:forEach items="${areas}" var="area">
			    <c:if test="${area.ano == ano}">
			        <h2><span class="badge badge-pill badge-info">${area.cdesc}</span></h2>
			    </c:if>
			</c:forEach>
            </div>
            <div class="list-hotels">
       		<c:forEach items="${hotels}" var="hotel">
			    <div class="card bg-secondary text-white mb-1" data-avg="${hotel.avg}" data-price="${hotel.price}">
			        <a href="${pageContext.request.contextPath}/hotel/room?ano=${hotel.ano}&hno=${hotel.hno}&in=${in}&out=${out}" style="background: url('${pageContext.request.contextPath}/display?path=${hotel.ano}/${hotel.hno}&uuid=0.jpg') no-repeat center; background-size:cover;">
			        <img class="card-img" src="https://placehold.co/702x351/0004/0000" alt="Card image" >
			        <div class="info card-img-overlay col-8 pt-5 d-flex align-items-end">
			            <div class="mb-3 text-white">
			                <span class="badge badge-danger">${hotel.hotelGrade}</span>
			                <h3 class="card-title">${hotel.hotelName}</h3>
			                 <b class="badge badge-warning"> 리뷰 : ${hotel.replyCnt}건</b><h5><span class="badge badge-warning">${hotel.avg}점</span></h5>
			                <p class="card-text">${hotel.hotelAddr}</p>
			            </div>
			        </div>
			        </a>
			        <div class="text-center h5 bg-secondary mb-0">
			            <span class="text-light"><b> ${hotel.price}원</b></span>
			        </div>
			    </div>
			</c:forEach>
			</div>
        </div>
    </div>
     <script>
     
     // 추천순 ~ 낮은가격순 클릭이벤트
    $(function() {
    	$(".btn-sort-group button:eq(0)").click(function() {
        	$(".list-hotels").html($(".list-hotels > *").sort(function(a, b) {
        		return $(b).data("avg") - $(a).data("avg")
        	}));
    	})
    	$(".btn-sort-group button:eq(1)").click(function() {
        	$(".list-hotels").html($(".list-hotels > *").sort(function(a, b) {
        		return $(b).data("price") - $(a).data("price")
        	}));
    	})
    	$(".btn-sort-group button:eq(2)").click(function() {
        	$(".list-hotels").html($(".list-hotels > *").sort(function(a, b) {
        		return $(a).data("price") - $(b).data("price")
        	}));
    	})
    })
    </script>
</body>
</html>