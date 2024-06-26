package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.CalendarVO;
import com.spring.dto.ProjectVO;

public interface ProjectService {
	
	List<ProjectVO> list(PageMaker pageMaker) throws SQLException;

	
	ProjectVO detail(int projectId) throws SQLException;
	
	void regist(ProjectVO pj) throws SQLException;
	void modify(ProjectVO pj) throws SQLException;
	void remove(int projectId) throws SQLException;
	
	
	
	
	// 달력
	List<CalendarVO> calList(int projectId) throws SQLException;
	void calInsert(CalendarVO cal) throws SQLException;
	void calDelete(int id) throws SQLException;

}
