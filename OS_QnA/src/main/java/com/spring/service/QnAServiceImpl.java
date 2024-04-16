package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dao.AnswerDAO;
import com.spring.dao.QnADAO;
import com.spring.dto.AnswerVO;
import com.spring.dto.QnAVO;

public class QnAServiceImpl implements QnAService {

	private QnADAO QnaDAO;
	public void setQnADAO(QnADAO qnaDAO) {
		this.QnaDAO = qnaDAO;
	}
	
	private AnswerDAO answerDAO;
	public void setAnswerDAO(AnswerDAO answerDAO) {
		this.answerDAO = answerDAO;
	}
	
	@Override
	public List<QnAVO> searchList(PageMaker pageMaker) throws SQLException {
		List<QnAVO> QnAList = QnaDAO.selectSearchQnAList(pageMaker);
		
		if(QnAList.size() > 0 ) {
			for (QnAVO qna : QnAList) {
				int qnaid = qna.getQnaid();
				List<AnswerVO> answerList = answerDAO.selectAnswerList(qnaid);
				qna.setAnswerlist(answerList);
			}
		}
		pageMaker.setTotalCount(QnaDAO.selectSearchQnAListCount(pageMaker));
		
		return QnAList;
	}
	
	@Override
	public void increaseViewCnt(int qnaid) throws SQLException {
	
		QnaDAO.increaseViewCnt(qnaid);		
	
	}
	
	@Override
	public QnAVO getQnA(int qnaid) throws SQLException {
		QnAVO qna = QnaDAO.selectQnAByQnAId(qnaid);
		qna.setAnswerlist(answerDAO.selectAnswerList(qnaid));
		return qna;
	}
	
	@Override
	public QnAVO detail(int qnaid) throws SQLException {
		
		return QnaDAO.selectQnAByQnAId(qnaid);
	}

	
	@Override
	public void regist(QnAVO qna) throws SQLException {
		
		int qnaid = QnaDAO.selectQnASeqNext();
		qna.setQnaid(qnaid);
		QnaDAO.insertQnA(qna);
		
	}
	
	@Override
	public void modify(QnAVO qna) throws SQLException {
		
		QnaDAO.updateQnA(qna);
		
	}
	
	@Override
	public void remove(int qnaid) throws SQLException {
		
		QnaDAO.deleteQnA(qnaid);
		
	}

	@Override
	public AnswerVO readanswer(int answerid) throws SQLException {
		
		return answerDAO.selectAnswerByAnswerId(answerid);
	}

	@Override
	public void registAnswer(AnswerVO answer, int answerid) throws SQLException {

		answer.setAnswerid(answerid);
		answerDAO.insertAnswer(answer);
		
	}

	@Override
	public void modifyAnswer(AnswerVO answer, int answerid) throws SQLException {

		answerDAO.updateAnswer(answer);
		
	}

	@Override
	public void deleteAnswer(int answerid) throws SQLException {

		answerDAO.deleteAnswer(answerid);
		
	}
	
}
