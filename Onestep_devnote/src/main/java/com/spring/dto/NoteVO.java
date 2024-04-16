package com.spring.dto;

import java.util.Date;

public class NoteVO {
	
	private int dnId;
	private int projectId;
	private int memberId;
	
	private String dnTitle;
	private String dnContent;
	private String dnViewPoint;
	private Date dnRegDate;
	public int getDnId() {
		return dnId;
	}
	public void setDnId(int dnId) {
		this.dnId = dnId;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getDnTitle() {
		return dnTitle;
	}
	public void setDnTitle(String dnTitle) {
		this.dnTitle = dnTitle;
	}
	public String getDnContent() {
		return dnContent;
	}
	public void setDnContent(String dnContent) {
		this.dnContent = dnContent;
	}

	public String getDnViewPoint() {
		return dnViewPoint;
	}
	public void setDnViewPoint(String dnViewPoint) {
		this.dnViewPoint = dnViewPoint;
	}
	public Date getDnRegDate() {
		return dnRegDate;
	}
	public void setDnRegDate(Date dnRegDate) {
		this.dnRegDate = dnRegDate;
	}
	
	
	
	
	
	

}
