<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/display/dpView.css");</style>
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
		})
	})
</script>
</head>
<body>
	<div class="container_middle">
		<!-- 상단 정보 -->
		<div class="display_view_top">
			<img src="../../upload/${display.poster }" alt="포스터">
			<div class="text_area">
				<!-- 평균 별점 -->
				<div class="star_avg">★★★★★︎ &nbsp;<span class="text">3.4</span>︎</div>
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
								<span>${display.fee }</span><br>
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
					<button class="btn">예매하기</button>
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
			<h4 class="sub_title">입장방식 안내</h4>
			<p class="detail_txt">현장에서 별도 티켓으로 교환 후 입장</p>
			
			<!-- 리뷰 리스트 : start -->
			<h4 class="sub_title pd_bottom">리뷰 <span>264</span></h4>
			<!-- 평균 별점 -->
			<div class="star_avg">★★★★★ &nbsp;<span class="text">3.4</span>︎︎</div>
			<ul class="review_list_box">
				<li>
					<div class="profile">
						<img src="../../images/dummy_2.png" alt="프로필">
						<p class="nick_nm">do5do</p>
					</div>
					<p class="detail_txt review">
						영화와 음악이 함께하는 전시는 뭔가 특이하면서도 익숙했습니다. 도슨트를 들으면 더더 좋다고 들었지만 시간이 맞지 않아 좀 아쉬웠구요. 입장인원도 제한을 두고 해서 쾌적하게 좋은 시간이었습니다.
					</p>
					<div class="like_box">
						<img alt="좋아요" src="../../images/icons/like.png">
						<p class="count">25</p>
					</div>
				</li>
				<li>
					<div class="profile">
						<img src="../../images/dummy_2.png" alt="프로필">
						<p class="nick_nm">do5do</p>
					</div>
					<p class="detail_txt review">
						영화와 음악이 함께하는 전시는 뭔가 특이하면서도 익숙했습니다. 도슨트를 들으면 더더 좋다고 들었지만 시간이 맞지 않아 좀 아쉬웠구요. 입장인원도 제한을 두고 해서 쾌적하게 좋은 시간이었습니다.
					</p>
					<div class="like_box">
						<img alt="좋아요" src="../../images/icons/like.png">
						<p class="count">25</p>
					</div>
				</li>
				<li>
					<div class="profile">
						<img src="../../images/dummy_2.png" alt="프로필">
						<p class="nick_nm">do5do</p>
					</div>
					<p class="detail_txt review">
						영화와 음악이 함께하는 전시는 뭔가 특이하면서도 익숙했습니다. 도슨트를 들으면 더더 좋다고 들었지만 시간이 맞지 않아 좀 아쉬웠구요. 입장인원도 제한을 두고 해서 쾌적하게 좋은 시간이었습니다.
					</p>
					<div class="like_box">
						<img alt="좋아요" src="../../images/icons/like.png">
						<p class="count">25</p>
					</div>
				</li>
				<li>
					<div class="profile">
						<img src="../../images/dummy_2.png" alt="프로필">
						<p class="nick_nm">do5do</p>
					</div>
					<p class="detail_txt review">
						영화와 음악이 함께하는 전시는 뭔가 특이하면서도 익숙했습니다. 도슨트를 들으면 더더 좋다고 들었지만 시간이 맞지 않아 좀 아쉬웠구요. 입장인원도 제한을 두고 해서 쾌적하게 좋은 시간이었습니다.
					</p>
					<div class="like_box">
						<img alt="좋아요" src="../../images/icons/like.png">
						<p class="count">25</p>
					</div>
				</li>
			</ul>
			<!-- 리뷰 리스트 : end -->
			
			<!-- paging -->
			<div class="paging">
				<button class="prev">
					<img alt="이전" src="../../images/icons/arrow_left.png">
				</button>
				<div class="number">
					<span class="page_num">1</span> / <span>6</span>
				</div>
				<button class="next">
					<img alt="이전" src="../../images/icons/arrow_right.png">
				</button>
			</div>
			
			<!-- 리뷰 등록 -->
			<form action="dpReviewWrite.do?dno=${display.dno }" method="post">
				<h4 class="sub_title">리뷰와 별점 등록</h4>
				<textarea name="content" placeholder="전시가 어떠셨나요? 감상평을 작성해주세요." required autofocus></textarea>
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
</body>
</html>