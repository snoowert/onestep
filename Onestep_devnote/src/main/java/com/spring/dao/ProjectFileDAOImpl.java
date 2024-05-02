package com.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.ProjectFileVO;

public class ProjectFileDAOImpl implements ProjectFileDAO{
	
	private SqlSession sqlsession;
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public List<ProjectFileVO> selectProjectFileList(PageMaker pageMaker) throws Exception {
		return sqlsession.selectList("ProjectFile-Mapper.selectProjectFileList", pageMaker);
	}

	@Override
	public ProjectFileVO selectProjectFileByFileId(int fileId) throws Exception {
		return sqlsession.selectOne("ProjectFile-Mapper.selectProjectFileByFileId", fileId);
	}

	@Override
	public int selectProjectFileListCount(PageMaker pageMaker) throws Exception {
		return sqlsession.selectOne("ProjectFile-Mapper.selectProjectFileListCount", pageMaker);
	}
 
	@Override
	public void insertProjectFile(ProjectFileVO projectFile) throws Exception {
		sqlsession.insert("ProjectFile-Mapper.insertProjectFile", projectFile);
	}

	@Override
	public void increaseProjectFileDownCnt(int fileId) throws Exception {
		sqlsession.update("ProjectFile-Mapper.increaseProjectFileDownCnt", fileId);
	}

	@Override
	public void deleteProjectFile(int fileId) throws Exception {
		sqlsession.delete("ProjectFile-Mapper.deleteProjectFile", fileId);
	}

	@Override
	public int selectProjectFileIdSeqNext() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("PorjectFile-Mapper.selectProjectFileIdSeqNext");
	}

}
