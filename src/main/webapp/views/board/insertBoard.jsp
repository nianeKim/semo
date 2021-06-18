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
	BoardDao bd = BoardDao.getInstance();

	for (int i = 0; i <= 100; i++) {
		Board board = new Board();
		
		board.setTitle("스토리 "+i);
		board.setContent("스토리 내용"+i);
		board.setThumbnail("antique.png");
		
		bd.insert(board);
	}
%>
</body>
</html>