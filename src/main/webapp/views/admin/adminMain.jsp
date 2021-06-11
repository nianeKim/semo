<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#member_icon{
	margin: 10px;
}

.main{
	font-size: 0;
}

.mng{
	display:inline-block;
	width:33.33333333%;
	text-align: center;
}

.txt{
	font-size: 16px;
}

a{
	display: inline-grid;
}
</style>
</head>
<body>
<div class="container_middle">
	<h1 class="title">관리자님 환영합니다</h1>
	<div class="main">
		<div class="mng">
			<a class="txt" href="adminDisplay.na">
				<img alt="" src="../../images/icons/regist_display.png">전시 관리
			</a>
		</div>
		
		<div class="mng">
			<a class="txt" href="adminMember.na">
				<img id = "member_icon" alt="" src="../../images/icons/user.png" width="90">회원 관리
			</a>
		</div>
		
		<div class="mng">
			<a class="txt" href="adminBoard.na">
				<img alt="" src="../../images/icons/written_story.png">스토리 관리
			</a>
		</div>
	</div>
</div>
</body>
</html>