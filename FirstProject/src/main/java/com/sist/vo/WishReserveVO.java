package com.sist.vo;

public class WishReserveVO {
	private int no, hdno, acino, cid, rcno, price;
	private String id;
	private String title, main_poster;
	
	public int getRcno() {
		return rcno;
	}
	public void setRcno(int rcno) {
		this.rcno = rcno;
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
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHdno() {
		return hdno;
	}
	public void setHdno(int hdno) {
		this.hdno = hdno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMain_poster() {
		return main_poster;
	}
	public void setMain_poster(String main_poster) {
		this.main_poster = main_poster;
	}
}
