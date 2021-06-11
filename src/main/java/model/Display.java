package model;

import java.sql.Date;

public class Display {
	private int dno;
	private String dname;
	private Date start_date;
	private Date end_date;
	private String spot;
	private String loc;
	private String address;
	private String poster; // 이름만 넣고 폴더에 이미지 따로 저장
	private String tag;
	private String intro;
	private String detail_img;
	private String detail_txt;
	private String hours;
	private int fee;
	private int fee_adult;
	private int fee_teen;
	private int fee_child;
	private int discount;
	private String artist;
	private String tel;
	private String home_pg;
	private String del;
	private int mno;

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}
	
	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
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

	public String getSpot() {
		return spot;
	}
	
	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getDetail_img() {
		return detail_img;
	}

	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}

	public String getDetail_txt() {
		return detail_txt;
	}

	public void setDetail_txt(String detail_txt) {
		this.detail_txt = detail_txt;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getFee_adult() {
		return fee_adult;
	}

	public void setFee_adult(int fee_adult) {
		this.fee_adult = fee_adult;
	}

	public int getFee_teen() {
		return fee_teen;
	}

	public void setFee_teen(int fee_teen) {
		this.fee_teen = fee_teen;
	}

	public int getFee_child() {
		return fee_child;
	}

	public void setFee_child(int fee_child) {
		this.fee_child = fee_child;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHome_pg() {
		return home_pg;
	}

	public void setHome_pg(String home_pg) {
		this.home_pg = home_pg;
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
