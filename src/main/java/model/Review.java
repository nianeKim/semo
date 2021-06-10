package model;

import java.sql.Date;

public class Review {
	private int rv_no;
	private int star_rate;
	private String content;
	private Date reg_date;
	private int likes;
	private String del;
	private int mno;
	private int dno;
	private String profile;
	private String nick_nm;

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNick_nm() {
		return nick_nm;
	}

	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}

	public int getRv_no() {
		return rv_no;
	}

	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}

	public int getStar_rate() {
		return star_rate;
	}

	public void setStar_rate(int star_rate) {
		this.star_rate = star_rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}
}
