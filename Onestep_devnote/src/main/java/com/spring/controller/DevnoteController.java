package com.spring.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.PageMaker;
import com.spring.dto.NoteVO;
import com.spring.dto.ProjectVO;
import com.spring.service.ProjectService;

@Controller
public class DevnoteController {
	
	
	@Autowired
	private ProjectService projectService;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mnv, @ModelAttribute PageMaker pageMaker) throws SQLException {
		String url = "/project/list";

		List<ProjectVO> projectList = projectService.list(pageMaker);
		mnv.addObject("projectList", projectList);

		 System.out.println(projectList.get(0).getProjectDescription());
		mnv.setViewName(url);

		
		return mnv;		 
		
	}

	@GetMapping("/registProject")
	public ModelAndView registForm(ProjectVO pj, ModelAndView mnv) throws SQLException { 
		String url = "/project/registProject";
		
		mnv.setViewName(url);
		
		return mnv;

	}
	
	@PostMapping(value = "/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView regist(ProjectVO pj, ModelAndView mnv) throws SQLException {
		String url  = "/project/registProject_success";
		
		
		System.out.println(pj);
		
		projectService.regist(pj);
		mnv.setViewName(url);
		
		return mnv;

	}
	

	@GetMapping("/main")
	public ModelAndView detail(int projectId, HttpSession session, String form, ModelAndView mnv) throws SQLException {
		String url = "/devnote/main";
		
		ProjectVO project = null;
		
		System.out.println(projectId);
		
		mnv.addObject("project", project);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@GetMapping("/feed")
	public ModelAndView feed(NoteVO pj, ModelAndView mnv) throws SQLException {
		String url = "/devnote/feed";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
}
