package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.AnswerVO;
import com.spring.dto.QnAVO;

public interface QnAService {
	
	//목록
	List<QnAVO> searchList(PageMaker pageMaker) throws SQLException;
	
	//읽기
	void increaseViewCnt(int qnaid)throws SQLException;

	QnAVO getQnA(int qnaid) throws SQLException;
	
	QnAVO detail(int qnaid) throws SQLException;
	
	//등록
	void regist(QnAVO qna)throws SQLException;
	
	//수정
	void modify(QnAVO qna) throws SQLException;
	
	//삭제
	void remove(int qnaid) throws SQLException;
	 
	AnswerVO readanswer(int answerid) throws SQLException;
	
	void registAnswer(AnswerVO answer) throws SQLException;
	
	void modifyAnswer(AnswerVO answer, int answerid) throws SQLException;
	
	void deleteAnswer(int answerid) throws SQLException;
}
