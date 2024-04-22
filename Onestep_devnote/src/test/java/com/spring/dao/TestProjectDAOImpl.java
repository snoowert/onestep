package com.spring.dao;

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
import com.spring.dto.ProjectVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestProjectDAOImpl {
	
	
	@Autowired
	ProjectDAO projectDAO;
	
	@Test
	public void testSelectProjectList() throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(1);
		pageMaker.setPerPageNum(10);
		
		List<ProjectVO> pjList = projectDAO.selectProjectList(pageMaker);
		Assert.assertEquals(1, pjList.size());
	}
	
	
	@Test
	public void testSelectProjectByProejctId() throws SQLException {
		int testProjectId = 1;
		ProjectVO pj = projectDAO.selectProjectByProjectId(testProjectId);
		Assert.assertEquals(pj.getProjectId(), testProjectId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	int insertProjectId = 3;
	@Test
	@Rollback
	
	public void testInsertProject() throws SQLException {
		 ProjectVO pj = new ProjectVO();
		 pj.setProjectId(1);
		 pj.setProjectName("수정된프로젝트제목");
		 pj.setProjectDesc("수정된상세설명");
		 
		 projectDAO.insertProject(pj);
		 System.out.println(pj);
		 
		 Assert.assertEquals(pj.getProjectName(), projectDAO.selectProjectByProjectId(1).getProjectName());
		 
		 
	}
	
	@Test
	@Rollback
	public void testUpdateProject() throws SQLException {
		
		ProjectVO pj = projectDAO.selectProjectByProjectId(1);
		pj.setProjectName("제목다시고치기");
		pj.setProjectDesc("상세설명다시고치기");
		
	
		projectDAO.updateProject(pj);
		Assert.assertEquals(pj.getProjectName(), projectDAO.selectProjectByProjectId(1).getProjectName());
		
	}
	
	
	
	@Test
	@Rollback
	public void testdeleteProject() throws SQLException {
		
		projectDAO.deleteProject(1);
		ProjectVO pj = projectDAO.selectProjectByProjectId(1);
		
		Assert.assertNull(pj);
		
	}
	
	 
}
 