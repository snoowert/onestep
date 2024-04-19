package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dao.ProjectDAO;
import com.spring.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService{
	
	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}

	@Override
	public List<ProjectVO> list(PageMaker pageMaker) throws SQLException {
		return projectDAO.selectProjectList(pageMaker);
	}

	@Override
	public ProjectVO feed(int projectId) throws SQLException {
		return projectDAO.selectProjectByProjectId(projectId);
	}

	@Override
	public void regist(ProjectVO pj) throws SQLException {
		projectDAO.insertProject(pj);
		
	}

	@Override
	public void modify(ProjectVO pj) throws SQLException {
		projectDAO.updateProject(pj);
		
	}

	@Override
	public void remove(int projectId) throws SQLException {
		projectDAO.deleteProject(projectId);
		
	}

}