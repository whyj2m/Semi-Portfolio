package com.imfreepass.prj.mapper;

import org.junit.Test;

import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class CategoryMapperTests {
	private CategoryMapper categoryMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(CategoryMapper.class);
	
	@Test
	public void testGetCategoryList() {
		categoryMapper.getCategoryList().forEach(i -> log.info(i));
	}
}
