<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	DisplayDao dd = DisplayDao.getInstance();

	for (int i = 0; i <= 200; i++) {
		Display display = new Display();
		
		display.setDname("맥스 달튼, 영화의 순간들 "+i);
		display.setStart_date(Date.valueOf("2021-06-01"));
		display.setEnd_date(Date.valueOf("2021-06-30"));
		display.setSpot("대림미술관");
		display.setLoc("서울");
		display.setAddress("서울특별시 종로구 통의동 35-1 대림미술관");
		display.setPoster("21001861_p2.gif");
		display.setTag("디자인");
		display.setIntro("Max Darton, Moments of Film 맥스 달튼, 영화의 순간들");
		display.setDetail_img("21001861-11.jpeg");
		display.setHours("오전 10:00~ 오후 6:00");
		display.setFee(12000);
		display.setFee_adult(0);
		display.setFee_teen(0);
		display.setFee_child(0);
		display.setDiscount(0);
		display.setMno(0);
		
		dd.insert(display);
	}
%>
</body>
</html>