package com.member.service;

import java.util.List;

import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;
import com.spring.command.PageMaker;

public class MemberServiceImpl implements MemberService{
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	@Override
	public List<MemberVO> SearchMemberList(PageMaker pageMaker) {
		// TODO Auto-generated method stub
		List<MemberVO> memberList = memberDAO.selectMemberSearchList(pageMaker);
		pageMaker.setTotalCount(memberDAO.selectMemberSearchListCount(pageMaker));
		return memberList;
	}

	@Override
	public MemberVO SelectMemberById(int memberid) {
		// TODO Auto-generated method stub
		MemberVO member = memberDAO.selectMemberById(memberid);
		return member;
	}

	@Override
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(member);
	}

	@Override
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		memberDAO.updateMember(member);
	}

	@Override
	public void banMember(int memberid) {
		// TODO Auto-generated method stub
		memberDAO.banMember(memberid);
	}

	@Override
	public void restoreMember(int memberid) {
		// TODO Auto-generated method stub
		memberDAO.restoreMember(memberid);
	}
	
}
