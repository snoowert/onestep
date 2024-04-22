package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO{
	
	private SqlSession sqlsession;
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public List<ProjectVO> selectProjectList(PageMaker pageMaker) throws SQLException {
		return sqlsession.selectList("Project-Mapper.selectProjectList", pageMaker);
	}

	@Override
	public ProjectVO selectProjectByProjectId(int projectId) throws SQLException {
		return sqlsession.selectOne("Project-Mapper.selectProjectByProjectId",projectId);
	}

	@Override
	public void insertProject(ProjectVO pj) throws SQLException {
		sqlsession.insert("Project-Mapper.insertProject", pj);
		
		
	}

	@Override
	public void updateProject(ProjectVO pj) throws SQLException {
		sqlsession.update("Project-Mapper.updateProject", pj);
		
	
	}

	@Override
	public void deleteProject(int projectId) throws SQLException {
		sqlsession.update("Project-Mapper.deleteProject", projectId);
	}

	@Override
	public int selectProjectListCount(PageMaker pageMaker) throws SQLException {
		return sqlsession.selectOne("Project-Mapper.selectProjectListCount", pageMaker);
	}

	@Override
	public int selectProjectSeqNext() throws SQLException {
		int seq = sqlsession.selectOne("Project-Mapper.selectProjectSeqNext");
		return seq;
	}
	
	

}
