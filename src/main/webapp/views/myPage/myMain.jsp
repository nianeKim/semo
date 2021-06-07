<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.container_middle{
	width: 60%;

}
.topView{
	overflow: hidden;
	width:100%;
	height: 146px;
	text:0;
}

.mp-profile{
	float:left;
	width: 40%;
}

.mp-menu{
	float:left;
	width: 60%;

}
.profile{
	float:left;
	width: 146px;
	height: 146px;
}

.profile-right{
	float:left;
	text-align: center;
}
.update-btn{
	color: #666666;
	font-size: 13px;
	text-decoration: underline;
}

</style>
</head>
<body>
<div class="container_middle">

	<!-- 페이지 상단 -->
	<div class="topView">
	
		<!-- 프로필 영역 -->
		<div class="mp-profile">
			<div class="profile">
				<img alt="프로필" src="" >
			</div>
			<div class="profile-right">
				<h3>${member.name}님,<br>안녕하세요</h3>
				<p><a class="update-btn" href="../member/updateForm.na" >내 정보 수정</a></p>
			</div>
		</div>
		
		<!-- 메뉴 영역 -->
		<div class="mp-menu">
		<ul>
			<li>북마크
			<li>구매내역
			<li>등록한 전시
			<li>작성한 스토리		
		</ul>
		</div>
	</div>
	
	
	<!-- 페이지 하단 -->
	<div class="bottomView">
	구매내역
	</div>
</div>
</body>
</html>