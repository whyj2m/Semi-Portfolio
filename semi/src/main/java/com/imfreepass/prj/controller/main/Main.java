package com.imfreepass.prj.controller.main;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.service.CategoryService;
import com.imfreepass.prj.service.HotelService;

/*
 * 김정연
 * 메인 작동되나 테스트 해봄 
 * 
 */

@WebServlet("/main")
public class Main extends HttpServlet{
	private HotelService hotelService = HotelService.getInstance();
	private CategoryService categoryService = CategoryService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상단 카테고리 호텔리스트
	    List<Map<String, Object>> hotelVOs = hotelService.mainList();
	     
	    req.setAttribute("hotels", hotelVOs);
	    System.out.println(hotelVOs);
	    
	    req.getServletContext().setAttribute("categories", categoryService.getCategoryList());
	    req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}
}

