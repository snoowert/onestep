package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.ProjectVO;

public interface ProjectDAO {

	List<ProjectVO> selectProjectList() throws SQLException;
	ProjectVO selectProjectByProjectId(int projectId) throws SQLException;
	
	void insertProject(ProjectVO pj) throws SQLException;
	void updateProject(ProjectVO pj) throws SQLException;
	void deleteProject(int projectId) throws SQLException;
	
	
	
}
