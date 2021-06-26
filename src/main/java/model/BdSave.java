package model;

import java.sql.Date;

public class BdSave {
	private int bs_no;
	private String thumbnail;
	private String title;
	private String content;
	private Date reg_date;
	private int mno;

	public int getBs_no() {
		return bs_no;
	}

	public void setBs_no(int bs_no) {
		this.bs_no = bs_no;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

}
