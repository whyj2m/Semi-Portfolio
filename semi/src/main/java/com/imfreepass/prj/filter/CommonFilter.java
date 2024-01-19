package com.imfreepass.prj.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/*
 * 김정연
 * 필터랑 인코딩 미리 세팅 
 */
@WebFilter(urlPatterns = "/*", initParams = @WebInitParam(name="encoding", value="utf-8"))
public class CommonFilter implements Filter{
	private String encoding;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");
		filterConfig.getServletContext().setAttribute("cp", filterConfig.getServletContext().getContextPath());
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
		
	}

	
}
