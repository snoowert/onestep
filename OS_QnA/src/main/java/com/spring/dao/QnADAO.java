package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.QnAVO;

public interface QnADAO {

	List<QnAVO> selectSearchQnaList(PageMaker pageMaker) throws SQLException;
	int selectSearchQnAListCount(PageMaker pageMaker) throws SQLException;
	QnAVO selectQnAByQnAId(int qnaid) throws SQLException;
	int selectQnASeqNext() throws SQLException;
	
	
	void insertQnA(QnAVO qna) throws SQLException;
	void updateQnA(QnAVO qna) throws SQLException;
	void increaseViewCnt(int qnaid) throws SQLException;
	void deleteQnA(int qnaid) throws SQLException;
}
