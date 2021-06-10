<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("../../css/display/reserveForm.css");
</style>
<script type="text/javascript">
	$(function() {
		// 수량 감소
		$('.minus').on('click', function(e) {
			e.preventDefault();
			var stat = $(this).siblings("span").text();
			var num = parseInt(stat);
			var fee = $(this).parent().siblings(".fee").text();
			var sliceFee = fee.split("원");
			
			num -= 1;

			if (num <= 0) {
				num = 0;
				$(this).siblings(".fee_number").css("color", "#aaa");
				alert('최저 수량입니다.');
			}
			
			var sumFee = num * sliceFee[0];
			
			$(this).siblings("span").text(num);
			$(this).siblings("input").val(num);
			$(this).siblings(".fee_number").text(sumFee+"원");
		});
		
		// 수량 증가
		$('.plus').on('click', function(e) {
			e.preventDefault();
			var stat = $(this).siblings("span").text();
			var num = parseInt(stat);
			var fee = $(this).parent().siblings(".fee").text();
			var sliceFee = fee.split("원");

			num += 1;
			
			if (num >= 20) {
				num = 20;
				alert('최고 수량입니다.');
			}
			
			var sumFee = num * sliceFee[0];
			$(this).siblings("span").text(num);
			$(this).siblings("input").val(num);
			$(this).siblings(".fee_number").css("color", "var(--point-color)");
			$(this).siblings(".fee_number").text(sumFee+"원");
		});
		
		// cnt null check onsubmit
		/* $('form').submit(function() {
			alert("fff");
			if ($('input[type="hidden"]').val() == null || $('input[type="hidden"]').val() == '') {
				$('input[type="hidden"]').val(0);
				alert($('input[type="hidden"]').val());
			}
		}) */
	})
	
	// cnt null check onsubmit
	function submitNullChk() {
		alert("fff");
		if (frm.cnt == null || frm.cnt == '') {
			frm.cnt.value = 0;
		}
		
		if (frm.cnt_adult == null || frm.cnt_adult == '') {
			frm.cnt_adult.value = 0;
			alert(frm.cnt_adult.value);
		}
		
		if (frm.cnt_teen == null || frm.cnt_teen == '') {
			frm.cnt_teen.value = 0;
		}
		
		if (frm.cnt_child == null || frm.cnt_child == '') {
			frm.cnt_child.value = 0;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<p class="title">예매하기</p>
		<form action="reserveResult.do?dno=${display.dno }&mno=${member.mno }" method="post" name="frm" onsubmit="resutn submitNullChk()">
			<div class="section">
				<!-- 수량 선택 -->
				<c:if test="${display.fee != 0 }">
					<p class="option_title">단일 관람료</p>
					<div class="fee_box">
						<p class="fee">${display.fee }원</p>
						<div class="cnt_box">
							<div class="line_box minus">
								<div class="line"></div>
							</div>
							<span>0</span>
							<div class="line_box plus">
								<div class="line"><div class="line vertical"></div></div>
							</div>
							<input type="hidden" name="cnt" value="0">
							<p class="fee_number">0원</p>
						</div>
					</div>
				</c:if>
				<c:if test="${display.fee_adult != 0 }">
					<p class="option_title">성인</p>
					<div class="fee_box">
						<p class="fee">${display.fee_adult }원</p>
						<div class="cnt_box">
							<div class="line_box minus">
								<div class="line"></div>
							</div>
							<span>0</span>
							<div class="line_box plus">
								<div class="line"><div class="line vertical"></div></div>
							</div>
							<input type="hidden" name="cnt_adult" value="0">
							<p class="fee_number">0원</p>
						</div>
					</div>
				</c:if>
				<c:if test="${display.fee_teen != 0 }">
					<p class="option_title">청소년</p>
					<div class="fee_box">
						<p class="fee">${display.fee_teen }원</p>
						<div class="cnt_box">
							<div class="line_box minus">
								<div class="line"></div>
							</div>
							<span>0</span>
							<div class="line_box plus">
								<div class="line"><div class="line vertical"></div></div>
							</div>
							<input type="hidden" name="cnt_teen" value="0">
							<p class="fee_number">0원</p>
						</div>
					</div>
				</c:if>
				<c:if test="${display.fee_child != 0 }">
					<p class="option_title">어린이</p>
					<div class="fee_box">
						<p class="fee">${display.fee_child }원</p>
						<div class="cnt_box">
							<div class="line_box minus">
								<div class="line"></div>
							</div>
							<span>0</span>
							<div class="line_box plus">
								<div class="line"><div class="line vertical"></div></div>
							</div>
							<input type="hidden" name="cnt_child" value="0">
							<p class="fee_number">0원</p>
						</div>
					</div>
				</c:if>
				<p>총합: </p>
			</div>
			<div class="section">
				<p class="option_title">예매자 정보</p>
				<table class="member_info">
					<tr>
						<th>예매자</th>
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${member.phone }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.id }</td>
					</tr>
					<tr>
						<th>예매내용</th>
						<td>${display.dname }, 총 몇매</td>
					</tr>
				</table>
			</div>
			<div class="section">
				<p class="option_title">결제 방식 선택</p>
				<div class="radio_box">
					<div>					
						<input class="magic-radio" type="radio" name="pay" id="p1" checked="checked">
						<label for="p1">카드결제</label>
					</div>
					<div>
						<input class="magic-radio" type="radio" name="pay" id="p2">
						<label for="p2">카카오페이</label>
					</div>
					<div>
						<input class="magic-radio" type="radio" name="pay" id="p3">
						<label for="p3">네이버페이</label>
					</div>
					<div>
						<input class="magic-radio" type="radio" name="pay" id="p4">
						<label for="p4">토스</label>
					</div>
					<div>
						<input class="magic-radio" type="radio" name="pay" id="p5">
						<label for="p5">페이팔(PayPal) 결제</label>
					</div>
				</div>
			</div>
			<div class="section">
				<p class="option_title">카드 정보 입력</p>
				<input placeholder="카드번호 - 없이 입력">
				<input placeholder="유효기간(월)">
				<input placeholder="유효기간(일)">
				<input placeholder="비밀번호 앞 두자리">
			</div>
			<input type="submit" class="btn" value="예매하기">
		</form>
	</div>
</body>
</html>