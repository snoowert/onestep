package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dao.CalendarDAO;
import com.spring.dao.ProjectDAO;
import com.spring.dto.CalendarVO;
import com.spring.dto.ProjectVO;

public class ProjectServiceImpl implements ProjectService{
	
	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}
	
	private CalendarDAO calendarDAO;
	public void setCalendarDAO(CalendarDAO calendarDAO) {
		this.calendarDAO = calendarDAO;
	}

	@Override
	public List<ProjectVO> list(PageMaker pageMaker) throws SQLException {
		return projectDAO.selectProjectList(pageMaker);
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

	@Override
	public ProjectVO detail(int projectId) throws SQLException {
		return projectDAO.selectProjectByProjectId(projectId);
		
	}

	@Override
	public List<CalendarVO> calList(int projectId) throws SQLException {
		return calendarDAO.selectCalendarList(projectId);
	}

}
