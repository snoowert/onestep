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

import com.onestep.command.PageMaker;
import com.onestep.dao.FreeDAO;
import com.onestep.dto.FreeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/free/context/root-context.xml")
@Transactional
public class TestFreeDAOImpl {

		@Autowired
		private FreeDAO FreeDAO;
		
		@Test
		public void testSelectFreeList()throws Exception{
			
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setPage(1); // 예시로 1페이지를 설정
		    pageMaker.setPerPageNum(10); // 예시로 페이지당 아이템 개수를 10으로 설정

			List<FreeVO> freeList = FreeDAO.selectFreeList(pageMaker);
			Assert.assertEquals(4, freeList.size());
		}
		@Test
		public void testSelectFreeByFreeid()throws Exception{
			int testfreeid = 1;
			FreeVO free = FreeDAO.selectFreeByFreeId(testfreeid);
			Assert.assertEquals(free.getFreeid(), testfreeid);
		}

		int insertfreeid = 5;
		@Test
		@Rollback

		public void testInsertFree() throws Exception{
			FreeVO free = new FreeVO();
			free.setFreeid(insertfreeid);
			free.setFreecontent("공지사항 내용 7");
			free.setFreeregdate(new Date());
			free.setFreeviewpoint(0);
			free.setFreetitle("자유게시판 제목 7");
			free.setMemberid(3);
			
			FreeDAO.insertFree(free);
			
			FreeVO getNot = FreeDAO.selectFreeByFreeId(free.getFreeid());
			
			Assert.assertEquals(free.getFreeid(), getNot.getFreeid());
		}

		@Test
		@Rollback
		public void testUpdateFree() throws Exception{
			int testfreeid = 1;
			String testfreetitle = "제목7";
			FreeVO targetfree = FreeDAO.selectFreeByFreeId(testfreeid);
			
			Assert.assertNotEquals(testfreetitle, targetfree.getFreetitle());
			
			targetfree.setFreetitle(testfreetitle);
			
			FreeDAO.updateFree(targetfree);
			
			FreeVO getNot = FreeDAO.selectFreeByFreeId(testfreeid);
			
			Assert.assertEquals(testfreetitle, getNot.getFreetitle());
		
		}

		@Test
		@Rollback
		public void testDeleteFree() throws Exception{
	
			testInsertFree();
			FreeVO targetfree = FreeDAO.selectFreeByFreeId(insertfreeid);
			
			Assert.assertEquals(insertfreeid, targetfree.getFreeid());
			
			FreeDAO.deleteFree(insertfreeid);
			
			FreeVO deleteFree = FreeDAO.selectFreeByFreeId(insertfreeid);
			
			Assert.assertNull(deleteFree);
		}
		
		
}
	