package com.onestep.free;

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


import com.onestep.dao.FreeCommentDAO;

import com.onestep.dto.FreeCommentVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/free/context/root-context.xml")
@Transactional
public class TestFreeCommentDAOImpl {

		@Autowired
		private FreeCommentDAO FreeCommentDAO;
		
		@Test
		public void testSelectFreeCommentList()throws Exception{

			List<FreeCommentVO> freecommentList = FreeCommentDAO.selectFreeCommentList(insertcommentid);
			Assert.assertEquals(3, freecommentList.size());
		}
		@Test
		public void testSelectFreeByCommentId()throws Exception{
			int testcommentid = 1;
			FreeCommentVO freecomment = FreeCommentDAO.selectFreeByCommentId(testcommentid);
			Assert.assertEquals(freecomment.getCommentid(), testcommentid);
		}

		
		int insertcommentid=4;
		@Test
		@Rollback

		public void testInsertFreeComment() throws Exception{
			FreeCommentVO freecomment = new FreeCommentVO();
			freecomment.setFreeid(2);
			freecomment.setCommentcontent("공지사항 내용 7");
			freecomment.setMemberid(3);
			freecomment.setCommentid(insertcommentid);
			
			FreeCommentDAO.insertFreeComment(freecomment);
			
			FreeCommentVO getNot = FreeCommentDAO.selectFreeByCommentId(freecomment.getCommentid());
			
			Assert.assertEquals(freecomment.getCommentid(), getNot.getCommentid());
		}

		@Test
		@Rollback
		public void testUpdateFreeComment() throws Exception{
			int testfreeid = 1;
			int testcommentid = 2;
			String testcommentcontent = "내용7";
			FreeCommentVO targetfreecomment = FreeCommentDAO.selectFreeByCommentId(testcommentid);
			
			Assert.assertNotEquals(testcommentcontent, targetfreecomment.getCommentcontent());
			
			targetfreecomment.setCommentcontent(testcommentcontent);
			
			FreeCommentDAO.updateFreeComment(targetfreecomment);
			
			FreeCommentVO getNot = FreeCommentDAO.selectFreeByCommentId(testcommentid);
			
			Assert.assertEquals(testcommentcontent, getNot.getCommentcontent());
		
		}

		@Test
		@Rollback
		public void testDeleteFreeComment() throws Exception{
	
			testInsertFreeComment();
			FreeCommentVO targetfreecomment = FreeCommentDAO.selectFreeByCommentId(insertcommentid);
			
			Assert.assertEquals(insertcommentid, targetfreecomment.getCommentid());
			
			FreeCommentDAO.deleteFreeComment(insertcommentid);
			
			FreeCommentVO deleteFreeComment = FreeCommentDAO.selectFreeByCommentId(insertcommentid);
			
			Assert.assertNull(deleteFreeComment);
		}
		
		
}
	