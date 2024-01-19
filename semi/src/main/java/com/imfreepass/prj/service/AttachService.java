package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.AttachVO;
import com.imfreepass.prj.mapper.AttachMapper;
import com.imfreepass.prj.util.MybatisUtils;

public class AttachService {
	private AttachMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(AttachMapper.class);
	
	private static AttachService instance = new AttachService();
	
	private AttachService() {}
	
	public static AttachService getInstance() {
		return instance;
	}
	
	public void register(AttachVO vo) {
		mapper.insert(vo);
	}
	
	public boolean delete(String uuid) {
		return mapper.delete(uuid);
	}
	public boolean deleteAll(Long bno) {
		return mapper.deleteAll(bno);
	}
	public List<AttachVO> getList(Long bno){
		return mapper.findByBno(bno);
	}
}
