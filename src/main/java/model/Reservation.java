package model;

public class Reservation {
	private int rs_no;
	private int cnt;
	private int cnt_adult;
	private int cnt_teen;
	private int cnt_child;
	private int mno;
	private int dno;
	private String dname;
	private String poster;
	
	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getRs_no() {
		return rs_no;
	}

	public void setRs_no(int rs_no) {
		this.rs_no = rs_no;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getCnt_adult() {
		return cnt_adult;
	}

	public void setCnt_adult(int cnt_adult) {
		this.cnt_adult = cnt_adult;
	}

	public int getCnt_teen() {
		return cnt_teen;
	}

	public void setCnt_teen(int cnt_teen) {
		this.cnt_teen = cnt_teen;
	}

	public int getCnt_child() {
		return cnt_child;
	}

	public void setCnt_child(int cnt_child) {
		this.cnt_child = cnt_child;
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
