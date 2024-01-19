package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.CategoryVO;
import com.imfreepass.prj.mapper.CategoryMapper;
import com.imfreepass.prj.util.MybatisUtils;

public class CategoryService {
	
	private CategoryMapper categoryMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(CategoryMapper.class);
	
	private static CategoryService instance = new CategoryService();
	
	private CategoryService() {}
	
	public static CategoryService getInstance() {
		return instance;
	}
	
	public List<CategoryVO> getCategoryList() {
		return MybatisUtils.sessionFactory().openSession(true).getMapper(CategoryMapper.class).getCategoryList();
	}
}
