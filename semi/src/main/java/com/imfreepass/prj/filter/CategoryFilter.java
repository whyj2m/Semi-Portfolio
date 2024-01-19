package com.imfreepass.prj.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.imfreepass.prj.service.CategoryService;
import com.imfreepass.prj.service.MemberService;

/*
 * 김정연 
 * list.jsp에서 쓸 카테고리 세팅 
 */
//@WebFilter("/*")
public class CategoryFilter implements Filter{
	private CategoryService categoryService = CategoryService.getInstance();
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setAttribute("categories", categoryService.getCategoryList());
	chain.doFilter(request, response);
	}
}
