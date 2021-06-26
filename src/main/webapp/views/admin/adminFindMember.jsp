<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/admin/admins.css">
<style type="text/css">
	.container-table{
		height: 300px;
		overflow-x: auto;
		overflow-y: auto;
		margin: 75px auto 0 auto;	
	}
</style>
<script type="text/javascript">
	function del(delMno) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="../member/delete.na?mno="+delMno;
		}
	}
	
</script>
</head>
<body>
<section class="container_wide">
	<div class="container-table">
		<table>
			<tr>
				<th>회원번호</th><th>Id</th><th>비밀번호</th><th>이름</th><th>별명</th><th>연락처</th><th>성별</th><th>연령대</th><th>지역</th><th>회원가입일</th><th>프로필</th><th>탈퇴여부</th><th>수정</th><th>탈퇴</th>
			</tr>
			<c:if test="${empty list}">
				<tr><td colspan="14">검색된 회원정보가 없습니다</td></tr>
			</c:if>
			<c:if test="${not empty list }">
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
						<td><a href="../member/updateForm.na?mno=${member.mno}" class="btn btn_small">수정</a></td>
						<td><a onclick="del(${member.mno})" class="btn btn_small">탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div class="backDiv">
		<a href="adminMember.na" class="btn btn_stroke">이전</a>
	</div>
</section>
</body>
</html>