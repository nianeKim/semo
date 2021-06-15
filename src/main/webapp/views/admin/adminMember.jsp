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
	overflow: auto;
}

.container-table{
	position: absolute;
}

.btn{
	width: 150px;
	height: 55px;
	float: right;
	text-align: center;
	line-height: 55px;
}

.btn_small {
	display: contents;
	width: initial;
	height: initial;
	font-size: 14px;
	text-align: right;
	padding: 0;
	margin: 0;
	border: 0;
	color: #aaa;
	font-weight: 500;
	text-decoration: underline;
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

<script type="text/javascript">
function del() {
	var con = confirm("탈퇴처리 하시겠습니까?");
	if(con) {
		location.href="../member/delete.na?mno=${member.mno}";
	}
}
</script>

</head>
<body>
<div class = "container">
<h1 class="title">회원</h1>
	<div class="container container-table">
		<table>
			<tr>
				<th>회원번호</th><th>Id</th><th>비밀번호</th><th>이름</th><th>별명</th><th>연락처</th><th>성별</th><th>연령대</th><th>지역</th><th>회원가입일</th><th>프로필</th><th>탈퇴여부</th><th>수정</th><th>탈퇴</th>
			</tr>
			<c:if test="${empty list} ">
				<tr><th colspan="12">회원 데이터가 존재하지 않습니다</th></tr>
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
						<td><a href="../member/updateForm.na?mno=${member.mno}" class="btn btn_stroke btn_small">수정</a></td>
						<td><a onclick="del()" class="btn btn_stroke btn_small">탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>
			
		</table>
	</div>
	
	<div align="center">
	<c:if test="${startPage > PAGE_PER_BLOCK }">
		<button onclick="location.href='adminMember.na?pageNum=${startPage-1}'">이전</button>
	</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<button onclick="location.href='adminMember.na?pageNum=${i}'">${i }</button>
		</c:forEach>
		<!-- 보여줄 것이 남아있다 -->
		<c:if test="${endPage < totalPage }">
			<button onclick="location.href='adminMember.na?pageNum=${endPage+1}'">다음</button>
		</c:if>	
	</div>
</div>
</body>
</html>