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
function del(delDno) {
	var con = confirm("해당 전시를 삭제 하시겠습니까?");
	if(con) {
		location.href="../display/dpDelete.do?dno="+delDno;
	}
}
</script>
</head>
<body>
<section class="container_wide">
	<div class="container-table">
		<table>
			<tr>
				<th>전시번호</th><th>전시명</th><th>시작일</th><th>종료일</th><th>관람 시간</th><th>관람 장소</th><th>단일 관람료</th><th>할인율</th><th>관람료_성인</th><th>관람료_청소년</th><th>관람료_어린이</th><th>관련 태그</th><th>작가명</th><th>전화번호</th><th>홈페이지</th><th>삭제여부</th><th>작성자</th><th>수정</th><th>삭제</th>
			</tr>
			<c:if test="${empty list}">
				<tr><td colspan="19">검색된 전시정보가 없습니다</td></tr>
			</c:if>
			<c:if test="${not empty list }">
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
						<td><a href="../display/dpUpdateForm.do?dno=${display.dno}" class="btn btn_stroke btn_small">수정</a></td>
						<td><a onclick="del(${display.dno})" class="btn btn_small">삭제</a></td>
					</tr>
				</c:forEach>	
			</c:if>
		</table>
	</div>
	<div class="backDiv">
		<a href="adminDisplay.na" class="btn btn_stroke">이전</a>
	</div>
</section>
</body>
</html>