package com.spring.service;


import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dao.ProjectFileDAO;
import com.spring.dto.ProjectFileVO;

public class ProjectFileServiceImpl implements ProjectFileService{
	
	private ProjectFileDAO projectFileDAO;
	public void setProjectFileDAO(ProjectFileDAO projectFileDAO) {
		this.projectFileDAO = projectFileDAO;
	}

	@Override
	public List<ProjectFileVO> fileList(PageMaker pageMaker) throws Exception {
		return projectFileDAO.selectProjectFileList(pageMaker);
	}

	@Override
	public void uploadFile(ProjectFileVO projectFile) throws Exception {
		projectFileDAO.insertProjectFile(projectFile);
	}

	@Override
	public void deleteFile(int fileId) throws Exception {
		projectFileDAO.deleteProjectFile(fileId);
	}

	@Override
	public void increaseDownCnt(int fileId) throws Exception {
		projectFileDAO.increaseProjectFileDownCnt(fileId);
	}

	@Override
	public ProjectFileVO getFileByFileId(int fileId) throws Exception {
		return projectFileDAO.selectProjectFileByFileId(fileId);
	}

	@Override
	public void removeFileByFileId(int fileId) throws Exception {
		projectFileDAO.deleteProjectFile(fileId);
		
	}

}