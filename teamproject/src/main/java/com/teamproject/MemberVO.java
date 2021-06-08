package com.teamproject;

public class MemberVO {
int phon,weight;
long h_id;
String id,name,addr,pass,likeable;
public long getH_id() {
	return h_id;
}
public void setH_id(long h_id) {
	this.h_id = h_id;
}
public int getPhon() {
	return phon;
}
public void setPhon(int phon) {
	this.phon = phon;
}
public int getWeight() {
	return weight;
}
public void setWeight(int weight) {
	this.weight = weight;
}
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
public String getAddr() {
	return addr;
}
public void setAddr(String addr) {
	this.addr = addr;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getLikeable() {
	return likeable;
}
public void setLikeable(String likeable) {
	this.likeable = likeable;
}
public MemberVO(long h_id, int phon, int weight, String id, String name, String addr, String pass, String likeable) {
	super();
	this.h_id = h_id;
	this.phon = phon;
	this.weight = weight;
	this.id = id;
	this.name = name;
	this.addr = addr;
	this.pass = pass;
	this.likeable = likeable;
}
public MemberVO() {}
@Override
public String toString() {
	return "MenberVO [h_id=" + h_id + ", phon=" + phon + ", weight=" + weight + ", id=" + id + ", name=" + name
			+ ", addr=" + addr + ", pass=" + pass + ", likeable=" + likeable + "]";
}

}
