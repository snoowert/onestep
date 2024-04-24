package com.spring.dto;

import java.util.Date;

public class NoteVO {
	
	private int noteId;
	private int projectId;
	private int memberId;

	
	private String noteTitle;
	private String noteContent;
	private int noteViewPoint;
	private Date noteRegDate;
	
	
	
	
	
	public int getNoteId() {
		return noteId;
	}
	public void setNoteId(int noteId) {
		this.noteId = noteId;
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
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public int getNoteViewPoint() {
		return noteViewPoint;
	}
	public void setNoteViewPoint(int noteViewPoint) {
		this.noteViewPoint = noteViewPoint;
	}
	public Date getNoteRegDate() {
		return noteRegDate;
	}
	public void setNoteRegDate(Date noteRegDate) {
		this.noteRegDate = noteRegDate;
	}


	
	
	
	
	

}
