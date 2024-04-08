package com.onestep.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.onestep.command.CommentModifyCommand;
import com.onestep.command.CommentRegistCommand;
import com.onestep.command.FreeModifyCommand;
import com.onestep.command.FreeRegistCommand;
import com.onestep.command.PageMaker;
import com.onestep.dto.FreeCommentVO;
import com.onestep.dto.FreeVO;
import com.onestep.service.FreeService;

@Controller
public class Freecontroller {

	@Autowired
	private FreeService freeService;

	@GetMapping("/main")
	public ModelAndView list(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception {
		String url="/free/main";
		
		List<FreeVO> freeList = freeService.searchList(pageMaker);
		
		mnv.addObject("freeList",freeList);
		mnv.setViewName(url);
		return mnv;
	}
	

	@GetMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws Exception {
		String url = "/free/regist";
		mnv.setViewName(url);
		return mnv;
	}

	@PostMapping(value = "/regist", produces = "text/plain;charset=utf-8")
	public ModelAndView regist(FreeRegistCommand regCommand, ModelAndView mnv) throws Exception {
		String url = "/free/regist_success";
	
		
		FreeVO free = regCommand.toFreeVO();

	    free.getFreeupdatedate();
		
		freeService.regist(free);
		mnv.setViewName(url);

		return mnv;
	}

	@GetMapping("/detail")
	public ModelAndView detail(int freeid, HttpSession session, String from, ModelAndView mnv) throws Exception {
	    String url = "/free/detail";

	    FreeVO free = null;
	    freeService.increaseFreeViewPoint(freeid);
        
	  
	    free = freeService.detail(freeid);
	  
	    mnv.addObject("free", free);
	    mnv.setViewName(url);
	    return mnv;
	}
	
	@GetMapping("/modifyForm")
	public ModelAndView modifyForm(int freeid,ModelAndView mnv)throws Exception{
		String url = "/free/modify";

		FreeVO free = freeService.detail(freeid);

		mnv.addObject("free", free);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/modify")
	public ModelAndView modify(FreeModifyCommand modifyCommand, ModelAndView mnv)throws Exception{
			String url = "/free/modify_success";

			FreeVO free = modifyCommand.toFreeVO();

			freeService.modify(free);
			
			mnv.setViewName(url);
			
			return mnv;
	}
	
	@GetMapping("/remove")
	public ModelAndView remove(int freeid, ModelAndView mnv)throws Exception{
		String url="/free/remove_success";
		
	    ModelAndView free = new ModelAndView();
		freeService.remove(freeid);
		
		mnv.setViewName(url);
		return mnv;
	}
	@PostMapping(value="/commentregist", produces="text/plain;charset=utf-8")
	public ModelAndView Commentregist(CommentRegistCommand command, ModelAndView mnv) throws Exception{
		String url = "/free/registComment_success";
		FreeCommentVO comment = command.toFreeCommentVO();
		int freeid = command.getFreeid();
		
		freeService.registcomment(comment, freeid);
		
		mnv.addObject("freeid",freeid);
		mnv.setViewName(url);
		return mnv;
	}
	@PostMapping("/commentremove")
	public ModelAndView Commentremove(int freeid, int commentid, ModelAndView mnv) throws Exception {
	    String url = "/free/removeComment_success";
	    ModelAndView comment = new ModelAndView();
	    freeService.removecomment(commentid);
	    mnv.addObject("freeid", freeid);
	    mnv.setViewName(url);
	    return mnv;
	}
	@GetMapping("/modifycommentForm")
	public ModelAndView modifycommentForm(int commentid, ModelAndView mnv)throws Exception{
		String url = "/free/modifyComment";

		FreeCommentVO comment = freeService.readcomment(commentid);

		mnv.addObject("comment", comment);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value="/commentmodify", produces="text/plain;charset=utf-8")
	public ModelAndView Commentmodify(CommentModifyCommand command, ModelAndView mnv) throws Exception{
		String url = "/free/modifyComment_success";
		FreeCommentVO comment = command.toFreeCommentVO();
		int freeid = command.getFreeid();
		
		freeService.modifycomment(comment);
		
		mnv.addObject("freeid",freeid);
		mnv.setViewName(url);
		return mnv;
	}
}