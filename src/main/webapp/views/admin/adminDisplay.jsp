<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	border: 1px solid
}

div table th{
	border: 1px solid;
	padding: 0 10px;
	font-size: 16px;
}

div table td{
	font-size: 14px;
	font-weight: 500;
	
}
</style>

</head>
<body>
<form class="container">
	<h1 class="title">전시 관리</h1>
	
	<div>
		<a class="btn" href="/semojeon/views/display/dpRegistForm.do">등록</a>	
	</div>
	<div class="container container-table">
	
		<table>
		<tr>
			<th>전시번호</th><th>전시명</th><th>시작일</th><th>종료일</th><th>관람 시간</th><th>관람 장소</th><th>단일 관람료</th><th>할인율</th><th>관람료_성인</th><th>관람료_청소년</th><th>관람료_어린이</th><th>관련 태그</th><th>작가명</th><th>전화번호</th><th>홈페이지</th><th>게시현황</th><th>작성자</th><th>수정</th><th>삭제</th>
			<c:forEach var="display" items="${list }">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>삭제 url</td>
				<td>수정 url</td>
			</c:forEach>
		</table>
	</div>




</form>
</body>
</html>