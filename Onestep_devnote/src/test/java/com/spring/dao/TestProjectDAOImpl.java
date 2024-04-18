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

import com.spring.dto.ProjectVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestProjectDAOImpl {
	
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Test
	public void testSelectProjectList() throws Exception {
		List<ProjectVO> pjList = projectDAO.selectProjectList();
		Assert.assertEquals(2, pjList.size());
	}
	
	
	@Test
	public void testSelectProjectByProejctId() throws SQLException {
		int testProjectId = 12;
		ProjectVO pj = projectDAO.selectProjectByProjectId(testProjectId);
		Assert.assertEquals(pj.getProjectId(), testProjectId);
	}
	
	int insertProjectId = 3;
	@Test
	@Rollback
	
	public void testInsertProject() throws SQLException {
		 ProjectVO pj = new ProjectVO();
		 pj.setProjectId(insertProjectId);
		 pj.setProjectName("프로젝트 제목");
		 pj.setProjectDesc("프로젝트 상세설명");
		 
		 projectDAO.insertProject(pj);
		 System.out.println(pj);
		 
		 Assert.assertEquals(pj.getProjectId(), projectDAO.selectProjectByProjectId(1).getProjectName());
		 
		 
	}
	
	public void testUpdateProject() throws SQLException {
		
		ProjectVO pj = projectDAO.selectProjectByProjectId(2);
		pj.setProjectName("제목다시고치기");
		pj.setProjectDesc("상세설명다시고치기");
		
	
		projectDAO.updateProject(pj);
		Assert.assertEquals(pj.getProjectName(), projectDAO.selectProjectByProjectId(2).getProjectName());
		
	}
	
	
	
	
	public void testDeleteProject() throws SQLException {
		
	}
	 
}
 