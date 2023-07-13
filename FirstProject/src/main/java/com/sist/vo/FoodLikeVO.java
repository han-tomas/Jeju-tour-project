package com.sist.vo;
/*
CREATE TABLE jeju_food_like(
	NO NUMBER,
	id VARCHAR2(20),
	fino NUMBER,
	CONSTRAINT jfl_no_pk PRIMARY KEY(no),
	CONSTRAINT jfl_id_fk FOREIGN key(id)
	REFERENCES jeju_member(id),
	CONSTRAINT jfl_fino_fk FOREIGN key(fino)
	REFERENCES food_info(fino)
);
 */
public class FoodLikeVO {
	private int no,fino;
	private String id;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getFino() {
		return fino;
	}
	public void setFino(int fino) {
		this.fino = fino;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
