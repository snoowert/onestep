package com.spring.command;

import com.spring.dto.ProjectFileVO;

public class DeleteFileCommand extends RegistFileCommand{
	
	private int fileId;
	private int[] deleteFile;
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public int[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(int[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	
	@Override
	public ProjectFileVO toProjectFileVO() {
		ProjectFileVO projectFile = super.toProjectFileVO();
		projectFile.setFileId(this.fileId);
		
		return projectFile;
	}

}
