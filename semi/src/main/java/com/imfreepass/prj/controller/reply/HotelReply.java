package com.imfreepass.prj.controller.reply;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.ReplyVO;
import com.imfreepass.prj.domain.ReservationVO;
import com.imfreepass.prj.service.ReplyService;
import com.imfreepass.prj.service.ReservationService;
import com.imfreepass.prj.util.WebUtils;


@WebServlet("/hotel/reply")
public class HotelReply extends HttpServlet {
    private ReplyService replyService = ReplyService.getInstance();
    private ReservationService reservationService = ReservationService.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
     	
    	MemberVO member = WebUtils.getMember(request);
		if (member == null) {
			WebUtils.alert(response, "로그인 해주셔야 합니다. 회원가입 부탁드려요~", "/member/signin");
			return;
		}
		
        String replyTitle = request.getParameter("replytitle");
        String replyContent = request.getParameter("replycontent");
        String replyId = request.getParameter("memberid");
        String replyPointParam = request.getParameter("replypoint");
        
        Long hno = Long.parseLong(request.getParameter("hno"));
        Long ano = Long.parseLong(request.getParameter("ano"));

        // 예약 테이블 정보 가져오기
        List<ReservationVO> reservationList = reservationService.getListall();

        System.out.println(replyId);
        
        // 유효성 검사
        // 예약 테이블 정보를 이용하여 댓글을 작성할 수 있는지 확인
        boolean canPostComment = false;
        for (ReservationVO reservation : reservationList) {
//            System.out.println("reservation.getId(): " + reservation.getId());
//            System.out.println("replyId: " + replyId);
//            System.out.println(reservation.getHno());
//            System.out.println(hno);
            // 와... 진짜 여기서 equeals가 아니라 비교연산자 처리하다가 멘탈 나갔습니다 이거 궁금하네요
            if (reservation.getHno().equals(hno) && reservation.getId().equals(replyId)) {
                canPostComment = true;
                break;
            }
        }
        System.out.println(canPostComment);
        if (!canPostComment) {
            WebUtils.alert(response, "댓글을 작성할 권한이 없습니다. 호텔을 방문해주세요! ", "/hotel/room?ano=" + ano + "&hno=" + hno);
            return;
        }
        
        // bookno 가져와서 댓글에 넣으려고
        Long bookno = null;
        for (ReservationVO reservation : reservationList) {
            if (reservation.getId().equals(replyId) && reservation.getHno().equals(hno)) {
                bookno = reservation.getBookNo();
                break;
            }
        }

        System.out.println(bookno);
        
        // 별점 유효성 검사
        if (replyPointParam == null || replyPointParam.isEmpty()) {
            WebUtils.alert(response, "별점을 입력해야합니다, 1점이라도..", "/hotel/room?ano=" + ano + "&hno=" + hno);
            return;
        }
        // int로 전환 유효성을 통과하면
        int replyPoint = Integer.parseInt(replyPointParam);
        
    
        ReplyVO replyVO = new ReplyVO();
        replyVO.setId(replyId);
        replyVO.setReplyTitle(replyTitle);
        replyVO.setReplyContent(replyContent);
        replyVO.setReplyPoint(replyPoint);
        replyVO.setBookNo(bookno); // 댓글 작성 시 bookno 설정

        replyService.register(replyVO, hno);
        WebUtils.alert(response, "리뷰 등록이 완료되었습니다!! ", "/hotel/room?ano=" + ano + "&hno=" + hno);
    }
}

