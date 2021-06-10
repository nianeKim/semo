<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/display/dpView.css");</style>
<c:set var="id" value='${sessionScope.id}'></c:set>
<c:set var="mno" value='${sessionScope.mno}'></c:set>
<script type="text/javascript">
	$(function() {
		// input range rate 조절
		$('input[type="range"]').on('change mousemove', function() {
			var val = ($(this).val() - $(this).attr('min')) / ($(this).attr('max') - $(this).attr('min'));

		    $(this).css('background-image',
		                '-webkit-gradient(linear, left top, right top, '
		                + 'color-stop(' + val + ', #ff5f06), '
		                + 'color-stop(' + val + ', #e4e4e4)'
		                + ')'
           	);
		    // span에 등록한 별점(range value) 넣기
		    $('#input_span').text($(this).val());
		});
		
		// scroll top
		$('.scroll_top').on('click', function(e) {
			e.preventDefault();
			$('html, body').animate({scrollTop: 0}, 200);
		});
		
		// scroll top button show/hide
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('.scroll_top').fadeIn(500);
			} else {
				$('.scroll_top').fadeOut('slow');
			}
		});
	});
	
	// submit check
	function sessionChk() {
		if (${empty id}) {
			alert("로그인이 필요합니다.");
			location.href="/semojeon/views/member/loginForm.na";
			return false;
		}
	}
	// 전시 삭제 confirm
	function del() {
		var con = confirm("전시를 정말 삭제하시겠습니까?");
		if (con) {
			location.href="dpDelete.do?dno=${display.dno }";
		}
	}
	
	// 전시 예매 session check
	function reserveChk() {
		if (${empty id}) {
			alert("로그인이 필요합니다.");
			location.href="/semojeon/views/member/loginForm.na";
			return false;
		} else {
			location.href="reserveForm.do?dno=${display.dno}";
			return true;
		}
	}
</script>
</head>
<body>
	<div class="container_middle display_view_container">
		<!-- 상단 정보 -->
		<div class="display_view_top">
			<img src="../../upload/${display.poster }" alt="포스터">
			<div class="text_area">
				<!-- 평균 별점 -->
				<div class="star_avg">★★★★★︎ &nbsp;<span class="text">${star_rate }</span>︎</div>
				<h3 class="dname">${display.dname }</h3>
				<pre class="intro">${display.intro }</pre>
				<table class="bottom">
					<tr>
						<th>장소</th>
						<td>${display.loc }</td>
					</tr>
					<tr>
						<th>기간</th>
						<td>${display.start_date } ~ ${display.end_date }</td>
					</tr>
					<tr>
						<th>관람 가능 시간</th>
						<td>${display.hours }</td>
					</tr>
					<tr>
						<th style="vertical-align: top;">가격</th>
						<td>
							<c:if test="${display.fee != 0 }">
								<span>${display.fee }원</span><br>
							</c:if>
							<c:if test="${display.fee_adult != 0 }">
								성인 : <span>${display.fee_adult }원</span><br>
							</c:if>
							<c:if test="${display.fee_teen != 0 }">
								청소년 : <span>${display.fee_teen }원</span><br>
							</c:if>
							<c:if test="${display.fee_child != 0 }">
								어린이 : <span>${display.fee_child }원</span><br>
							</c:if>
						</td>
					</tr>
				</table>
					<button class="btn" onclick="reserveChk()">예매하기</button>
			</div>
		</div>
		<!-- 상세 내용, 이미지 -->
		<div class="display_view_middle">
			<h4 class="sub_title">상세 내용</h4>
			<c:if test="${not empty display.detail_txt }">
				<p class="detail_txt">${display.detail_txt }</p>
			</c:if>
			<img alt="전시 상세" src="../../upload/${display.detail_img }">
		</div>
		<!-- 하단 내용, 리뷰, 리뷰 등록 -->
		<div class="display_view_bottom">
			<c:if test="${not empty display.artist }">
				<h4 class="sub_title">작가명</h4>
				<p class="detail_txt">${display.artist }</p>
			</c:if>
			<c:if test="${not empty display.tag }">
				<h4 class="sub_title">관련 태그</h4>
				<p class="detail_txt">${display.tag }</p>
			</c:if>
			<c:if test="${not empty display.tel }">
				<h4 class="sub_title">전화번호</h4>
				<p class="detail_txt">${display.tel }</p>
			</c:if>
			<c:if test="${not empty display.home_pg }">
				<h4 class="sub_title">홈페이지</h4>
				<p class="detail_txt">${display.home_pg }</p>
			</c:if>
			<h4 class="sub_title">입장방식 안내</h4>
			<p class="detail_txt">현장에서 별도 티켓으로 교환 후 입장</p>
			
			<!-- 전시 수정, 삭제 버튼 -->
			<c:if test="${mno == display.mno }">
				<div class="container_bottom_right">
					<a href="dpUpdateForm.do?dno=${display.dno }" class="btn btn_stroke btn_small">수정</a>
					<a onclick="del()" class="btn btn_stroke btn_small">삭제</a>
				</div>
			</c:if>
			
			<!-- 리뷰 리스트 : start -->
			<h4 class="sub_title pd_bottom">리뷰 <span>${reviewCnt }</span></h4>
			<!-- 평균 별점 -->
			<div class="star_avg">★★★★★ &nbsp;<span class="text">${star_rate }</span>︎︎</div>
			<ul class="review_list_box">
				<c:forEach var="review" items="${list }">
					<li>
						<div class="profile">
							<img src="/semojeon/uploads/${review.profile }" alt="프로필">
							<p class="nick_nm">${review.nick_nm }</p>
						</div>
						<p class="detail_txt review">
							${review.content }
						</p>
						<div class="like_box">
							<img alt="좋아요" src="../../images/icons/like.png">
							<p class="count">${review.likes }</p>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!-- 리뷰 리스트 : end -->
			
			<!-- paging -->
			<div class="paging">
				<button class="prev">
					<img alt="이전" src="../../images/icons/arrow_left1.png">
				</button>
				<div class="number">
					<span class="page_num">1</span> / <span>6</span>
				</div>
				<button class="next">
					<img alt="이전" src="../../images/icons/arrow_right.png">
				</button>
			</div>
			
			<!-- 리뷰 등록 -->
			<form action="dpReviewWrite.do?dno=${display.dno }" method="post" onsubmit="return sessionChk()">
				<h4 class="sub_title">리뷰와 별점 등록</h4>
				<textarea name="content" placeholder="전시가 어떠셨나요? 감상평을 작성해주세요." required></textarea>
				<p class="detail_txt pd_bottom">별점을 선택해주세요.</p>
				<!-- 별점 등록 -->
				<div class="star_avg rate">
					<input type="range" name="star_rate" min="0" max="10" step="1" value="0" required>
					<span class="text" id="input_span">0</span>
				</div>
				<div class="submit_box">
					<input type="submit" class="btn" value="등록하기">
				</div>
			</form>
		</div>
	</div>
	<div class="scroll_top"><div class="arrow"></div></div>
</body>
</html>