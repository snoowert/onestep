package com.spring.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.PageMaker;
import com.spring.dto.ProjectVO;
import com.spring.service.ProjectService;

@Controller
public class DevnoteController {
	
	
	@Autowired
	private ProjectService projectService;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mnv, @ModelAttribute PageMaker pageMaker) throws SQLException {
		String url = "/devnote/list";
		
		 List<ProjectVO> projectList = projectService.list(pageMaker);
		 mnv.addObject("projectList", projectList);
		 mnv.setViewName(url);

		
		return mnv;		 
		
	}

	@GetMapping("/registProject")
	public ModelAndView registForm(ModelAndView mnv, ProjectVO pj) throws SQLException { 
		String url = "/devnote/registProject";
		
		mnv.setViewName(url);
		
		return mnv;

	}
	
	@PostMapping(value = "/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView regist(ProjectVO pj, ModelAndView mnv) throws SQLException {
		String url  = "/devnote/registProject_success";
		
		ProjectVO project = new ProjectVO();
		
		projectService.regist(project);
		mnv.setViewName(url);
		
		return mnv;

	}
	
}
