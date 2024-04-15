package com.spring.command;

import com.spring.dto.AnswerVO;

public class AnswerRegistCommand {
	
	private int answerid;
	private int qnaid;
	private String answercontent;
	private int memberid;
	
	public int getAnswerid() {
		return answerid;
	}
	public void setAnswerid(int answerid) {
		this.answerid = answerid;
	}
	public int getQnaid() {
		return qnaid;
	}
	public void setQnaid(int qnaid) {
		this.qnaid = qnaid;
	}
	public String getAnswercontent() {
		return answercontent;
	}
	public void setAnswercontent(String answercontent) {
		this.answercontent = answercontent;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public AnswerVO toAnswerVO(){
		AnswerVO answer = new AnswerVO();
		answer.setAnswerid(this.answerid);
		answer.setQnaid(this.qnaid);
		answer.setAnswercontent(this.answercontent);
		answer.setMemberid(this.memberid);
		
		return answer;
	}
}
