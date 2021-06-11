<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/display/dpRegist.css");</style>
<script>
	$(function() {
		$('textarea[name="tag"]').attr('placeholder', "관련 태그가 있다면 콤마(, )로 구분하여 작성해주세요.\n예시 : 혼자보기좋은전시, 모던한, 디자인");
		
		// upload file name change
		$('input[type="file"]').on('change', function() {
			var fileName = $(this).val();
			var realFileName = fileName.split("\\");
			$(this).siblings('label').text(realFileName[2]); 
		})
		
		$('input[name="tag"]').on('change', function() {
			if ($(this).is(":checked")) {
				$(this).siblings("label").addClass('active');
			} else {
				$(this).siblings("label").removeClass('active');
			}
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
			<input type="text" name="spot" placeholder="관람 장소 *">
			<input type="text" name="address" placeholder="주소 *">
			<select name="loc" required="required">
				<option>지역</option>
				<option>서울</option>
				<option>세종</option>
				<option>광주</option>
				<option>대구</option>
				<option>대전</option>
				<option>부산</option>
				<option>울산</option>
				<option>인천</option>
				<option>강원</option>
				<option>경기</option>
				<option>경북</option>
				<option>경남</option>
				<option>전북</option>
				<option>전남</option>
				<option>충북</option>
				<option>충남</option>
				<option>제주</option>
			</select> 
			
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
			<div class="tag_box">
				<!-- tag -->
				<div class="label_box">
					<label class="tag" for="t1">혼자보기좋은</label><input
						type="checkbox" name="tag" id="t1" value="혼자보기좋은">
				</div>
				<div class="label_box">
					<label class="tag" for="t2">감성</label><input type="checkbox"
						name="tag" id="t2" value="감성">
				</div>
				<div class="label_box">
					<label class="tag" for="t3">미디어</label><input type="checkbox"
						name="tag" id="t3" value="미디어">
				</div>
				<div class="label_box">
					<label class="tag" for="t4">회화</label><input type="checkbox"
						name="tag" id="t4" value="회화">
				</div>
				<div class="label_box">
					<label class="tag" for="t5">사진</label><input type="checkbox"
						name="tag" id="t5" value="사진">
				</div>
				<div class="label_box">
					<label class="tag" for="t6">조각</label><input type="checkbox"
						name="tag" id="t6" value="조각">
				</div>
				<div class="label_box">
					<label class="tag" for="t7">설치미술</label><input type="checkbox"
						name="tag" id="t7" value="설치미술">
				</div>
				<div class="label_box">
					<label class="tag" for="t8">공예</label><input type="checkbox"
						name="tag" id="t8" value="공예">
				</div>
				<div class="label_box">
					<label class="tag" for="t9">디지털</label><input type="checkbox"
						name="tag" id="t9" value="디지털">
				</div>
				<div class="label_box">
					<label class="tag" for="t10">누아르</label><input type="checkbox"
						name="tag" id="t10" value="누아르">
				</div>
				<div class="label_box">
					<label class="tag" for="t11">디자인</label><input type="checkbox"
						name="tag" id="t11" value="디자인">
				</div>
				<div class="label_box">
					<label class="tag" for="t12">예술</label><input type="checkbox"
						name="tag" id="t12" value="예술">
				</div>
				<div class="label_box">
					<label class="tag" for="t13">공연</label><input type="checkbox"
						name="tag" id="t13" value="공연">
				</div>
			</div>
			
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