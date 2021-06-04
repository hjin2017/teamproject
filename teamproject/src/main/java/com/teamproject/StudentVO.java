package com.teamproject;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("stdvo")
public class StudentVO {
	String id, name, stdclass, auth, img;
	int password;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStdclass() {
		return stdclass;
	}
	public void setStdclass(String stdclass) {
		this.stdclass = stdclass;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "StudentVO [id=" + id + ", name=" + name + ", stdclass=" + stdclass + ", auth=" + auth + ", img=" + img
				+ ", password=" + password + "]";
	}
	

	
}
