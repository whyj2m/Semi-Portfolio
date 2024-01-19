package com.imfreepass.prj.util;

import java.io.File;
import java.util.Properties;

import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

public class UploadUtils {
	
	public static String REPOSITORY;
	static {
		Properties prop = System.getProperties();
		if(prop.get("os.name").toString().toLowerCase().contains("windows")) {
			REPOSITORY = "c:/upload";
		}
		else {
			REPOSITORY = "/Users/kimjeong-yeon/Desktop/src";
		}
	}
	public static String CHARSET = "utf-8";
	public static int INIT_SIZE_THRESHOLD = 1024 * 1024;
	
	private static DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
	static {
		
	File file = new File(REPOSITORY); // 위치 지정역할 
	diskFileItemFactory.setRepository(file);
	diskFileItemFactory.setDefaultCharset(CHARSET);
	diskFileItemFactory.setSizeThreshold(INIT_SIZE_THRESHOLD);
	}
	public static ServletFileUpload init() {
		return new ServletFileUpload(diskFileItemFactory);
	}
}
