<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// nav active control
	$(document).ready(function() { // window.onload보다 document.ready가 더 빠르고 안정적!
		var curUrl = window.location.href; // 현재 url가져오기
		var sliceUrl = curUrl.split("/"); // 필요한 부분만 슬라이스
		
		//$('.nav_main a').removeClass("active");
		$('#'+sliceUrl[5]).addClass("active");
	})
</script>
</head>
<body>
	<header>
		<div class='header_inner'>
			<div class='header_logo'>
				<a href="../display/dpMain.do?tab=1"><img src='../../images/logo.svg'></a>
			</div>
			<nav>
				<ul class='nav_sub'>
					<c:if test="${empty id }">
						<li><a href="../member/loginForm.na">로그인</a></li>
						<li><a href="../member/joinForm.na">회원가입</a></li>
					</c:if>
					<c:if test="${not empty id }">
						<c:if test="${id != 'admin'}">
							<li><a href="../member/logout.na">로그아웃</a></li>
						</c:if>
						<c:if test="${id == 'admin'}">
							<li><a href="../member/logout.na">로그아웃</a></li>
							<li><a href="../admin/adminMain.na">관리자페이지</a></li>
						</c:if>
					</c:if>
				</ul>
				<ul class='nav_main'>
					<li><a href="../display/dpMain.do?tab=1" id="display">전시</a></li>
					<li><a href="../board/boardMain.wo" id="board">스토리</a></li>
					<li>
						<c:if test="${not empty id }">
							<a href="../myPage/myMain.na" id="myPage">마이페이지</a>
						</c:if>
						<c:if test="${empty id }" >
							<a href="../member/loginForm.na" id="myPage">마이페이지</a>
						</c:if>
					</li>
					<li><a href="../myPage/myBookmarkList.wo"><img alt="북마크" src="../../images/icons/bookmark.png" ></a></li>
					<li><a href="#"><img alt="검색" src="../../images/icons/search.png"></a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>

</html>