<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
        integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <!-- box slider -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
        <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        
        
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
        	// 박스슬라이더 스크립트
            $('.bxslider1').bxSlider({
	            pagerCustom: '#bx-pager'
	        });
        	
        	$("#bx-pager").bxSlider({
        		pager : false,
        		minSildes : 3,
        		maxSlides : 4,
        		/* controls:false */
        		slideWidth:200,
        		touchEnabled : false,
        		shrinkItems : true
        	});
            $('.bxslider2').bxSlider({
                mode: 'fade',
                captions: true,
                pager: false,
            });

           /*  $('input[name="datefilter"]').daterangepicker({
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
            }); */
           	
            // 댓글 리뷰 별점 클릭이벤트
            $(".starsreal i").click(function() {
                const idx = $(this).index();
                $(".starsreal i").removeClass("fas").addClass("far");
                $(".starsreal i:lt(" + (idx + 1) + ")").removeClass("far").addClass("fas");
                $(this).closest('.input-group').find('.replypoint').val(idx + 1); // input 요소에 값 설정
            });
            
            // 리뷰 TOP 평균평점 별 이벤트
            $(".btn-payment-proceed").click(function() {
             	const roomNo = $(this).val();
             	const start = '${in}'
             	const out = '${out}'
             	const member = '${member.id}'
             	/* if(!member) {
             		alert("예약은 로그인 이후 사용할 수 있습니다.")
             		return;
             	} */
             	console.log(roomNo, start, out, member);
             });
            
        });
    </script>
    <title> 제주어떄 어딘가의 룸</title>
</head>

<body>
    <div class="header bg-primary">
        <div class="container">
             <div class="container">
            <jsp:include page="../includes/header.jsp"></jsp:include>
        </div>
        </div>
    </div>

    <div class="container">
        <div class="content">
            <div class="top row pt-5 ">
          		<c:forEach var="hotel" items="${hotels}">
				    <div class="top_images col-7">
				        <ul class="bxslider1">
				             <c:forEach var="i" begin="0" end="${hotel.hotelImgCount - 1}">
				                <li>
				                    <img src="${pageContext.request.contextPath}/display?path=${hotel.ano}/${hotel.hno}&uuid=${i}.jpg" alt="FooBar${i + 1}" width="100%"  />
				                </li>
				            </c:forEach>
				        </ul>
				        <div id="bx-pager">
				            <c:forEach var="i" begin="0" end="${hotel.hotelImgCount - 1}">
				                <a data-slide-index="${i}" href="" class="mx-1">
				                    <img src="${pageContext.request.contextPath}/display?path=${hotel.ano}/${hotel.hno}&uuid=${i}.jpg" alt="FooBar${i + 1}"  />
				                </a>
				            </c:forEach>
				        </div>
				    </div>
				</c:forEach>
            <div class="col-5">
		  	<c:forEach var="hotel" items="${hotels}">
				    <div class="info pt-4">
				        <span class="badge badge-dark">${hotel.hotelGrade}</span>
				        <h2>${hotel.hotelName}</h2>
				        <div class="score">
				           <h5><span class="badge badge-pill badge-warning"> ${getAvg} POINT </span></h5>
				       	</div>
				        <p class="address">${hotel.hotelAddr}</p>
				    </div>
				    <div class="comment bg-light p-3">
				        <strong class="h4">사장님 한마디</strong>
				        <p class="mt-3">${hotel.hotelInfo}</p>
				    </div>
				</c:forEach>
	            </div>
	       </div>
            <ul class="nav nav-tabs mb-5 mt-4">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#room_book">객실안내/예약</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#room_info">숙소정보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#room_review">리뷰</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="room_book">
                    <!-- <div class="datepick mt-3 mb-3 ">                                 구현불가제거  
                        <strong>날짜선택</strong>
                        <input type="text" name="datefilter" value="" />
                    </div> -->
	            <c:forEach items="${rooms}" var="room" varStatus="roomStatus">							<!-- status정의해서 끝날떄마다 roomindex ++ -->
				    <div class="room row border-bottom pt-3 mt-3">
				        <div class="col-5">
				            <div class="bxslider2">
				                <c:forEach var="hotel" items="${hotels}">
				                    <c:set var="roomIndex" value="${roomStatus.index + 1}" />
				                    <c:forEach var="j" begin="0" end="${room.roomimgcount - 1}">
				                        <li>
				                            <img src="${pageContext.request.contextPath}/display?path=${hotel.ano}/${hotel.hno}/${roomIndex}/&uuid=${j}.jpg" width="100%" />
				                        </li>
				                    </c:forEach>
				                </c:forEach>
				            </div>
				        </div>
				    	        
				        <div class="info col-6 h5 mt-3">
				            <strong>${room.roomName}</strong>
				            <div class="price row display-5 pt-5 border-bottom">
				                <div class="col-sm-9">가격</div>
				                <div class="col-sm-3">${room.roomPrice} 원</div>
				            </div>
				           <div class="detail">
				                <button type="button" class="btn btn-outline-light btn-lg btn-block mt-5 pb-5" disabled></button>
				            </div>    
				            <div class="book">
				            <c:forEach var="hotel" items="${hotels}">
				            <form method="post" action="${pageContext.request.contextPath}/payment">
    							<input type="hidden" name="hotelName" value="${hotel.hotelName}" />
    							<input type="hidden" name="roomName" value="${room.roomName}" />
    							<input type="hidden" name="roomPrice" value="${room.roomPrice}" />
    							<input type="hidden" name="start" value="${in}" />
    							<input type="hidden" name="end" value="${out}" />
    							<input type="hidden" name="id" value="${member.id}" />
    							<input type="hidden" name="tel" value="${hotel.hotelTel}" />
    							<input type="hidden" name="roomNo" value="${room.roomNo}" />
				                <button type="submit" class="btn btn-warning text-dark btn-lg btn-block mt-5 btn-payment-proceed " value="${room.roomNo}">예약진행</button>
				                </form>
				                </c:forEach>
				            </div>
				        </div>
				    </div>
				</c:forEach>
                </div>
                <div class="tab-pane fade" id="room_info">
				    <c:choose>
				        <c:when test="${not empty rooms}">                        <!-- 객실이 있으면 위에!  -->
				            <div class="room_comment bg-light p-4">
				                ${rooms[0].comment}
				            </div>
				        </c:when>
				        <c:otherwise>										<!-- 없으면 아래에. -->
				            <h3> 코멘트는 없습니다. </h3>
				        </c:otherwise>
				    </c:choose>
				</div>
                <div class="tab-pane fade" id="room_review">
                    <div class="row border-bottom pb-5">
                        <div class="mx-auto text-center w-100">
                            <strong class="h4"> 최고에요 </strong>
                            <div class="starstop text-warning display h-0" style="font-size: 1.5rem;">
							    <i class="far fa-star ${getAvg >= 1 ? 'fas' : 'far'}"></i>
							    <i class="far fa-star ${getAvg >= 2 ? 'fas' : 'far'}"></i>
							    <i class="far fa-star ${getAvg >= 3 ? 'fas' : 'far'}"></i>
							    <i class="far fa-star ${getAvg >= 4 ? 'fas' : 'far'}"></i>
							    <i class="far fa-star ${getAvg >= 5 ? 'fas' : 'far'}"></i>
							</div>
							<h4><span class="badge badge-pill badge-warning">${getAvg} 점</span></h4>
                        </div>
                  	<div class="mx-auto text-center w-100 pt-3">
					    <p class="h4">전체리뷰</p>
					
					        <b class="strong h5">${getTotal} 건</b>
					  
					</div>
                    </div>
	                <div class="review_user pt-5">
					 <c:forEach items="${replys}" var="reply" >
					            <div class="user_top row mt-4">
					                <div class="m-4 col-1">
					                    <img src="${pageContext.request.contextPath}/display?path=icon/&uuid=user1.png">
					                </div>
					                <div class="col-9 m-3 pt-3">
					                    <div class="h5 font-weight-bold">${reply.replyTitle}</div>
					                    <div class="user_point">
					                        <strong class="h5 font-weight-bold">${reply.replyPoint}</strong>
					                        <div class="stars text-warning display h-0" style="font-size: 1.5rem; pointer-events: none;">
											    <i class="far fa-star ${reply.replyPoint >= 1 ? 'fas' : 'far'}"></i>
											    <i class="far fa-star ${reply.replyPoint >= 2 ? 'fas' : 'far'}"></i>
											    <i class="far fa-star ${reply.replyPoint >= 3 ? 'fas' : 'far'}"></i>
											    <i class="far fa-star ${reply.replyPoint >= 4 ? 'fas' : 'far'}"></i>
											    <i class="far fa-star ${reply.replyPoint >= 5 ? 'fas' : 'far'}"></i>
											</div>
					                    </div>
					                    <div class="pt-2">
					                        <strong class="font-italic">${reply.id}</strong>
					                    </div>
					                </div>
					            </div>
					            <div class="user_comment bg-light p-3">
					                <p class="mt-3">${reply.replyContent}</p>
					            </div>
					            <div class="float-right">
					         	   <!-- 댓글 수정 처리  -->
							       <button type="button" class="btn btn-light float-left" data-toggle="modal" data-target="#replyModal${reply.replyNo}" >수정</button>
								   <!-- 여기가 모달 창 뜨는거 -->
								   <form action="/hotel/replyModify" method="post" class="float-left">
								    	<input type="hidden" name="replyno" value="${reply.replyNo}">
									    <input type="hidden" name="replyid" value="${reply.id}">
									    <input type="hidden" name="memberid" value="${member.id}">   	
   	<!--여기서 ano,hno,id처리 -->	    <input type="hidden" name="ano" value="${param.ano}">
   										<input type="hidden" name="hno" value="${param.hno}">
										<div class="modal fade" id="replyModal${reply.replyNo}" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="replyModalLabel">${reply.id}님의 댓글 수정</h5>
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true">&times;</span>
										        </button>
										      </div>
										      <div class="modal-body">
											        <h5><span class="badge badge-pill badge-warning"> ${reply.replyPoint} POINT </span></h5>
											        <input class="w-100 mb-3"  type="text" name="replypoint" value="평점은 수정 불가능 합니다!" disabled>
											        <p class="font-italic"> 한줄리뷰 ▼</p>
											        <input class="w-100 mb-3"  type="text" name="replytitle" value="${reply.replyTitle}">
											        <p class="font-italic"> 메인리뷰 ▼</p>
											        <textarea class="w-100 mb-3" name="replycontent" style="width: 100%; height: 100px;">${reply.replyContent}</textarea>
										      </div>
										      <div class="modal-footer">
										        <input type="submit" name="modify" class="btn btn btn-warning" value="수정">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
										      </div>
										    </div>
										  </div>
										</div>
								 	</form>
								    <!-- 댓글삭제처리  -->
								    <form action="/hotel/replyDelete" method="post" class="float-left">
									    <input type="hidden" name="replyno" value="${reply.replyNo}">
									    <input type="hidden" name="replyid" value="${reply.id}">
									    <input type="hidden" name="memberid" value="${member.id}">   	
   	<!--여기서 ano,hno,id처리 -->	    <input type="hidden" name="ano" value="${param.ano}">
   										<input type="hidden" name="hno" value="${param.hno}">
									    <input type="submit" name="delete" class="btn btn-light" value="삭제">
									</form>
								</div>
								<fmt:formatDate value="${reply.replyDate}" pattern="yyyy/MM/dd  hh:mm" />
								<span class="date border-bottom mt-4 mb-4 text-right w-100">${formattedDate}</span>
					</c:forEach>
					</div>
               		<form action="/hotel/reply" method="post" class="review_form pt-5">
					    <div class="card mb-2">
					        <div class="card-header bg-light">
					            <i class="fa fa-comment fa"></i> 리뷰를 남겨주세요!
					        </div>
					        <div class="card-body">
					            <ul class="list-group list-group-flush">
					                <li class="list-group-item">
					                    <div class="form-inline mb-2">
					                        <label for="replytitle"><i class="fa fa-user-circle-o fa-2x"></i></label>
					                        <input type="text" class="form-control w-50" placeholder="한줄리뷰!" name="replytitle" id="replytitle">
					                        <div class="input-group h-50 ml-3 h-0">
											    <div class="starsreal text-warning display-1 h-0" style="font-size: 1.5rem;">
											        <i class="far fa-star"></i>
											        <i class="far fa-star"></i>
											        <i class="far fa-star"></i>
											        <i class="far fa-star"></i>
											        <i class="far fa-star"></i>    
											    </div>
<!-- d-none 으로 숨기기가능  -->			    <input class="replypoint text text-success h-0 ml-3 d-none" name="replypoint" id="replypoint">
											</div>
					                    </div>
					                    <textarea class="form-control" name="replycontent" id="replycontent" rows="4"></textarea>
	<!--여기서 ano,hno,id처리 -->	    <input type="hidden" name="ano" value="${param.ano}">
   										<input type="hidden" name="hno" value="${param.hno}">
   										<input type="hidden" name="memberid" value="${member.id}">   										
					                    <button type="submit" class="btn btn-dark mt-3">리뷰완료</button>
					                </li>
					            </ul>
					        </div>
					    </div>
					</form>
                </div>
            </div>
        </div>
	</div>
	
     <jsp:include page="../includes/footer.jsp"></jsp:include>
     
</body>
</html>