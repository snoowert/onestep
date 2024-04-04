package com.pds.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.pds.vo.PdsVO;
import com.spring.command.PageMaker;

public class PdsDAOImpl implements PdsDAO{
	private SqlSession sqlsession;
	
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	@Override
	public List<PdsVO> selectSearchPdsList(PageMaker pageMaker) throws SQLException {
		// TODO Auto-generated method stub
		int offset = (pageMaker.getPage()-1)*pageMaker.getPerPageNum();
		int limmit = pageMaker.getPerPageNum();
		
		RowBounds rows = new RowBounds(offset,limmit);
		return sqlsession.selectList("Pds-Mapper.selectSearchPdsList" ,rows);
	}

	@Override
	public int selectSearchPdsListCount(PageMaker pageMaker) throws SQLException {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Pds-Mapper.selectSearchPdsListCount", pageMaker);
	}

	@Override
	public PdsVO selectPdsByPdsid(int pdsid) throws SQLException {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("Pds-Mapper.selectPdsByPdsid", pdsid);
	}

	@Override
	public void insertPds(PdsVO pds) throws SQLException {
		// TODO Auto-generated method stub
		sqlsession.insert(statement)
	}

	@Override
	public void updatePds(PdsVO pds) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseViewPoint(int pdsid) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePds(int pdsid) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}
