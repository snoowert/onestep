package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.QnAVO;

public interface QnAFileDAO {
	
	List<QnAVO> selectSearchQnAList(PageMaker pageMaker) throws SQLException;
	int selectSearchQnAListCount(PageMaker pageMaker) throws SQLException;
	QnAVO selectQnAByQnAId(int qna) throws SQLException;
	
	
}
