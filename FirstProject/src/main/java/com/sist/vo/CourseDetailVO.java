package com.sist.vo;
/*
 	NO                                        NOT NULL NUMBER
 DAYTYPE                                            NUMBER
 COURSENAME                                         VARCHAR2(100)
 CNO                                                NUMBER
 */
public class CourseDetailVO {
	private int no,cno,daytype;
	private String coursename;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getDaytype() {
		return daytype;
	}
	public void setDaytype(int daytype) {
		this.daytype = daytype;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	
}
