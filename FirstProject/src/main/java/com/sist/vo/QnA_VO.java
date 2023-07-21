package com.sist.vo;
/*
CREATE TABLE qnaboard(
	NO NUMBER,
	id varchar2(20),
	name varchar2(51),
	subject varchar2(1000) CONSTRAINT qna_subject_nn NOT NULL,
	content clob CONSTRAINT qna_content_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	group_step NUMBER DEFAULT 0,
	group_id NUMBER DEFAULT 0,
	group_tab NUMBER DEFAULT 0,
	isreply NUMBER DEFAULT 0,
	CONSTRAINT qna_no_pk PRIMARY key(no),
	CONSTRAINT qna_id_fk FOREIGN key(id)
	REFERENCES jeju_member(id)
);
 */

import java.util.Date;

public class QnA_VO {
	private int no,group_step,group_tab,group_id,isreply, num;
	private String id,name,subject,content,dbday,type;
	private Date regdate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getIsreply() {
		return isreply;
	}
	public void setIsreply(int isreply) {
		this.isreply = isreply;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
