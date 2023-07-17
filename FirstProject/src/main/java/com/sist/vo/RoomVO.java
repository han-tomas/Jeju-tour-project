package com.sist.vo;

public class RoomVO {
	private int rno, huno, account, price;
	private String rname, person, rstructure, special, rposter;
	private String[] rposters;
	private String msg;
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getRposter() {
		return rposter;
	}
	public void setRposter(String rposter) {
		this.rposter = rposter;
	}
	public String[] getRposters() {
		return rposters;
	}
	public void setRposters(String[] rposters) {
		this.rposters = rposters;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getHuno() {
		return huno;
	}
	public void setHuno(int huno) {
		this.huno = huno;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getRstructure() {
		return rstructure;
	}
	public void setRstructure(String rstructure) {
		this.rstructure = rstructure;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
}
