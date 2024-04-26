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

import com.spring.command.ModifyProjectCommand;
import com.spring.command.PageMaker;
import com.spring.dto.NoteVO;
import com.spring.dto.ProjectVO;
import com.spring.service.NoteService;
import com.spring.service.ProjectService;

@Controller
public class DevnoteController {
	
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private NoteService noteService;
	
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
		
		ProjectVO project = projectService.detail(projectId);
		
		System.out.println(projectId);
		mnv.addObject("project", project);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@GetMapping("/modifyProject")
	public ModelAndView modifyForm(int projectId, ModelAndView mnv) throws SQLException {
		String url = "/project/modifyProject";
		
		ProjectVO project = projectService.detail(projectId);
		
		mnv.addObject("project", project);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	@PostMapping(value= "/modifyPj", produces = "text/plain; charset=utf-8")
	public ModelAndView modifyPj(ModifyProjectCommand command, ModelAndView mnv) throws SQLException {
		String url = "/project/modifyProject_success";
		
		ProjectVO project = command.toProjectVO();
		
		System.out.println(project.getProjectId());
		projectService.modify(project);
		
		mnv.addObject("projectId", project.getProjectId());
		mnv.setViewName(url);
		
		return mnv;
		
		
		
		
	}
	
	
	
	@GetMapping("/feed")
	public ModelAndView feed(PageMaker pageMaker, ModelAndView mnv) throws SQLException {
		String url = "/devnote/feed";
	
		List<NoteVO> noteList = noteService.list(pageMaker);
		mnv.addObject("noteList", noteList);
		
		System.out.println(noteList.get(0).getNoteContent());
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
}
