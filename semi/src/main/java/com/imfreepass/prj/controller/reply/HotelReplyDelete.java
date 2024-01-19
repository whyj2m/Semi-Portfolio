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

@WebServlet("/hotel/replyDelete")
public class HotelReplyDelete extends HttpServlet {
    private ReplyService replyService = ReplyService.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	MemberVO member = WebUtils.getMember(request);
		if (member == null) { // 비로그인시 로그인으로
			WebUtils.alert(response, "로그인 해주셔야 합니다!!", "/member/signin");
			return;
		}
		
        // 삭제시 사용자정보 및 댓글번호 Get
        String memberId = request.getParameter("memberid");
        String replyId = request.getParameter("replyid");
        Long replyNo = Long.parseLong(request.getParameter("replyno"));
        
        // hno와 ano를 겟파라미터
        Long hno = Long.parseLong(request.getParameter("hno"));
        Long ano = Long.parseLong(request.getParameter("ano"));

        System.out.println(memberId == replyId);
        System.out.println(memberId);
        System.out.println(replyId);
        
		// if문
        if (memberId.equals(replyId)) {
            // 아이디가 일치하는 경우
            replyService.delete(replyNo);
            WebUtils.alert(response, "댓글 삭제 하셨습니다! 후회x", "/hotel/room?ano=" + ano + "&hno=" + hno);
        } else {
            // 아이디가 일치하지 않는 경우
            WebUtils.alert(response, "해당 리뷰는 당신의 것이 아닙니다.", "/hotel/room?ano=" + ano + "&hno=" + hno);
            
        }

    }
}
