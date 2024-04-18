package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO{
	
	private SqlSession sqlsession;
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public List<ProjectVO> selectProjectList() throws SQLException {
		return sqlsession.selectList("Project-Mapper.selectProjectList");
	}

	@Override
	public ProjectVO selectProjectByProjectId(int projectId) throws SQLException {
		return sqlsession.selectOne("Project-Mapper.selectProjectByProjectId");
	}

	@Override
	public void insertProject(ProjectVO pj) throws SQLException {
		sqlsession.insert("Project-Mapper.insertProject", pj);
		
		
	}

	@Override
	public void updateProject(ProjectVO pj) throws SQLException {
		sqlsession.update("Project-Mapper.updateproject", pj);
		
	
	}

	@Override
	public void deleteProject(int projectId) throws SQLException {
		sqlsession.update("Project-Mapper.deleteProject", projectId);
	}
	
	

}
