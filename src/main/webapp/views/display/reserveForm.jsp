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
		var sumCnt = 0;
		
		// 수량 감소
		$('.minus').on('click', function(e) {
			e.preventDefault();
			var stat = $(this).siblings("span").text();
			var num = parseInt(stat);
			var fee = $(this).parent().siblings(".fee").text();
			var sliceFee = fee.split("원");
			
			
			num -= 1;

			if (num < 0) {
				num = 0;
				alert('최저 수량입니다.');
			}
			
			if (num == 0) {
				$(this).siblings(".fee_number").css("color", "#aaa");
			}
			
			var sumFee = num * sliceFee[0];
			if (sumCnt <= 0) {
				sumCnt = 0;
			} else {
				sumCnt--;	
			}
			
			$(this).siblings("span").text(num);
			$(this).siblings("input").val(num);
			$(this).siblings(".fee_number").text(sumFee+"원");
			$('.member_info td .sum_count').text(sumCnt);
			$.totalFee();
		});
		
		// 수량 증가
		$('.plus').on('click', function(e) {
			e.preventDefault();
			var stat = $(this).siblings("span").text();
			var num = parseInt(stat);
			var fee = $(this).parent().siblings(".fee").text();
			var sliceFee = fee.split("원");

			num += 1;
			
			if (num > 20) {
				num = 20;
				alert('최고 수량입니다.');
			}
			
			var sumFee = num * sliceFee[0];
			sumCnt++;
			
			$(this).siblings("span").text(num);
			$(this).siblings("input").val(num);
			$(this).siblings(".fee_number").css("color", "var(--point-color)");
			$(this).siblings(".fee_number").text(sumFee+"원");
			$('.member_info td .sum_count').text(sumCnt);
			$.totalFee();
		});
		
		// 전체 가격 찾기
		$.totalFee = function() {
			var feeText1 = $("#fee1").text().split("원")[0];
			var fee1Num = Number(feeText1);
			
			var feeText2 = $("#fee2").text().split("원");
			var fee2 = feeText2[0];
			var fee2Num = Number(fee2);
			
			var feeText3 = $("#fee3").text().split("원");
			var fee3 = feeText3[0];
			var fee3Num = Number(fee3);
			
			var feeText4 = $("#fee4").text().split("원");
			var fee4 = feeText4[0];
			var fee4Num = Number(fee4);
			
			var totalFee = 0;
			
			if (fee1Num == "" || fee1Num == null) {
				totalFee = fee2Num + fee3Num + fee4Num;
			} else {
				totalFee = fee1Num + fee2Num + fee3Num + fee4Num;
			}
			
			$('.member_info td .total_fee').text(totalFee+"원");
		}
	});
	
	// cnt null check onsubmit
	function submitNullChk() {
		var inputAll = document.querySelectorAll("input[type='hidden']");
		var len = inputAll.length;
		
		if (len == 3) {
			if (inputAll[0].value == 0 && inputAll[1].value == 0 && inputAll[2].value == 0) {
				alert('수량을 입력해주세요.');
				return false;
			}
		} else if (len == 2) {
			if (inputAll[0].value == 0 && inputAll[1].value == 0) {
				alert('수량을 입력해주세요.');
				return false;
			}
		} else if (len == 1) {
			if (inputAll[0].value == 0) {
				alert('수량을 입력해주세요.');
				return false;
			}
		}
		
		
	}
</script>
</head>
<body>
	<div class="container">
		<p class="title">예매하기</p>
		<form action="reserveResult.do?dno=${display.dno }&mno=${member.mno }" method="post" name="frm" onsubmit="return submitNullChk()">
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
							<input type="hidden" name="cnt" class="input_hidden" value="0">
							<p class="fee_number" id = "fee1">0원</p>
						</div>
					</div>
				</c:if>
				<c:if test="${display.fee == 0 }">
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
							<input type="hidden" name="cnt_adult" class="input_hidden" value="0">
							<p class="fee_number" id = "fee2">0원</p>
						</div>
					</div>
				
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
							<input type="hidden" name="cnt_teen" class="input_hidden" value="0">
							<p class="fee_number" id = "fee3">0원</p>
						</div>
					</div>
				
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
							<input type="hidden" name="cnt_child" class="input_hidden" value="0">
							<p class="fee_number" id = "fee4">0원</p>
						</div>
					</div>
				</c:if>
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
						<td>${display.dname }, 총 <span class="sum_count">0</span>매, <span class="total_fee">0원</span></td>
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