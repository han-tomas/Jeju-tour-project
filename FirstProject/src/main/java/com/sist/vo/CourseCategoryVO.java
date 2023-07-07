package com.sist.vo;
/*
  CNO                                       NOT NULL NUMBER
 TITLE                                     NOT NULL VARCHAR2(100)
 POSTER                                             VARCHAR2(1000)
 RECOMMEND                                 NOT NULL VARCHAR2(10)
 JJIM                                      NOT NULL VARCHAR2(10)
 COPY                                      NOT NULL VARCHAR2(10)
 VIEWS                                     NOT NULL VARCHAR2(10)
 TCNO                                      NOT NULL VARCHAR2(10)
 */
public class CourseCategoryVO {
	private int cno,recommend,jjim,copy,views;
	private String title,poster;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getJjim() {
		return jjim;
	}
	public void setJjim(int jjim) {
		this.jjim = jjim;
	}
	public int getCopy() {
		return copy;
	}
	public void setCopy(int copy) {
		this.copy = copy;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
}
