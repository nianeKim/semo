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
	MemberDao md = MemberDao.getInstance();
	
	for (int i = 1; i <= 100; i++) {
		Display display = new Display();
		Member member = new Member();
		
		member.setId("semo"+i);
		member.setPassword("1234");
		member.setName("세모"+i);
		member.setNick_nm("semo"+i);
		member.setPhone("0101111"+(1000+i));
		member.setGender("f");
		member.setAge(10);
		member.setLoc("Seoul");
	
		md.insert(member);
	}
%>
</body>
</html>