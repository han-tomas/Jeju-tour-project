package com.sist.vo;
/*
 NO          	   NOT NULL NUMBER
 TITLE             NOT NULL VARCHAR2(100)
 TAG               NOT NULL VARCHAR2(1000)
 INTRODUCTION      NOT NULL VARCHAR2(1000)
 LOC                        VARCHAR2(100)
 ADDR              NOT NULL VARCHAR2(200)
 ROAD              NOT NULL VARCHAR2(200)
 TEL               NOT NULL VARCHAR2(60)
 POSTER            NOT NULL VARCHAR2(500)
 INFO              NOT NULL CLOB
 LNO               NOT NULL NUMBER
 TCNO              NOT NULL NUMBER
 */
public class TravelVO {
	private int no,lno,hit;
	private String title,tag,introduction,loc,addr,road,tel,poster,info,label;
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getRoad() {
		return road;
	}
	public void setRoad(String road) {
		this.road = road;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}
