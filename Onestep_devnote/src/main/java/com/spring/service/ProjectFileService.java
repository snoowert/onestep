package com.spring.service;

import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.ProjectFileVO;

public interface ProjectFileService {
	
	List<ProjectFileVO> fileList(PageMaker pageMaker)throws Exception;
	
	void uploadFile(ProjectFileVO projectFile) throws Exception;
	void deleteFile(int fileId) throws Exception;
	
	ProjectFileVO getFileByFileId(int fileId) throws Exception;
	void increaseDownCnt(int fileId) throws Exception;
	
	void removeFileByFileId(int fileId) throws Exception;
	
	
	
	
	
}	
	