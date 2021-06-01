<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	justify-content: space-between;
}

input {
	width: 100%;
	height: 48px;
	border: none;
	border-bottom: 1px solid #000;
	outline: 0;
	font-size: 15px;
	margin-bottom: 16px;
}

.btn_left {
 	width: 48%;
 	display: inline-block;
 	float: left;
 	text-align: center;
 	text-align: center;
 	padding: 16px;
 }
 
.btn_right {
 	width: 48%;
 	display: inline-block;
 	float: right;
 	text-align: center;
 	padding: 16px;
 }
 

 
</style>
</head>

<body>
<form action="login.na">
	<div class="container">
		<h1 class="title">로그인하기</h1>
		<!-- input -->
		<input type="text" name="id" required="required" autofocus="autofocus" placeholder="아이디(이메일)">
		<input type="text" name="password" required="required" placeholder="비밀번호">
		
		<input type="submit" class="btn" value="로그인">
		<p class="btn btn_stroke btn_left" onclick="location.href='joinForm.na'">회원가입</p>
		<p class="btn btn_stroke btn_right">아이디/비밀번호 찾기</p>
	</div>

</form>
</body>
</html>