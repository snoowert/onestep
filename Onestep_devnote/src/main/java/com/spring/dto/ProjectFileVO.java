package com.spring.dto;

import java.util.List;

public class ProjectFileVO {
	
	private int fileId;
	private String uploadPath;
	private String fileName;
	private int fileDownCnt;
	private int memberId;
	private int projectId;
	
	private List<ProjectFileVO> projectFileList;
	
	

	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileDownCnt() {
		return fileDownCnt;
	}
	public void setFileDownCnt(int fileDownCnt) {
		this.fileDownCnt = fileDownCnt;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	
	public List<ProjectFileVO> getProjectFileList() {
		return projectFileList;
	}
	public void setProjectFileList(List<ProjectFileVO> projectFileList) {
		this.projectFileList = projectFileList;
	}
	
	

}
