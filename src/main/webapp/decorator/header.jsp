<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<li><a href="../admin/admin.na">관리자페이지</a></li>
						</c:if>
					</c:if>
				</ul>
				<ul class='nav_main'>
					<li><a href="../display/dpMain.do?tab=1">전시</a></li>
					<li><a href="../board/boardMain.wo">스토리</a></li>
					<li><a href="../myPage/myMain.na">마이페이지</a></li>
					<li><a href="../myPage/myBookmarkList.wo"><img alt="북마크" src="../../images/icons/bookmark.png" ></a></li>
					<li><a href="#"><img alt="검색" src="../../images/icons/search.png"></a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>

</html>