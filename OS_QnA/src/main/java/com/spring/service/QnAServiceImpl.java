package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dao.AnswerDAO;
import com.spring.dao.QnADAO;
import com.spring.dto.AnswerVO;
import com.spring.dto.QnAVO;

public class QnAServiceImpl implements QnAService {

	private QnADAO QnADAO;
	public void setqnaDAO(QnADAO qnaDAO) {
		this.QnADAO = qnaDAO;
	}
	
	private AnswerDAO AnswerDAO;
	public void setanswerDAO(AnswerDAO answerDAO) {
		this.AnswerDAO = answerDAO;
	}
	
	@Override
	public List<QnAVO> searchList(PageMaker pageMaker) throws SQLException {
		List<QnAVO> QnAList = QnADAO.selectSearchQnAList(pageMaker);
		
		if(QnAList.size() > 0 ) {
			for (QnAVO qna : QnAList) {
				int qnaid = qna.getQnaid();
				List<AnswerVO> answerList = AnswerDAO.selectAnswerList(qnaid);
				qna.setAnswerlist(answerList);
			}
		}
		pageMaker.setTotalCount(QnADAO.selectSearchQnAListCount(pageMaker));
		
		return QnAList;
	}
	
	@Override
	public void increaseViewCnt(int qnaid) throws SQLException {
	
		QnADAO.increaseViewCnt(qnaid);		
	
	}
	
	@Override
	public QnAVO getQnA(int qnaid) throws SQLException {
		QnAVO qna = QnADAO.selectQnAByQnAId(qnaid);
		qna.setAnswerlist(AnswerDAO.selectAnswerList(qnaid));
		return qna;
	}
	
	@Override
	public QnAVO detail(int qnaid) throws SQLException {
		
		return QnADAO.selectQnAByQnAId(qnaid);
	}

	
	@Override
	public void regist(QnAVO qna) throws SQLException {
		
		int qnaid = QnADAO.selectQnASeqNext();
		qna.setQnaid(qnaid);
		QnADAO.insertQnA(qna);
		
	}
	
	@Override
	public void modify(QnAVO qna) throws SQLException {
		
		QnADAO.updateQnA(qna);
		
	}
	
	@Override
	public void remove(int qnaid) throws SQLException {
		
		QnADAO.deleteQnA(qnaid);
		
	}

	@Override
	public AnswerVO readanswer(int answerid) throws SQLException {
		
		return AnswerDAO.selectAnswerByAnswerId(answerid);
	}

	@Override
	public void registAnswer(AnswerVO answer, int answerid) throws SQLException {

		answer.setAnswerid(answerid);
		AnswerDAO.insertAnswer(answer);
		
	}

	@Override
	public void modifyAnswer(AnswerVO answer, int answerid) throws SQLException {

		AnswerDAO.updateAnswer(answer);
		
	}

	@Override
	public void deleteAnswer(int answerid) throws SQLException {

		AnswerDAO.deleteAnswer(answerid);
		
	}
	
}
