package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.command.PageMaker;
import com.spring.dto.QnAVO;

public class QnADAOImpl implements QnADAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<QnAVO> selectSearchQnaList(PageMaker pageMaker) throws SQLException {
		return session.selectList("QnA-Mapper.selectSearchQnaList",pageMaker);
	}
	
	@Override
	public void insertQnA(QnAVO qna) throws SQLException {
		session.insert("QnA-Mapper.insertQnA",qna);	
	}

	@Override
	public void updateQnA(QnAVO qna) throws SQLException {
		session.update("QnA-Mapper.updateQnA",qna);		
	}

	@Override
	public void increaseViewCnt(QnAVO qna) throws SQLException {
		//이 이거 맞나요
	}

	@Override
	public int selectSearchQnAListCount(PageMaker pageMaker) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QnAVO selectQnAByQnAId(int qnaid) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteQnA(int qnaid) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectQnASeqNext() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
