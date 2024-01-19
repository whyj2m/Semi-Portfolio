package com.imfreepass.prj.controller.admin;

import java.io.IOException;
import java.net.URLEncoder;
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

import com.imfreepass.prj.domain.AttachVO;
import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.service.AttachService;
import com.imfreepass.prj.service.BoardService;
import com.imfreepass.prj.util.UploadUtils;
import com.imfreepass.prj.util.WebUtils;

import java.io.File;
import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/adminList/register")
public class AdminRegister extends HttpServlet{
	private BoardService boardservice = BoardService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO member = WebUtils.getMember(req);
		if (member == null || !member.getId().equals("admin")) { // 비로그인시 로그인으로
			WebUtils.alert(resp, "비정상적인 접근입니다");
			return;
		}
		
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
		
		req.setAttribute("cri", criteriaVO);
		req.getRequestDispatcher("/WEB-INF/views/admin/AdminRegister.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ServletFileUpload fileUpload = UploadUtils.init();
		
		List<FileItem> items = fileUpload.parseRequest(new ServletRequestContext(req));
		BoardVO.BoardVOBuilder bb = BoardVO.builder();
		CriteriaVO.CriteriaVOBuilder cb = CriteriaVO.builder();
		
		List<AttachVO> attachs = new ArrayList<AttachVO>();
		for(FileItem fi : items) {
			if(fi.isFormField()) {
				if(fi.getFieldName().equals("id")) {
					bb.id(fi.getString("utf-8"));
				}else if(fi.getFieldName().equals("title")) {
					bb.title(fi.getString("utf-8"));
				}else if (fi.getFieldName().equals("content")) {
					bb.content(fi.getString("utf-8"));
				
				}else if (fi.getFieldName().equals("category")) {
					bb.category(Integer.parseInt(fi.getString("utf-8")));
				}else if (fi.getFieldName().equals("asktype")) {
					bb.asktype(fi.getString("utf-8"));
					
				} else if (fi.getFieldName().equals("pageNum")) {
					cb.pageNum(Integer.parseInt(fi.getString("utf-8")));

				} else if (fi.getFieldName().equals("amount")) {
					cb.amount(Integer.parseInt(fi.getString("utf-8")));
				}
				
				String category = req.getParameter("category");
				String pageNum = req.getParameter("pageNum");
				String amount = req.getParameter("amount");
				if (category != null) {
					cb.category(Integer.parseInt(category));
				}
				if (pageNum != null) {
					cb.pageNum(Integer.parseInt(pageNum));
				}
				if (amount != null) {
					cb.amount(Integer.parseInt(amount));
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
					String askuuid = UUID.randomUUID() + ext;
					String todayPath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
					File askpath = new File(UploadUtils.REPOSITORY, todayPath);
					if (!askpath.exists()) {
						askpath.mkdirs();
					}
					fi.write(new File(askpath, askuuid));
					attachs.add(AttachVO.builder().askuuid(askuuid).origin(origin).askpath(todayPath).build());
					
				} catch (Exception e) {

					e.printStackTrace();
				}
			}
		}
		
		CriteriaVO criteriaVO = cb.build();
		BoardVO boardVO = bb.attachs(attachs).build();
		log.info(criteriaVO);
		log.info(boardVO);
		boardservice.register(boardVO);
		// 등록 완료 팝업창 뭘로 띄우징 ? 
		//http://localhost:8080/admin/adminList?category=2
		resp.sendRedirect("/admin/adminList?category=" + boardVO.getCategory());
	}
}
