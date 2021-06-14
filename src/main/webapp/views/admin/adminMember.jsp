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
	position: absolute;
	overflow: auto;
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
	<h1 class="title">회원</h1>

	<div class="container container-table">
		<table>
		<tr>
			<th>회원번호</th><th>Id</th><th>비밀번호</th><th>이름</th><th>별명</th><th>연락처</th><th>성별</th><th>연령대</th><th>지역</th><th>회원가입일</th><th>프로필</th><th>탈퇴여부</th><th>수정</th><th>삭제</th>
			<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.mno}</td>
				<td>${member.id}</td>
				<td>${member.password}</td>
				<td>${member.name}</td>
				<td>${member.nick_nm}</td>
				<td>${member.phone}</td>
				<td>${member.gender}</td>
				<td>${member.age}</td>
				<td>${member.loc}</td>
				<td>${member.reg_date}</td>
				<td>${member.profile}</td>
				<td>${member.del}</td>
				<td><a href="../member/UpdateForm.nambno=${member.mno}" class="btn btn_stroke btn_small">수정</a></td>
				<td>삭제 url</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</form>
</body>
</html>