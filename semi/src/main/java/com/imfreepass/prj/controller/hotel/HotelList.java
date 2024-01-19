package com.imfreepass.prj.controller.hotel;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.AreaVO;
import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.domain.RoomVO;
import com.imfreepass.prj.service.AreaService;
import com.imfreepass.prj.service.HotelService;
import com.imfreepass.prj.service.ReplyService;
import com.imfreepass.prj.service.RoomService;

import lombok.extern.log4j.Log4j;



@WebServlet({"/hotel/2051", "/hotel/2052", "/hotel/2053", "/hotel/2055" })
public class HotelList extends HttpServlet {
	 private HotelService hotelService = HotelService.getInstance();
	 private AreaService areaService = AreaService.getInstance();
	 private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

	 
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	String in = req.getParameter("in");
		 	String out = req.getParameter("out");
		 	
		 	if(in == null || out == null) {
		 		in = sdf.format(new Date());
		 		out = sdf.format(new Date().getTime() + 86400 * 1000);
		 	}
		 
		 	String uri = req.getRequestURI();
		 	Long ano = Long.parseLong(uri.substring(uri.indexOf("hotel")+6));
		 	
		 	List<HotelVO> hotelVOs = hotelService.getlist(ano);
		 	List<AreaVO> areaVOs = areaService.getAreaList();

		 	req.setAttribute("hotels", hotelVOs);
		 	req.setAttribute("ano", ano);
		 	req.setAttribute("areas", areaVOs);
		 	req.setAttribute("in", in);
		 	req.setAttribute("out", out);
		
		 	System.out.println(uri);
		    
	
	        req.getRequestDispatcher("/WEB-INF/views/hotel/hotelList.jsp").forward(req, resp);
	    }
	}
