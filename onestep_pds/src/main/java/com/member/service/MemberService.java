package com.member.service;

import java.util.List;

import com.member.vo.MemberVO;
import com.spring.command.PageMaker;

public interface MemberService {
	//전체조회
	public List<MemberVO> SearchMemberList(PageMaker pageMaker);
	//단일조회
	public MemberVO SelectMemberById(int memberid);
	//생성
	public void insertMember(MemberVO member);
	//수정
	public void updateMember(MemberVO member);
	//임시삭제
	public void banMember(int memberid);
	//복구
	public void restoreMember(int memberid);
}
