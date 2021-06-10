<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/myPage.css">
</head>
<body>
	<div class="container_middle">
		<!-- 페이지 상단 -->
		<div class="topView">
			<!-- 프로필 영역 -->
			<div class="profile">
				<div class="profile_left">
					<img class="profileImg" alt="프로필사진" src="/semojeon/upload/${member.profile}">
				</div>
				<div class="profile_right">
					<h3>${member.nick_nm}님,<br>안녕하세요</h3>
					<a class="update-btn" href="../member/updateForm.na">내 정보 수정</a>
				</div>
			</div>

			<!-- 메뉴 영역 -->
			<div class="my_category">
				<ul>
					<li><img class="icons" id="bookmark" src="../../images/icons/my_bookmark.png"><a>북마크</a></li>
					<li><img class="icons" id="buy_list" src="../../images/icons/buy_list.png"><a>구매내역</a></li>
					<li><img class="icons" id="regist_display" src="../../images/icons/regist_display.png"><a>등록한 전시</a></li>
					<li><img class="icons" id="written_story" src="../../images/icons/written_story.png"><a>작성한 스토리</a></li>
				</ul>
			</div>
		</div>

		<!-- 내용 -->
		<div class="bottomView">구매내역</div>
	</div>
</body>
</html>