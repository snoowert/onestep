package com.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.MemberService;
import com.member.vo.MemberVO;
import com.spring.command.MemberRegistCommand;
import com.spring.command.PageMaker;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService memberService;
	
	//마이페이지(회원목록 or 내정보 메뉴확인)
	@GetMapping("/mypage")
	public ModelAndView myPage(ModelAndView mnv) {
		String url = "/member/mypage";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	//회원목록
	@GetMapping("/list")
	public ModelAndView MemberList(ModelAndView mnv, PageMaker pageMaker) {
		String url = "/member/list";
		
		List<MemberVO> memberList = memberService.SearchMemberList(pageMaker);
		
		
		mnv.addObject("memberList", memberList);
		mnv.setViewName(url);
		return mnv;
	}
	
	//운영자회원조회
	@GetMapping("/Mdetail")
	public ModelAndView ManagerDetail(ModelAndView mnv, int memberid) {
		String url="/member/detail";
		String isM = "Yes";
		MemberVO member = memberService.SelectMemberById(memberid);
		mnv.addObject("isM", isM);
		mnv.addObject("member", member);
		mnv.setViewName(url);
		return mnv;
	}
	
	//회원조회
	@GetMapping("/detail")
	public ModelAndView Detail(ModelAndView mnv, int memberid) {
		String url="/member/detail";
		MemberVO member = memberService.SelectMemberById(memberid);
		
		mnv.addObject("member",member);
		mnv.setViewName(url);
		return mnv;
	}
	@GetMapping("/registSelect")
	public ModelAndView registSelect(ModelAndView mnv) {
		String url = "/member/regist_select";
		
		mnv.setViewName(url);
		return mnv;
	}
	//회원가입 폼
	@GetMapping("/registForm")
	public ModelAndView RegistForm(ModelAndView mnv, String authority) {
		String url ="/member/registForm";
		
		mnv.setViewName(url);
		mnv.addObject("authority",authority);
		return mnv;
	}
	
	//회원가입
	@PostMapping("/regist")
	public ModelAndView Regist(ModelAndView mnv, MemberRegistCommand command) {
		String url = "/member/regist_success";
		MemberVO member = command.toMemberVO();
		memberService.insertMember(member);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	//로그인 폼
	@GetMapping("/loginForm")
	public ModelAndView LoginForm(ModelAndView mnv) {
		String url = "/member/loginForm";
		
		mnv.setViewName(url);
		return mnv;
	}
	//로그인
	//회원수정 폼
	@GetMapping("/modifyForm")
	public ModelAndView ModifyForm(ModelAndView mnv, int memberid) {
		String url ="/member/modifyForm";
		
		MemberVO member = memberService.SelectMemberById(memberid);
		
		mnv.addObject("member",member);
		mnv.setViewName(url);
		return mnv;
	}
	//회원수정
	//비밀번호 확인폼
	@GetMapping("/passwordCheckForm")
	public ModelAndView PWcheckForm(ModelAndView mnv, int memberid) {
		String url = "/member/password_check";
		
		mnv.setViewName(url);
		mnv.addObject("memberid", memberid);
		return mnv;
	}
	//비밀번호 확인
	@PostMapping("/PWCheck")
	public ModelAndView PWCheck(ModelAndView mnv, String password) {
		String url = "/member/detail";
		
		return mnv;
	}
	//회원탈퇴
	@PostMapping("/ban")
    public ResponseEntity<String> banMember(@RequestParam("memberid") int memberid) {
        memberService.banMember(memberid);
        return ResponseEntity.ok("Member banned successfully.");
    }
	@GetMapping("/banSelf")
	public ModelAndView banSelf(int memberid, ModelAndView mnv) {
		String url ="/member/banSelf_success";
		
		memberService.banMember(memberid);
		
		mnv.setViewName(url);
		return mnv;
	}
	//회원복구
    @PostMapping("/restore")
    public ResponseEntity<String> restoreMember(@RequestParam("memberid") int memberid) {
        memberService.restoreMember(memberid);
        return ResponseEntity.ok("Member restored successfully.");
    }
}
