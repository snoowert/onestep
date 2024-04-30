package com.main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.service.MainService;
import com.onestep.command.PageMaker;
import com.onestep.dto.FreeVO;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	public MainService mainService;
	
	@GetMapping("/")
	public ModelAndView Main(ModelAndView mnv, PageMaker pagemaker) throws Exception{
		String url = "main/main";
		
		List<FreeVO> freeList = mainService.selectMain(pagemaker);
		
		List<FreeVO> topfreeFiveList = new ArrayList<>();
	    int count = 0;
	    for (FreeVO item : freeList) {
	        if (count >= 5) {
	            break;
	        }
	        topfreeFiveList.add(item);
	        count++;
	    }
	    
	    mnv.addObject("freeList",topfreeFiveList);
	    mnv.setViewName(url);
		return mnv;
	}
}
