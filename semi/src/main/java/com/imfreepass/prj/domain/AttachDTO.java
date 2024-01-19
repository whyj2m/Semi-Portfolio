package com.imfreepass.prj.domain;

import java.io.File;

import lombok.Data;

@Data
public class AttachDTO {
	public static final String UPLOAD_PATH = "C:/goodchoice";
	
	private String uuid;
	private String origin;
	private String path;
	private boolean image;
	
	// 원본 이미지 경로
	public String getUrl() {
		return "";
	}
	
	// 섬네일 이미지 경로
	public String getThumb() {
		if(!image) return "";
		return "";
//		return UriComponentsBuilder.fromPath("")
//				.queryParam("uuid", "s_" + uuid)
//				.queryParam("origin", origin)
//				.queryParam("path", path)
//				.toUriString();
	}
	
	// dto to file
	public File toFile() {
		return toFile(false);
	}
	// dto to file
	public File toFile(boolean thumb) {
		File file = new File(UPLOAD_PATH, path);
		file = new File(file, (thumb ? "s_" : "") + uuid + "_" + origin);
		return file;
	}
	
	public File toFile(boolean hotel, int i) {
		File file = new File(UPLOAD_PATH, path);
		file = new File(file, uuid);
		return file;
	}
}
