package com.imfreepass.prj.controller.bossmember;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
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
import com.imfreepass.prj.service.RoomImageService;
import com.imfreepass.prj.service.RoomService;
import com.imfreepass.prj.util.UploadUtils;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/bossmember/roommodify")
public class HotelRoomModify extends HttpServlet{
	private RoomService roomService = RoomService.getInstance();	
	private RoomImageService roomimageService = RoomImageService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (req.getParameter("roomNo") == null) {
			WebUtils.alert(resp, "없는 게시글 번호입니다.", "bossmember/roommodify?");
			return;
		}
			Long roomNo = Long.valueOf(req.getParameter("roomNo"));
			RoomVO roomVO = roomService.get(roomNo);
			log.info(roomNo);
			
		req.setAttribute("modify", roomVO);
		req.setAttribute("attach", roomimageService.get(roomNo));
		req.getRequestDispatcher("/WEB-INF/views/bossmember/roommodify.jsp").forward(req, resp);
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
				} else if (fi.getFieldName().equals("roomNo")) {
					rr.roomNo(Long.valueOf(fi.getString("utf-8")));
				}
				
			} else {
				System.out.printf("파라미터 명 : %s, 파일명 : %s, 파일 크기 : %d \n", fi.getFieldName(), fi.getName(),
						fi.getSize());
				try {
					String roomNo = req.getParameter("roomNo");
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
					if(fi.getSize() != 0) {
					attachs.add(RoomImageVO.builder().roomNo(Long.valueOf(roomNo)).uuid(uuid).origin(origin).path(todayPath).build());
					//log.info("리스트"+attachs);
					}
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
			
		}
		List<String> uuids = new ArrayList<>();
		for (RoomImageVO attach : attachs) {
			uuids.add(attach.getUuid());
		}

		RoomVO roomVO = rr.attachs(attachs).build();
		log.info(attachs);
		log.info("리스트:" + roomVO);
		if(roomimageService.modify(roomVO, uuids)) {
			WebUtils.alert(resp, "수정이 완료되었습니다", "/bossmember/roomlist");
		}
	}
}
