package com.imfreepass.prj.mapper;

import java.util.Date;

import com.imfreepass.prj.domain.EmailVO;

public interface MailMapper {
	
	void insertCode(String email, String code, Date expiresTime);
	
	String getCode(String email);
	
	EmailVO get(String email);
}
