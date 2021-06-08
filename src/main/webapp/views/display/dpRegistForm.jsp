<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("../../css/display/dpRegist.css");
</style>
<script>
	$(function() {
		$('textarea[name="tag"]').attr('placeholder', "관련 태그가 있다면 콤마(, )로 구분하여 작성해주세요.\n예시 : 혼자보기좋은전시, 모던한, 디자인");
		
		// upload file name change
		$('input[type="file"]').on('change', function() {
			var fileName = $(this).val();
			var realFileName = fileName.split("\\");
			$(this).siblings('label').text(realFileName[2]); 
		})
	})
	
	// onsubmit
	function valueChk() {
		// number input value check
		if (frm.fee.value == "" || frm.fee.value == null) {
			frm.fee.value = 0;
		}
		
		if (frm.discount.value == "" || frm.discount.value == null) {
			frm.discount.value = 0;
		}
		
		if (frm.fee_adult.value == "" || frm.fee_adult.value == null) {
			frm.fee_adult.value = 0;
		}
		
		if (frm.fee_teen.value == "" || frm.fee_teen.value == null) {
			frm.fee_teen.value = 0;
		}
		
		if (frm.fee_child.value == "" || frm.fee_child.value == null) {
			frm.fee_child.value = 0;
		}
	} 
	
	// 전시명 중복 체크
	function confirm() {
		if (frm.dname.value == "") {
			alert("전시명을 입력해주세요.");
			frm.dname.focus();
			return false;
		}
		
		$.post("confirm.do", "dname="+frm.dname.value, function(data) {
			console.log(data);
			$('.err').html(data);
		})
	}
</script>
</head>
<body>
	<div class="container">
		<p class="title">전시 등록하기</p>
		<form action="dpRegistResult.do" method="post" name="frm" onsubmit="return valueChk()" enctype="multipart/form-data">
			<div class="column_box column_box2">
				<div class="column column2">
					<input type="text" name="dname" placeholder="전시명 *" required autofocus>
					<p class="err"></p>				
				</div>
				<input type="button" class="btn btn_stroke column column2" onclick="confirm()" value="중복 체크">
			</div>
			<div class="column_box">			
				<input type="text" class="column" name="start_date" placeholder="시작일 *" onfocus="(this.type='date')" required>
				<input type="text" class="column" name="end_date" placeholder="종료일 *" onfocus="(this.type='date')" required>
			</div>
			<input type="text" name="hours" placeholder="관람 시간 * (예시 : 오전 10:00 ~ 오후 8:00)" required>
			<input type="text" name="loc" placeholder="관람 장소 *">
			
			<!-- 관람료 -->
			<p class="option_title">단일 관람료</p>
			<div class="column_box">			
				<input type="number" class="column" name="fee" placeholder="관람료 ('원'또는 ','없이 숫자만 입력해주세요.)">
				<input type="number" class="column" name="discount" placeholder="할인율 (%없이 숫자만 입력해주세요.)">
			</div>
			
			<p class="option_title">세부 관람료</p>
			<div class="fee_box">
				<input type="number" name="fee_adult" placeholder="성인">
				<input type="number" name="fee_teen" placeholder="청소년">
				<input type="number" name="fee_child" placeholder="어린이">
			</div>
			
			<!-- 전시 소개 -->
			<p class="option_title">전시 소개 *</p>
			<textarea name="intro" placeholder="전시에 대한 간략한 소개를 작성해주세요." required></textarea>
			
			<!-- 관련 태그 -->
			<p class="option_title">관련 태그</p>
			<textarea name="tag"></textarea>
			
			<input type="text" name="artist" placeholder="작가명">
			<input type="text" name="tel" placeholder="전화번호 (-없이 입력해주세요.)">
			<input type="text" name="home_pg" placeholder="홈페이지">
			
			<!-- 상세 내용 -->
			<p class="option_title">상세 내용</p>
			<textarea wrap="hard" name="detail_txt" placeholder="상세 정보에 대한 내용이 있다면 입력해주세요."></textarea>
			
			<!-- 이미지 업로드 -->
			<div class="column_box pd">
				<div class="column">
					<label for="f1" class="file_label">상세 정보 이미지 업로드</label>
					<input type="file" id="f1" name="detail_img">
				</div>
				<div class="column">
					<label for="f2" class="file_label">포스터 이미지 업로드 *</label>
					<input type="file" id="f2" name="poster" required>
				</div>
			</div>
			
			<div class="column_box">
				<input type="submit" class="btn" value="등록하기">
				<input type="button" class="btn btn_stroke reset" onclick="history.go(-1)" value="취소">
			</div>
		</form>
	</div>
</body>
</html>