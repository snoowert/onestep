package com.pds.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pds.service.PdsService;
import com.pds.vo.PdsVO;
import com.spring.command.PageMaker;

@Controller
public class PdsController {
	@Autowired
	PdsService pdsService;
	//목록
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mnv, PageMaker pagemaker) throws SQLException{
		String url = "/pds/list";
		
		List<PdsVO> pdsList = pdsService.searchList(pagemaker);
		mnv.addObject("pdsList", pdsList);
		mnv.setViewName(url);
		return mnv;
	}
	//글작성폼
	@GetMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws SQLException{
		String url = "/pds/regist";
		
		mnv.setViewName(url);
		return mnv;
	}
	//글작성
	@PostMapping("/regist")
	public ModelAndView regist(ModelAndView mnv) throws SQLException{
		String url = "/pds/regist_success";
		
		
		mnv.setViewName(url);
		return mnv;
	}
	//글수정폼
	@GetMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv) throws SQLException{
		String url = "/pds/modify";
		
		mnv.setViewName(url);
		return mnv;
	}
	//글수정
	@PostMapping("modify")
	public ModelAndView modify(ModelAndView mnv) throws SQLException{
		String url = "/pds/modify_success";
		
		mnv.setViewName(url);
		return mnv;
	}
	//글삭제
	//파일불러오기
	//파일업로드
}
