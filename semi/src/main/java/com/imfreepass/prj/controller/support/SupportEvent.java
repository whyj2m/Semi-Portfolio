package com.imfreepass.prj.controller.support;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CategoryVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.PageDto;
import com.imfreepass.prj.service.BoardService;

import lombok.extern.log4j.Log4j;


@WebServlet("/support/list/event")
@Log4j
public class SupportEvent extends HttpServlet{
	private BoardService boardService = BoardService.getInstance();
	 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/support/supportEvent.jsp").forward(req, resp);
	}
}
