package com.onestep.free;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
  
	@GetMapping("/main")
    public String form() {
        return "/free/main";
    
	}

	@GetMapping("/regist")
	public String regist()throws Exception{
		String url="/free/regist";
		return url;
	}
	@GetMapping("/modify")
	public String modify()throws Exception{
		String url="/free/modify";
		return url;
	}
	@GetMapping("/detail")
	public String detail()throws Exception{
		String url="/free/detail";
		return url;
	}
//	public String regist(NoticeVO notice, RedirectAttributes rttr) throws Exception {
//		String url="redirect:/list.do";
//		
//		notice.setTitle(HTMLInputFilter.htmlSpecialChars(notice.getTitle()));
//		notice.setContent(HTMLInputFilter.htmlSpecialChars(notice.getContent()));
//		
//		noticeService.regist(notice);
//		
//		rttr.addAttribute("page",1);
//		rttr.addAttribute("perPageNum",10);
//		rttr.addAttribute("searchType","");
//		rttr.addAttribute("keyword","");
//		
//		rttr.addFlashAttribute("from","regist");
//		return url;
//	}

	
}
