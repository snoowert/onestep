package com.spring.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.command.ModifyProjectCommand;
import com.spring.command.PageMaker;
import com.spring.command.RegistCalendarCommand;
import com.spring.command.RegistFeedCommand;
import com.spring.dto.CalendarVO;
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
	public ModelAndView feedList(int projectId, ModelAndView mnv) throws SQLException {
		String url = "/devnote/feed";
		
		List<NoteVO> noteList = noteService.feedList(projectId);
		
		ProjectVO project = projectService.detail(projectId);
		
		mnv.addObject("project", project);
		
		mnv.addObject("noteList", noteList);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@PostMapping(value="/feedRegist", produces="text/plain; charset=utf-8")
	public ModelAndView feedRegist(RegistFeedCommand regCommand, ModelAndView mnv) throws SQLException {
		String url = "/devnote/registFeed_success";
		
		NoteVO note = regCommand.toNoteVO();
	
		System.out.println(note);
		
		note.getNoteRegDate();
		
		
		noteService.regist(note);
		mnv.setViewName(url);
		return mnv;	
		
	}
	


	
	@GetMapping("/calendar")
	public ModelAndView calendar(int projectId,  ModelAndView mnv) throws SQLException {
		String url = "/devnote/calendar";
		
		
		ProjectVO project = projectService.detail(projectId);
		List<CalendarVO> cal = projectService.calList(projectId);
		System.out.println(cal.isEmpty());
		
		mnv.addObject("calendar",cal);
		mnv.addObject("projectId", projectId);
		mnv.addObject("project", project);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
 	@PostMapping("/save-event")
    @ResponseBody
    public String saveEventToDB(RegistCalendarCommand regCalCommand) throws Exception{
        // eventData 객체로부터 데이터를 추출하여 CalendarVO 객체에 설정
 		System.out.println(regCalCommand.getTitle());
        CalendarVO calendarVO = regCalCommand.toVO();
        

        // CalendarService를 사용하여 DB에 일정 저장
        projectService.calInsert(calendarVO);

        return "일정이 성공적으로 저장되었습니다.";
    }
	
 	@PostMapping("/deleteCalendar")
    @ResponseBody
    public String deleteCalendar(@RequestParam("id") int eventId) throws Exception{

 		projectService.calDelete(eventId);
        return "이벤트가 성공적으로 삭제되었습니다.";
    }
	
 	
 	
 	
 	@GetMapping("/projectFile")
 	public ModelAndView projectFileList(ModelAndView mnv) throws Exception {
 		String url = "/devnote/projectFile";
 		
 		
 		mnv.setViewName(url);
 		return mnv;
 	}
 	
}
