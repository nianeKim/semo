<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/fonts.css">
<link rel="stylesheet" type="text/css" href="../../css/reset.css">
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<deco:head></deco:head>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<deco:body></deco:body>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>