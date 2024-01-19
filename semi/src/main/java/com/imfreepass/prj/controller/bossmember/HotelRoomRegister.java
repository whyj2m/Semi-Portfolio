package com.imfreepass.prj.controller.bossmember;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.RoomImageVO;
import com.imfreepass.prj.domain.RoomVO;
import com.imfreepass.prj.service.HotelService;
import com.imfreepass.prj.service.RoomService;
import com.imfreepass.prj.util.UploadUtils;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;

/*
 * 김정연
 * 서비스 테스트 이후 마무리 예정 
 */
@Log4j
@WebServlet("/bossmember/roomregister")
public class HotelRoomRegister extends HttpServlet {
	private RoomService roomservice = RoomService.getInstance();
	private HotelService hotelService = HotelService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO member = WebUtils.getMember(req);
		if (member == null) {
			resp.sendRedirect("/member/signin");
			return;
		}
		req.setAttribute("hotel", hotelService.getHotel(member.getId()));
		req.getRequestDispatcher("/WEB-INF/views/bossmember/roomregister.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberVO member = WebUtils.getMember(req);
		ServletFileUpload fileUpload = UploadUtils.init();

		List<FileItem> items = fileUpload.parseRequest(new ServletRequestContext(req));
		log.warn(items);
		log.warn(items.size());
		RoomVO.RoomVOBuilder rr = RoomVO.builder();

		List<RoomImageVO> attachs = new ArrayList<>();
		for (FileItem fi : items) {
			if (fi.isFormField()) {
				if (fi.getFieldName().equals("roomName")) {
					rr.roomName(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("roomPrice")) {
					rr.roomPrice(Integer.parseInt(fi.getString("utf-8")));
				} else if (fi.getFieldName().equals("comment")) {
					rr.comment(fi.getString("utf-8"));
				} else if (fi.getFieldName().equals("hno")) {
					rr.hno(Long.valueOf(fi.getString("utf-8")));
				}
			} else {
				System.out.printf("파라미터 명 : %s, 파일명 : %s, 파일 크기 : %d \n", fi.getFieldName(), fi.getName(),
						fi.getSize());
				try {
					String origin = fi.getName();
					String ext = "";
					if (origin.lastIndexOf(".") != -1) {
						ext = origin.substring(origin.lastIndexOf("."));
					}
					String uuid = UUID.randomUUID() + ext;
					String todayPath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
					File path = new File(UploadUtils.REPOSITORY, todayPath);
					if (!path.exists()) {
						path.mkdirs();
					}
					fi.write(new File(path, uuid));
					attachs.add(RoomImageVO.builder().uuid(uuid).origin(origin).path(todayPath).build());

				} catch (Exception e) {

					e.printStackTrace();
				}
			}
		}

		RoomVO roomVO = rr.attachs(attachs).build();
		log.info(attachs);
		roomservice.register(roomVO);
		log.info(roomVO);
		WebUtils.alert(resp, "등록이 완료되었습니다.", "/bossmember/roomlist");
	}
}
