package com.spring.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RegistFileCommand {
	
	private String projectFileId;
	private List<MultipartFile> uploadFile;
	private String projectFileName;
	private String projectFileType;
	
	
	
	public String getProjectFileId() {
		return projectFileId;
	}
	public void setProjectFileId(String projectFileId) {
		this.projectFileId = projectFileId;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getProjectFileName() {
		return projectFileName;
	}
	public void setProjectFileName(String projectFileName) {
		this.projectFileName = projectFileName;
	}
	public String getProjectFileType() {
		return projectFileType;
	}
	public void setProjectFileType(String projectFileType) {
		this.projectFileType = projectFileType;
	}


	

}
