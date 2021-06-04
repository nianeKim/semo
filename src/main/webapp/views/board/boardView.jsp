<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board/bdView.css">
</head>
<body>
	<div class="container_middle">
		<div class="container_top">
			<img alt="썸네일" src="../../upload/${board.thumbnail}">
			<p class="blackBox"></p>
			<h2>${board.title }</h2>
			<h5>${nick_nm} | ${board.reg_date }</h5>
		</div>
		<div class="contents">
			<pre>${board.content }</pre>
		</div>
	</div>
</body>
</html>