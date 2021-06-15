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
	width: 100px;
	height: 40px;
	float: right;
	text-align: center;
	line-height: 40px;
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
	<h1 class="title">전시</h1>
	<div>
		<a class="btn" href="/semojeon/views/display/dpRegistForm.do">등록</a>	
	</div>
	<div class="container container-table">
	
		<table>
		<tr>
			<th>전시번호</th><th>전시명</th><th>시작일</th><th>종료일</th><th>관람 시간</th><th>관람 장소</th><th>단일 관람료</th><th>할인율</th><th>관람료_성인</th><th>관람료_청소년</th><th>관람료_어린이</th><th>관련 태그</th><th>작가명</th><th>전화번호</th><th>홈페이지</th><th>게시현황</th><th>작성자</th><th>수정</th><th>삭제</th>
			<c:forEach var="display" items="${list }">
			<tr>
				<td>${display.dno} </td>
				<td>${display.dname} </td>
				<td>${display.start_date} </td>
				<td>${display.end_date} </td>
				<td>${display.hours} </td>
				<td>${display.loc} </td>
				<td>${display.fee} </td>
				<td>${display.discount} </td>
				<td>${display.fee_adult} </td>
				<td>${display.fee_teen} </td>
				<td>${display.fee_child} </td>
				<td>${display.tag} </td>
				<td>${display.artist} </td>
				<td>${display.tel} </td>
				<td>${display.home_pg} </td>
				<td>${display.del} </td>
				<td>${display.mno} </td>
				<td>삭제 url</td>
				<td>수정 url</td>
			</tr>
			</c:forEach>
		</table>
	</div>

</form>
</body>
</html>