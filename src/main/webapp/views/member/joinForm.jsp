<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@import url("../../css/member/join.css");
</style>

<script type="text/javascript">

/* 아이디 중복체크 및 인증메일 전송 */
function chkId(){
	/* 이메일 유효성 검사 */
	var reg_id = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	
	if(!frm.id.value) {
		alert("이메일을 입력하세요")
		frm.id.focus();
		return false;
	}else{
		if(!reg_id.test(frm.id.value)){
			alert("올바른 이메일 형식이 아닙니다.");
			frm.id.focus();
			return false;
		}else{
			/* 인증메일 전송 */
			$.post("mailResult.na", "id="+frm.id.value, function(data){
				alert(data);
				if(data=="인증메일전송"){
					var con = document.getElementById("chkIdDIV");
					con.style.display=='block';
				}
			});
			/* 아이디 중복확인 */
			$.post("confirmId.na", "id="+frm.id.value, function(data){
				$('#err_id').html(data);
			});
		} 
	}
}

	
/* function idChkDisplay() {
	var con = document.getElementById("chkIdDIV"); 
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else {
		con.style.display = 'none';
	}
}
 */
function chkPassword() {
	if(frm.password.value!=frm.confirmPassword.value){
		alert("비밀번호가 일치하지 않습니다")
		frm.password.focus();
		frm.password.value="";
		frm.confirmPassword.value="";
		return false;
	}
}

function chkNick_nm(){
	if(!frm.nick_nm.value) {
		alert("별명을 입력하세요")
		frm.nick_nm.focus();
		return false;
	}
	$.post("confirmNick_nm.na", "nick_nm="+frm.nick_nm.value, function(data){
		console.log(frm.nick_nm.value);
		$('#err').html(data);
	});
	
}

function chkMail(){
	if(frm.mail_chk.value!=frm.confirmPassword.value){
		alert("인증번호가 일치하지 않습니다")
		frm.mail_chk.focus();
		frm.mail_chk.value="";
		return false;
	}
}

function chkSubmit(){
	if(!frm.mail_chk.value){
		alert("이메일 인증이 완료되지 않았습니다.");
		return false;
	}
}


</script>
</head>
<body>
	<form action="joinResult.na" method="post" name="frm" onsubmit="return chkSubmit()" >
		<div class="container">
			<h1 class="title">회원가입하기</h1>
			
			<!-- 아이디 -->
			<div class="check">
				<input type="text" name="id" class="inputBox-left" required="required" autofocus="autofocus" placeholder="아이디(이메일)"> 
				<a class="chk-btn inputBox-right " onclick="chkId();">이메일 인증</a>
			</div> 
			<div class="chk-msg" id="err_id"></div>
			
			<!-- 이메일 인증 -->
			<div class="check" id="chkIdDIV">
				<input type="text" name="mail_chk" class="inputBox-left chkIdCode" placeholder="인증번호 입력">
				<a class="chk-btn"  id="mailConfirm_btn" onclick="chkMail();">인증</a> 
			</div>
			
			<!-- 비밀번호 -->
			<input type="password" name="password" placeholder="비밀번호" required="required" > 
			<input type="password" name="confirmPassword" placeholder="비밀번호 확인" required="required" onChange="chkPassword()"> 
			
			<!-- 이름 -->
			<input type="text" name="name" placeholder="이름" required="required">

			<!-- 별명 -->
			<div class="check">
				<input type="text" name="nick_nm" class="inputBox-left" placeholder="별명" required="required">
				<a class="chk-btn" id="chk-nick_nm-btn" onclick="chkNick_nm();">중복 확인</a>
			</div>
			<div class="chk-msg" id="err"></div>
			
			<!-- 연락처 -->
			<input type="tel" name="phone" title="전화번호 형식 : 010-***(*)-****" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="연락처" required="required">
			
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="gender" id="mal" value="m" checked="checked">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="gender" id="fem" value="f">
				<label for="fem" >여자</label>
			</div>

			<!-- 지역 -->
			<div class="loc-age">
				<select class="select-loc" name="loc" required="required">
					<option value="">지역</option>
					<option value="Seoul">서울</option>
					<option value="Sejong">세종</option>
					<option value="Gwangju">광주</option>
					<option value="Daegu">대구</option>
					<option value="Daejeon">대전</option>
					<option value="Busan">부산</option>
					<option value="Ulsan">울산</option>
					<option value="Incheon">인천</option>
					<option value="Gangwon">강원</option>
					<option value="Gyeonggi">경기</option>
					<option value="Gyeongbuk">경북</option>
					<option value="Gyeongnam">경남</option>
					<option value="Jeonbuk">전북</option>
					<option value="Jeonnam">전남</option>
					<option value="Chungbuk">충북</option>
					<option value="Chungnam">충남</option>
					<option value="Jeju">제주</option>
				</select> 
				
			<!-- 나이 -->
				<select class="select-age" name="age" required="required">
					<option value="">나이</option>
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대 이상</option>
				</select>
			</div>

			<!-- button -->
			<input type="submit" class="btn submit-btn" value="회원가입">
		</div>
	</form>
</body>
</html>