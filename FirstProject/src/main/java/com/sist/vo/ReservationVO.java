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
public class ReservationVO {
	private int jrno, rno, acino, cid, rcno, inwon, price, tprice, hdno;
	private String checkin, checkout, id, rname, remail, rphone, payment, rok, dbday, poster, title;
	private Date regdate;
	private String realDate;
	
	public int getHdno() {
		return hdno;
	}
	public void setHdno(int hdno) {
		this.hdno = hdno;
	}
	
	public String getRealDate() {
		return realDate;
	}
	public void setRealDate(String realDate) {
		this.realDate = realDate;
	}
	public int getAcino() {
		return acino;
	}
	public void setAcino(int acino) {
		this.acino = acino;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getRcno() {
		return rcno;
	}
	public void setRcno(int rcno) {
		this.rcno = rcno;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getJrno() {
		return jrno;
	}
	public void setJrno(int jrno) {
		this.jrno = jrno;
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
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRemail() {
		return remail;
	}
	public void setRemail(String remail) {
		this.remail = remail;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
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
