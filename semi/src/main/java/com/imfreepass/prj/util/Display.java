package com.imfreepass.prj.util;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.imfreepass.prj.domain.AttachDTO;

@WebServlet("/display")
public class Display extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // 파라미터에서 필요한 정보를 추출하여 AttachDTO 객체를 생성
            AttachDTO dto = new AttachDTO();
            String path = req.getParameter("path");
            String origin = req.getParameter("origin");
            String uuid = req.getParameter("uuid");
            String image = req.getParameter("image");
            dto.setUuid(uuid);
            dto.setPath(path);
            dto.setOrigin(origin);

            // 서블릿 응답OutputStream 생성
            OutputStream os = resp.getOutputStream();

            // 파일이 존재하는지 확인
            if (dto.toFile(true, 1).exists()) {
                byte[] bytes = Files.readAllBytes(dto.toFile(true, 1).toPath());
                resp.setContentType(Files.probeContentType(dto.toFile(true, 1).toPath()));

                os.write(bytes);
            } else {
            	// 여기서 예외처리 해야하는데...음
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류가 발생했습니다.");
        }
    }
}
