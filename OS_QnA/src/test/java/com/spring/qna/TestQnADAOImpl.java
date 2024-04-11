package com.spring.qna;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.spring.command.PageMaker;
import com.spring.dao.QnADAO;
import com.spring.dto.QnAVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestQnADAOImpl {

	@Autowired
	private QnADAO QnADAO;
	
	@Test
	public void selectSearchQnaList()throws Exception{
		PageMaker pageMaker = new PageMaker();
		List<QnAVO> qnaList = QnADAO.selectSearchQnaList(pageMaker);
		Assert.assertEquals(4, qnaList.size());
	}
	
	@Test
	public void testSelectQnAById() throws Exception{
		int testId = 1;
		QnAVO qna = QnADAO.selectQnAByQnAId(testId);
		Assert.assertEquals(qna.getQnaid(),testId);
	}

	int insertid = 5;
	@Test
	@Rollback
	
	public void testinsertQnA() throws Exception{
		QnAVO qna = new QnAVO();
		qna.setQnaid(insertid);
		qna.setQnatitle("질문있으용");
		qna.setQnacontent("왜 오류가 날까용");
		qna.setQnaregdate(new Date());
		qna.setQnaviewpoint(0);
		qna.setMemberid(2);
		
		QnADAO.insertQnA(qna);
		
		QnAVO getNot = QnADAO.selectQnAByQnAId(qna.getQnaid());
		
		Assert.assertEquals(qna.getQnaid(), getNot.getQnaid());
	}
	
	@Test
	@Rollback
	public void testupdateQnA() throws Exception{
		int testqnaId = 2;
		String testQnatitle = "질문";
		QnAVO targetfree = QnADAO.selectQnAByQnAId(testqnaId);
		
		Assert.assertNotEquals(testQnatitle, targetfree.getQnatitle());
		
		targetfree.setQnatitle(testQnatitle);
		QnADAO.updateQnA(targetfree);
		QnAVO getNot = QnADAO.selectQnAByQnAId(testqnaId);
		Assert.assertEquals(testQnatitle, getNot.getQnatitle());
	}
	
	@Test
	@Rollback
	public void testdeleteQnA() throws Exception{
		testinsertQnA();
		int testqnaId = 2;
		
		QnAVO targetfree = QnADAO.selectQnAByQnAId(testqnaId);
		Assert.assertEquals(insertid, targetfree.getQnaid());
		QnADAO.deleteQnA(insertid);
		QnAVO deleteQna = QnADAO.selectQnAByQnAId(insertid);
		Assert.assertNull(deleteQna);
	}
	
}
