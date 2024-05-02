package com.spring.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.sql.SQLException;
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
import com.spring.dto.CalendarVO;
import com.spring.dto.ProjectFileVO;
import com.spring.dto.ProjectVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestProjectDAOImpl {
	
	
	@Autowired
	ProjectDAO projectDAO;
	
	@Autowired
	CalendarDAO calendarDAO;
	
	@Autowired
	ProjectFileDAO projectFileDAO;
	
	@Test
	public void testSelectProjectList() throws Exception {
		 
		PageMaker pageMaker = new PageMaker();		
		List<ProjectFileVO> pjFileList = projectFileDAO.selectProjectFileList(pageMaker);
		int s = projectFileDAO.selectProjectFileListCount(pageMaker);
		Assert.assertEquals(0, s);
	}
	
	@Test
	@Rollback
	public void t() throws Exception{
		int s = projectFileDAO.selectProjectFileByFileId(1).getFileDownCnt();
		projectFileDAO.increaseProjectFileDownCnt(1);
		assertEquals(s, projectFileDAO.selectProjectFileByFileId(1).getFileDownCnt());
	}
//	@Test
//	public void testSelectProjectByProejctId() throws Exception {
//		int testFileId = 1;
//		ProjectFileVO pjfile = projectFileDAO.selectProjectFileByFileId(testFileId);
//		Assert.assertEquals(pjfile.getFileId(), testFileId);
//	}
	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	int insertProjectId = 3;
//	@Test
//	@Rollback
//	
//	public void testInsertProject() throws SQLException {
//		 ProjectVO pj = new ProjectVO();
//		 pj.setProjectId(1);
//		 pj.setProjectName("수정된프로젝트제목");
//		 pj.setProjectDescription("수정된상세설명");
//		 
//		 projectDAO.insertProject(pj);
//		 System.out.println(pj);
//		 
//		 Assert.assertEquals(pj.getProjectName(), projectDAO.selectProjectByProjectId(1).getProjectName());
//		 
//		 
//	}
//	
//	@Test
//	@Rollback
//	public void testUpdateProject() throws SQLException {
//		
//		ProjectVO pj = projectDAO.selectProjectByProjectId(1);
//		pj.setProjectName("제목다시고치기");
//		pj.setProjectDescription("상세설명다시고치기");
//		
//	
//		projectDAO.updateProject(pj);
//		Assert.assertEquals(pj.getProjectName(), projectDAO.selectProjectByProjectId(1).getProjectName());
//		
//	}
//	
//	
//	
//	@Test
//	@Rollback
//	public void testdeleteProject() throws SQLException {
//		
//		projectDAO.deleteProject(1);
//		ProjectVO pj = projectDAO.selectProjectByProjectId(1);
//		
//		Assert.assertNull(pj);
//		
//	}
	
	
	 
}
 