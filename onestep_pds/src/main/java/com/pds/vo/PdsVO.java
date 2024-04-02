package com.pds.vo;

import java.util.Date;

public class PdsVO {
	public int pdsid;
	public int memberid;
	public String pdstitle;
	public String pdscontent;
	public Date pdsregdate;
	public int pdsviewpoint;
	public int getPdsid() {
		return pdsid;
	}
	public void setPdsid(int pdsid) {
		this.pdsid = pdsid;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public String getPdstitle() {
		return pdstitle;
	}
	public void setPdstitle(String pdstitle) {
		this.pdstitle = pdstitle;
	}
	public String getPdscontent() {
		return pdscontent;
	}
	public void setPdscontent(String pdscontent) {
		this.pdscontent = pdscontent;
	}
	public Date getPdsregdate() {
		return pdsregdate;
	}
	public void setPdsregdate(Date pdsregdate) {
		this.pdsregdate = pdsregdate;
	}
	public int getPdsviewpoint() {
		return pdsviewpoint;
	}
	public void setPdsviewpoint(int pdsviewpoint) {
		this.pdsviewpoint = pdsviewpoint;
	}
	
	
}
