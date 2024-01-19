package com.imfreepass.prj.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.MemberVO;


public class WebUtils {
	public static MemberVO getMember(HttpServletRequest req) {
        MemberVO member = null;
        if (req.getSession().getAttribute("member") != null) {
            member = (MemberVO)req.getSession().getAttribute("member");
        }
        return member;
    }
	
	public static void alert(HttpServletResponse resp, String msg, String url, boolean back) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw1 = resp.getWriter();
		pw1.write("<script>\r\n");
		pw1.write("alert('"+msg+"')\r\n");
		if(url != null) {
			pw1.write("location.href = '" +url +"'");
		}
		if(back) {
			pw1.println("history.back();");
		}
		pw1.write("</script>\r\n");
	}
	public static void alert(HttpServletResponse resp, String msg) throws IOException {
		alert(resp, msg, null);
		
	}
	public static void alert(HttpServletResponse resp, String msg, String url) throws IOException {

		alert(resp, msg, url, false);
	}
	public static void alert(HttpServletResponse resp, String msg, boolean back) throws IOException {
		alert(resp, msg, null, true);
	}
	
}
