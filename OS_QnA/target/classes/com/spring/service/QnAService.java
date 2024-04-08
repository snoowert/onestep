package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.QnAVO;

public interface QnAService {
	
	//목록
	List<QnAVO> searchList(PageMaker pageMaker) throws SQLException;
	
	//등록
	void regist(QnAVO qna)throws SQLException;
	
	//읽기
	void increaseViewCnt(int qna)throws SQLException;
	
	
}
