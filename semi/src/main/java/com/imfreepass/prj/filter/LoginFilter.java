//package com.imfreepass.prj.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//
//import com.imfreepass.prj.domain.MemberVO;
//
//@WebFilter("/*")
//public class LoginFilter implements Filter{
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		((HttpServletRequest) request).setAttribute("member", MemberVO.builder().id("jung").name("사장님").grade(1).build());
//        chain.doFilter(request, response);
//		
//	}
//}
