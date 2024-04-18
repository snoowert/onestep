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
		Assert.assertEquals(1, pjList.size());
	}
	
	
	@Test
	public void testSelectProjectByProejctId() throws SQLException {
		int testProjectId = 1;
		ProjectVO pj = projectDAO.selectProjectByProjectId(testProjectId);
		Assert.assertEquals(pj.getProjectId(), testProjectId);
	}
	
	int insertProjectId = 2;
	@Test
	@Rollback
	
	public void testInsertProject() throws SQLException {
		 ProjectVO pj = new ProjectVO();
		 pj.setProjectId(insertProjectId);
		 pj.setProjectName("프로젝트 제목");
		 pj.setProjectDesc("프로젝트 상세설명");
		 
		 projectDAO.insertProject(pj);
		 String p = projectDAO.selectProjectByProjectId(2).getProjectName();
		 
		 Assert.assertEquals(pj.getProjectId(), p );
		 
	}
	
	 
}
 