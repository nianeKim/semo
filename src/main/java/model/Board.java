package model;

import java.sql.Date;

public class Board {
	private int bno;
	private String title;
	private String content;
	private Date reg_date;
	private int read_cnt;
	private int likes;
	private String del;
	private int mno;
	private String thumbnail;
	private String tempSave;
	private int cnt;
	private String nick_nm;
	private int dno;
	private String poster;
	private Date start_date;
	private Date end_date;
	private String dname;
	private String spot;

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getTempSave() {
		return tempSave;
	}

	public void setTempSave(String tempSave) {
		this.tempSave = tempSave;
	}

	public String getNick_nm() {
		return nick_nm;
	}

	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
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
}
