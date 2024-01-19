package com.imfreepass.prj.controller.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.ReplyVO;
import com.imfreepass.prj.service.ReplyService;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;

@WebServlet("/hotel/replyModify")
public class HotelReplyModify extends HttpServlet {
    private ReplyService replyService = ReplyService.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	MemberVO member = WebUtils.getMember(request);
		if (member == null) { // 비로그인시 로그인으로
			WebUtils.alert(response, "로그인 해주셔야 합니다!!", "/member/signin");
			return;
		}
		
        // 수정시 받을정보.
        String memberId = request.getParameter("memberid");
        String replyId = request.getParameter("replyid");
        Long replyNo = Long.parseLong(request.getParameter("replyno"));
        
        // 사용자로부터 입력받은 리뷰 데이터 추출
        String replyTitle = request.getParameter("replytitle");
        String replyContent = request.getParameter("replycontent");
        
        // hno와 ano를 겟파라미터
        Long hno = Long.parseLong(request.getParameter("hno"));
        Long ano = Long.parseLong(request.getParameter("ano"));
        
     // ReplyVO 객체 생성
        ReplyVO replyVO = new ReplyVO();
        replyVO.setReplyTitle(replyTitle);
        replyVO.setReplyContent(replyContent);
        replyVO.setReplyno(replyNo);
        
        // ReplyService를 사용하여 리뷰 저장
      
        System.out.println(replyId);
        System.out.println(replyTitle);
        System.out.println(replyContent);
        
        
		// if문
        if (memberId.equals(replyId)) {
            // 아이디가 일치하는 경우
        	replyService.modify(replyVO);
            WebUtils.alert(response, "댓글 수정 완료했습니다. 감사합니다.", "/hotel/room?ano=" + ano + "&hno=" + hno);
        } else {
            // 아이디가 일치하지 않는 경우
            WebUtils.alert(response, " 뜰수가 없어 여긴.", "/hotel/room?ano=" + ano + "&hno=" + hno);
            
        }

    }
}
