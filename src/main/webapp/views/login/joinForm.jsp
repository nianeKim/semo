<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<style type="text/css">


select {
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;

	font-size: 15px;
	font-weight: 500;
	
	color: #000000;
	margin: 0;

}
</style>
</head>
<body>
	<form action="joinResult.na" method="post">
		<div class="container">
			<h1 class="title">회원가입하기</h1>
			<!-- input -->
			<input type="text" name="id" required="required" autofocus="autofocus" placeholder="아이디(이메일)"> 
			<input type="password" name="password" placeholder="비밀번호"> 
			<input type="password" name="confirmPassword" placeholder="비밀번호 확인" required="required"> 
			<input type="text" name="name" placeholder="이름" required="required"> 
			<input type="text" name="nick_nm" placeholder="별명" required="required"> 
			<input type="tel" name="phone" placeholder="연락처" required="required">
			<div>
				<input class="magic-radio" type="radio" name="gender" id="mal" checked="checked">
				<label for="mal">남자</label>
				<input class="magic-radio" type="radio" name="gender" id="fem">
				<label for="fem">여자</label>
			</div>		
			
			<select class="sel" name="지역" required="required">
				<option value="">지역</option>
				<option value="seoul">서울</option>
				<option value="sejong">세종</option>
				<option value="gwangju">광주</option>
				<option value="">대구</option>
				<option value="">대전</option>
				<option value="">부산</option>
				<option value="">울산</option>
				<option value="">인천</option>
				<option value="">강원</option>
				<option value="">경기</option>
				<option value="">경북</option>
				<option value="">경남</option>
				<option value="">전북</option>
				<option value="">전남</option>
				<option value="">충북</option>
				<option value="">충남</option>
				<option value="">제주</option>
			</select> 
			<select name="나이" required="required">
				<option value="">나이</option>
				<option value="10">10대</option>
				<option value="20">20대</option>
				<option value="30">30대</option>
				<option value="40">40대</option>
				<option value="50">50대</option>
				<option value="60">60대 이상</option>
			</select>
			<!-- button -->
			<input type="submit" class="btn" value="회원가입">
		</div>
	</form>
</body>
</html>