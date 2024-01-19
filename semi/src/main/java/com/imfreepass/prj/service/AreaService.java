package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.AreaVO;
import com.imfreepass.prj.mapper.AreaMapper;
import com.imfreepass.prj.util.MybatisUtils;

public class AreaService {
	private AreaMapper areaMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(AreaMapper.class);
	
	private static AreaService instance = new AreaService();
	
	private AreaService() {}
	
	public static AreaService getInstance() {
		return instance;
	}
	
	public List<AreaVO> getAreaList() {
		return areaMapper.getAreaList();
	}
}
