<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/display/dpRegist.css");</style>
<script type="text/javascript">
	$(function() {	
		// upload file name change
		$('input[type="file"]').on('change', function() {
			var fileName = $(this).val();
			var realFileName = fileName.split("\\");
			$(this).siblings('label').text(realFileName[2]); 
		})
		
		// select box에 값 세팅
		var selectValue = "${display.loc}";
		$('select option[value=' + selectValue + ']').attr('selected', 'selected');
	})
	
	// 전시명 중복 체크
	function confirm() {
		if (frm.dname.value == "") {
			alert("전시명을 입력해주세요.");
			frm.dname.focus();
			return false;
		}
		
		$.post("confirm.do", "dname="+frm.dname.value, function(data) {
			$('.err').html(data);
		})
	}
</script>
</head>
<body>
	<div class="container">
		<p class="title">전시 수정하기</p>
		<form action="dpUpdateResult.do?dno=${display.dno }&prevUrl=${prevUrl}" method="post" name="frm" onsubmit="return valueChk()" enctype="multipart/form-data">
			<div class="column_box column_box2">
				<div class="column column2">
					<input type="text" name="dname" placeholder="전시명" autofocus value="${display.dname }" required>
					<p class="err"></p>
				</div>
				<input type="button" class="btn btn_stroke column column2" onclick="confirm()" value="중복 체크">
			</div>
			<div class="column_box">
				<input type="text" class="column" name="start_date"
					placeholder="시작일" onfocus="(this.type='date')" value="${display.start_date }" required>
				<input type="text" class="column" name="end_date"
					placeholder="종료일" onfocus="(this.type='date')" value="${display.end_date }" required>
			</div>
			<input type="text" name="hours" placeholder="관람 시간" value="${display.hours }" required> 
			<input type="text" name="spot" placeholder="관람 장소" value="${display.spot }" required>
			<input type="text" name="address" placeholder="주소 *" value="${display.address }" required>
			<select name="loc" required="required">
				<option>지역</option>
				<option value="서울">서울</option>
				<option value="세종">세종</option>
				<option value="광주">광주</option>
				<option value="대구">대구</option>
				<option value="대전">대전</option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
				<option value="인천">인천</option>
				<option value="강원">강원</option>
				<option value="경기">경기</option>
				<option value="경북">경북</option>
				<option value="경남">경남</option>
				<option value="전북">전북</option>
				<option value="전남">전남</option>
				<option value="충북">충북</option>
				<option value="충남">충남</option>
				<option value="제주">제주</option>
			</select> 
			
			<!-- 관람료 -->
			<p class="option_title">단일 관람료</p>
			<div class="column_box">
				<input type="number" class="column" name="fee"
					placeholder="관람료" value="${display.fee }">
				<input type="number" class="column" name="discount"
					placeholder="할인율" value="${display.discount }">
			</div>

			<p class="option_title">세부 관람료</p>
			<div class="fee_box">
				<input type="number" name="fee_adult" placeholder="성인" value="${display.fee_adult }">
				<input type="number" name="fee_teen" placeholder="청소년" value="${display.fee_teen }">
				<input type="number" name="fee_child" placeholder="어린이" value="${display.fee_child }">
			</div>

			<!-- 전시 소개 -->
			<p class="option_title">전시 소개</p>
			<pre><textarea name="intro" placeholder="전시에 대한 간략한 소개를 작성해주세요." required>${display.intro }</textarea></pre>

			<!-- 관련 태그 -->
			<p class="option_title">관련 태그</p>
			<pre><textarea name="tag">${display.tag }</textarea></pre>

			<input type="text" name="artist" placeholder="작가명" value="${display.artist }">
			<input type="text" name="tel" placeholder="전화번호 (-없이 입력해주세요.)" value="${display.tel }">
			<input type="text" name="home_pg" placeholder="홈페이지" value="${display.home_pg }">

			<!-- 상세 내용 -->
			<p class="option_title">상세 내용</p>
			<pre><textarea wrap="hard" name="detail_txt" placeholder="상세 정보에 대한 내용이 있다면 입력해주세요.">${display.detail_txt }</textarea></pre>

			<!-- 이미지 업로드 -->
			<div class="column_box pd">
				<div class="column">
					<c:if test="${empty display.detail_img }">
						<label for="f1" class="file_label">상세 정보 이미지 업로드</label>
					</c:if>
					<c:if test="${not empty display.detail_img }">
						<label for="f1" class="file_label">${display.detail_img }</label>
					</c:if>
					<input type="file" id="f1" name="detail_img">
				</div>
				<div class="column">
					<label for="f2" class="file_label">${display.poster }</label>
					<input type="file" id="f2" name="poster">
				</div>
			</div>

			<div class="column_box">
				<input type="submit" class="btn" value="수정하기">
				<input type="button" class="btn btn_stroke reset" onclick="history.go(-1)" value="취소">
			</div>
		</form>
	</div>
</body>
</html>