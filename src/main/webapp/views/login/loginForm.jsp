<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn_mid {
	width: 48%;
	display: inline-block;
	text-align: center;
	padding: 16px;
}

.btn_left {
	margin-right: 18px;
}
</style>
</head>

<body>
	<div class="container">
		<form action="loginResult.na">
			<h1 class="title">로그인하기</h1>
			<!-- input -->
			<input type="text" name="id" required="required"
				autofocus="autofocus" placeholder="아이디(이메일)"> <input
				type="text" name="password" required="required" placeholder="비밀번호">

			<input type="submit" class="btn" value="로그인">
		</form>

		<a class="btn btn_stroke btn_mid btn_left" href="joinForm.na">회원가입</a>
		<a class="btn btn_stroke btn_mid" href="joinForm.na">아이디/비밀번호 찾기</a>
	</div>
</body>
</html>