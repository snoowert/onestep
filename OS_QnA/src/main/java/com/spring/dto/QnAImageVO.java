package com.spring.dto;

public class QnAImageVO {
	
	private int qnaid;				// 글 번호
	private int qnaimageid;			// 이미지 번호
	private String qnaimagename;	// 이미지 이름
	

	public int getQnaid() {
		return qnaid;
	}
	public void setQnaid(int qnaid) {
		this.qnaid = qnaid;
	}
	public int getQnaimageid() {
		return qnaimageid;
	}
	public void setQnaimageid(int qnaimageid) {
		this.qnaimageid = qnaimageid;
	}
	public String getQnaimagename() {
		return qnaimagename;
	}
	public void setQnaimagename(String qnaimagename) {
		this.qnaimagename = qnaimagename;
	}
	
}
