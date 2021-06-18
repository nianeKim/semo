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
	ReviewDao rd = ReviewDao.getInstance();
	
	for (int i = 0; i < 50; i++) {
		Review review = new Review();
		
		review.setStar_rate(8);
		review.setContent("커밋 백번째");
		review.setMno(1);
		review.setDno(210);
		review.setProfile("profile.png");
		review.setNick_nm("도도");
		
		rd.insert(review);
	}
%>
</body>
</html>