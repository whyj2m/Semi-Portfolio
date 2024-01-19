package com.imfreepass.prj.domain;


import java.io.File;

import com.imfreepass.prj.util.UploadUtils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AttachVO {
	private String askuuid;
	private String origin;
	private String askpath;
	private Long bno; // 문의번호
	
	public File toFile() {
		return new File(UploadUtils.REPOSITORY + "/" + askpath, askuuid);
	}
}
