package com.sist.vo;
/*
HRNO	NUMBER
CHECKIN	VARCHAR2(20 BYTE)
CHECKOUT	VARCHAR2(20 BYTE)
RNO	NUMBER
ID	VARCHAR2(20 BYTE)
NAME	VARCHAR2(51 BYTE)
EMAIL	VARCHAR2(200 BYTE)
PHONE	VARCHAR2(20 BYTE)
INWON	NUMBER
PRICE	NUMBER
TPRICE	NUMBER
PAYMENT	VARCHAR2(20 BYTE)
ROK	CHAR(1 BYTE)
REGDATE	DATE
 */
import java.util.*;
public class HotelReserveVO {
	private int hrno, rno, inwon, price, tprice;
	private String checkin, checkout, id, name, email, phone, payment, rok;
	private Date regdate;
	
	public int getHrno() {
		return hrno;
	}
	public void setHrno(int hrno) {
		this.hrno = hrno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getInwon() {
		return inwon;
	}
	public void setInwon(int inwon) {
		this.inwon = inwon;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTprice() {
		return tprice;
	}
	public void setTprice(int tprice) {
		this.tprice = tprice;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getRok() {
		return rok;
	}
	public void setRok(String rok) {
		this.rok = rok;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
