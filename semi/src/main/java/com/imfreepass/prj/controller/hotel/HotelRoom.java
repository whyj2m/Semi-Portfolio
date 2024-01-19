package com.imfreepass.prj.controller.hotel;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.ReplyVO;
import com.imfreepass.prj.domain.RoomVO;
import com.imfreepass.prj.mapper.ReplyMapper;
import com.imfreepass.prj.service.HotelService;
import com.imfreepass.prj.service.ReplyService;
import com.imfreepass.prj.service.RoomService;
import com.imfreepass.prj.util.WebUtils;



@WebServlet("/hotel/room")
public class HotelRoom extends HttpServlet {
    private RoomService roomService = RoomService.getInstance();
    private HotelService hotelService = HotelService.getInstance();
    private ReplyService replyService = ReplyService.getInstance();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
        String anoParam = req.getParameter("ano");
        String hnoParam = req.getParameter("hno");
        String roomPrice = req.getParameter("roomPrice");
        String roomName = req.getParameter("roomName");
        String in = req.getParameter("in");
        String out = req.getParameter("out");
        
        if(in == null || out == null) {
        	in = sdf.format(new Date());
        	out = sdf.format(new Date().getTime() + 86400 * 1000);
        }
        
        if (anoParam != null && hnoParam != null) {
            Long ano = Long.parseLong(anoParam);
            Long hno = Long.parseLong(hnoParam);
            
            
            
            List<RoomVO> roomVOs = roomService.getlist(hno);
            List<HotelVO> hotelVOs = hotelService.getlist(ano);
            List<ReplyVO> replyVOs = replyService.getlist(hno);
            
            List<HotelVO> filteredHotels = new ArrayList<>();
            for (HotelVO hotel : hotelVOs) {
                if (hotel.getHno().equals(hno)) {
                    filteredHotels.add(hotel);
                }
            }
            // hno param을 받아서 total에 전달 // 호텔번호 댓글총갯수 // 호텔평균댓글점수.
            int replyTotal = replyService.getTotal(hno); //
            int replyAvg = replyService.getAvg(hno);  
            
            req.setAttribute("hotels", filteredHotels);      
            req.setAttribute("rooms", roomVOs);
            req.setAttribute("replys", replyVOs);
                        
            //댓글 개시글 수확인!
            req.setAttribute("getTotal", replyTotal);
            req.setAttribute("getAvg", replyAvg);
            req.setAttribute("in", in);
            req.setAttribute("out", out);
        }
       
        req.getRequestDispatcher("/WEB-INF/views/hotel/hotelroom.jsp").forward(req, resp);
    }
}
