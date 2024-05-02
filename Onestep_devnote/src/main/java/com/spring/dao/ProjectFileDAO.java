package com.spring.dao;

import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.ProjectFileVO;

public interface ProjectFileDAO {
	
	List<ProjectFileVO> selectProjectFileList(PageMaker pageMaker) throws Exception;
	
	ProjectFileVO selectProjectFileByFileId(int fileId) throws Exception;
	
	public int selectProjectFileListCount(PageMaker pageMaker)throws Exception;
	int selectProjectFileIdSeqNext() throws Exception;
	void insertProjectFile(ProjectFileVO projectFile) throws Exception;
	void increaseProjectFileDownCnt(int fileId)throws Exception;
	
	void deleteProjectFile(int fileId) throws Exception;
	

}
