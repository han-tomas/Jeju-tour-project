package com.sist.vo;

/*
ACINO
ACCNO
TITLE
SCORE
REVIEW_COUNT
PRICE
REVIEWER
REVIEW_CONTENT
HOURS_USE
LOCATION_NAME
LOCATION_POSTER
HOW_USE
POSTER
MAIN_POSTER
	
*/
public class ActivityVO {
	private int acino, accno, price;
	private String title, review_count, reviewer, review_content, hours_use, location_name, location_poster, how_use, poster, main_poster;
	private double score;
	public int getAcino() {
		return acino;
	}
	public void setAcino(int acino) {
		this.acino = acino;
	}
	public int getAccno() {
		return accno;
	}
	public void setAccno(int accno) {
		this.accno = accno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReview_count() {
		return review_count;
	}
	public void setReview_count(String review_count) {
		this.review_count = review_count;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getHours_use() {
		return hours_use;
	}
	public void setHours_use(String hours_use) {
		this.hours_use = hours_use;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getLocation_poster() {
		return location_poster;
	}
	public void setLocation_poster(String location_poster) {
		this.location_poster = location_poster;
	}
	public String getHow_use() {
		return how_use;
	}
	public void setHow_use(String how_use) {
		this.how_use = how_use;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getMain_poster() {
		return main_poster;
	}
	public void setMain_poster(String main_poster) {
		this.main_poster = main_poster;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	
	
}
