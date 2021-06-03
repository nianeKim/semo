<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("../../css/dpRegist.css");
</style>
<script>
	$(function() {
		$('textarea[name="tag"]').val("관련 태그가 있다면 콤마(, )로 구분하여 작성해주세요.\n예시 : 혼자보기좋은전시, 모던한, 디자인");
	})
</script>
</head>
<body>
	<div class="container">
		<p class="title">전시 등록하기</p>
		<form action="dpRegistResult.do" method="post">
			<input type="text" name="dname" placeholder="전시명" required autofocus>
			<div class="column_box">			
				<input type="text" name="start_date" placeholder="시작일" onfocus="(this.type='date')" class="column" required>
				<input type="text" name="end_date" placeholder="종료일" onfocus="(this.type='date')"  class="column" required>
			</div>
			<input type="text" name="hours" placeholder="관람 시간 (예시 : 오전 10:00 ~ 오후 8:00)" required>
			<input type="text" name="loc" placeholder="관람 장소">
			<input type="number" name="fee" placeholder="관람료 ('원'또는 ','없이 숫자만 입력해주세요.)">
			<textarea name="tag"></textarea>
			<textarea name="intro" required>전시에 대한 간략한 소개를 작성해주세요.</textarea>
			<div class="column_box">
				<div class="column">
					<label for="f1" class="file_label">상세 이미지 업로드</label>
					<input type="file" id="f1" name="poster">
				</div>
				<div class="column">
					<label for="f1" class="file_label">포스터 이미지 업로드</label>
					<input type="file" id="f1" name="poster" required>
				</div>
			</div>
			
		</form>
	</div>
</body>
</html>