package com.teamproject;

import org.springframework.stereotype.Component;

@Component("attvo")
public class AttendVO {
	String id;
	String attdate;
	int status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAttdate() {
		return attdate;
	}
	public void setAttdate(String Attdate) {
		this.attdate = Attdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "AttendVO [id=" + id + ", attdate=" + attdate + ", status=" + status + "]";
	}
	
	

	
}
