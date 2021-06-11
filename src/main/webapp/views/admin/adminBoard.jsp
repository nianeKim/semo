<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.title{
	margin-bottom: 10px;
}
/* 가로스크롤 생성 */
.container{
	display: grid;
	width: 95%;
	font-family: inherit;
}

.container-table{
	position: absolute;
	overflow: auto;
}
.btn{
	width: 150px;
	height: 55px;
	float: right;
	text-align: center;
	line-height: 55px;
}
div table{
	white-space:nowrap;
	border-collapse:collapse;
}

div table th{
	padding: 0 10px;
	border-bottom: solid 1px;
	font-size: 16px;
}

div table td{
	height: 32px;
	padding: 0 10px;
	font-size: 14px;
	font-weight: 500;
	text-align: center;
	
}
</style>

</head>
<body>
<form class="container">
	<h1 class="title">스토리</h1>
	<div>
		<a class="btn" href="/semojeon/views/display/dpRegistForm.do">등록</a>	
	</div>
	<div class="container container-table">
		<table>
		<tr>
			<th>글번호</th><th>제목</th><th>게시일자</th><th>조회수</th><th>좋아요 수</th><th>작성자</th><th>삭제여부</th><th>수정</th><th>삭제</th>
			<c:forEach var="board" items="${list }">
			<tr>
				<td>${board.bno} </td>
				<td>${board.title} </td>
				<td>${board.reg_date} </td>
				<td>${board.read_cnt} </td>
				<td>${board.likes} </td>
				<td>${board.nick_nm} </td>
				<td>${board.del} </td>
				<td>수정 url</td>
				<td>삭제 url</td>
			</tr>
			</c:forEach>
		</table>
	</div>

</form>
</body>
</html>