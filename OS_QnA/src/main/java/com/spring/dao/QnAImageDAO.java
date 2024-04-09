package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.QnAImageVO;
import com.spring.dto.QnAVO;

public interface QnAImageDAO {
	
	List<QnAVO> selectSearchQnAList(int qnaid) throws SQLException;
	QnAVO selectQnAImageById(int qnaimageid) throws SQLException;
	
	
	void insertQnAimage(QnAImageVO qnaimage) throws SQLException;
	void deleteQnAimage(int qnaimageid) throws SQLException;
	void deleteAllimage(int qnaimageid) throws SQLException;
	
}
