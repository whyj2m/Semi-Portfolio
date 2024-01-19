package com.imfreepass.prj.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.AskBoardVO;
import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.service.AskBoardService;
import com.imfreepass.prj.service.AttachService;
import com.imfreepass.prj.service.BoardService;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;

/*
 * 1:1 문의 들어온 내용 올라온 것 > 관리자 답변도 달아야함 ㅠ ㅠ 
 * 
 */
@Log4j
@WebServlet("/adminList/ask")
public class AdminAsk extends HttpServlet {
	private BoardService boardService = BoardService.getInstance();
	private AttachService attachService = AttachService.getInstance();
	private AskBoardService askboardService = AskBoardService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO member = WebUtils.getMember(req);
		if (member == null || !member.getId().equals("admin")) { // 비로그인시 로그인으로
			WebUtils.alert(resp, "비정상적인 접근입니다");
			resp.sendRedirect("/member/signin");
			return;
		}
		String category = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");

		CriteriaVO.CriteriaVOBuilder cb = CriteriaVO.builder();
		if (category != null) {
			cb.category(Integer.parseInt(category));
		}
		if (pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if (amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		CriteriaVO criteria = cb.build();
		if (req.getParameter("bno") == null) {
			WebUtils.alert(resp, "없는 게시글 번호입니다.", "admin/adminList?" + criteria.getQs());
			return;
		}
		Long bno = Long.valueOf(req.getParameter("bno"));
		BoardVO boardVO = boardService.get(bno);
		attachService.getList(bno);
		
		req.setAttribute("askboard", askboardService.get(bno));
		req.setAttribute("cri", criteria);
		req.setAttribute("board", boardVO);
		req.setAttribute("attach", attachService.getList(bno));
		req.getRequestDispatcher("/WEB-INF/views/admin/AdminAsk.jsp").forward(req, resp);

	}
	// 1:1 문의 답변 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AskBoardVO.AskBoardVOBuilder aa = AskBoardVO.builder();
		
		String bno = req.getParameter("bno");
		String content = req.getParameter("content");
		
		if(bno != null) {
			aa.bno(Long.valueOf(bno));
		}
		if(content != null) {
			aa.content(content);
		}
		
		AskBoardVO askBoardVO = aa.build();
		
		log.info(askBoardVO);
		if(askboardService.askinsert(askBoardVO) > 0) {
			WebUtils.alert(resp, "등록이 완료되었습니다", "");
		}
	}
	

}
