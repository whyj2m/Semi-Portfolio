package com.imfreepass.prj.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.service.AttachService;
import com.imfreepass.prj.service.BoardService;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;
@Log4j
@WebServlet("/adminList/remove")
public class AdminRemove extends HttpServlet{
	private BoardService boardService = BoardService.getInstance();
	private AttachService attachService = AttachService.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO member = WebUtils.getMember(req);
		if (member == null || !member.getId().equals("admin")) { // 비로그인시 로그인으로
			resp.sendRedirect("/member/signin");
			return;
		}	
		
		String bno = req.getParameter("bno");
		if(bno != null) {
		boardService.findBy(Long.valueOf(bno));
		log.info(boardService.findBy(Long.valueOf(bno)));
		
		
		String category = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
		CriteriaVO.CriteriaVOBuilder cb = CriteriaVO.builder();
		
		if(category != null) {
			cb.category(Integer.parseInt(category));
		}
		if(pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if(amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		
		CriteriaVO criteriaVO = cb.build();
		
		attachService.deleteAll(Long.valueOf(bno));
		boardService.delete(Long.valueOf(bno));
		
		WebUtils.alert(resp, "삭제되었습니다", req.getContextPath() + "/admin/adminList");
		}
		WebUtils.alert(resp, "비정상적인 접근입니다", req.getContextPath() + "/admin/adminList");
	}
}
