package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.QnAImageVO;
import com.spring.dto.QnAVO;

public class QnAImageDAOImpl implements QnAImageDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<QnAVO> selectSearchQnAList(int qnaid) throws SQLException {
		
		return session.selectList("QnAImage-Mapper.selectSearchQnAList", qnaid);
	}
	@Override
	public QnAVO selectQnAByQnAImageId(int qnaimageid) throws SQLException {
		
		return session.selectOne("QnAImage-Mapper.selectQnAByQnAImageId", qnaimageid);
	}
	@Override
	public void insertQnAimage(QnAImageVO qnaimage) throws SQLException {
		session.insert("QnA-Mapper.insertQnAimage",qnaimage);
		
	}
	@Override
	public void deleteQnAimage(int qnaimageid) throws SQLException {
		session.delete("QnA-Mapper.deleteQnAimage",qnaimageid);
		
	}
	@Override
	public void deleteAllimage(int qnaimageid) throws SQLException {
		session.delete("QnA-Mapper.deleteAllimage",qnaimageid);
		
	}
	
}	
