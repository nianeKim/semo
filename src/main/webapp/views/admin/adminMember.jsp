<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("../../css/admin/admins.css");

/* 가로스크롤 생성 */
.container{
	display: grid;
	width: 80%;
	font-family: inherit;
	overflow: auto;
}

.container-table{
	position: absolute;
}

</style>

<script type="text/javascript">
function del(delMno) {
	var con = confirm("탈퇴처리 하시겠습니까?");
	if(con) {
		location.href="../member/delete.na?mno="+delMno;
	}
}

$(document).ready(function() {
	$('#page'+${currentPage}).css({
		"color" : "var(--point-color)",
		"font-weight" : "600"
	});
});
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
						<td><a href="../member/updateForm.na?mno=${member.mno}" class="btn btn_small">수정</a></td>
						<td><a onclick="del(${member.mno})" class="btn btn_small">탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>
			
		</table>
	</div>
<!-- paging -->
	<div class="paging nums">
		<div class="items">
			<div class="prev_btn">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='adminMember.na?pageNum=${startPage-1}'">
						<img alt="이전" src="../../images/icons/arrow_left1.png">
						<img alt="이전" src="../../images/icons/arrow_left1.png">
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='adminMember.na?pageNum=${currentPage - 1}'">
						<img alt="이전" src="../../images/icons/arrow_left1.png">
					</button>
				</c:if>
			</div>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<span id="page${i}" class="page_num" onclick="location.href='adminMember.na?pageNum=${i}'">${i}</span>
			</c:forEach>
			<div class="next_btn">
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='adminMember.na?pageNum=${currentPage + 1}'">
						<img alt="다음" src="../../images/icons/arrow_right.png">
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class=last onclick="location.href='adminMember.na?pageNum=${endPage + 1}'">
						<img alt="다음" src="../../images/icons/arrow_right.png">
						<img alt="다음" src="../../images/icons/arrow_right.png">
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->	
</div>
</body>
</html>