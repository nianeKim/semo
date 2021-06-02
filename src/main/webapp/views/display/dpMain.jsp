<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("../../css/dpMain.css")
</style>
<script src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(function () {
		// tab active
		$('.display_tab li').on('click', function() {
			if (!$(this).hasClass('active')) {
				$('.display_tab li').removeClass('active');
				$(this).addClass('active');
			}
		})
		
		// filter modal open
		$('.filter').on('click', function() {
			$('.filter_modal').show();
			$('html body').css('overflow', 'hidden');
		})
		
		// filter modal close
		$('.close, .dim_box, .btn').on('click', function() {
			$('.filter_modal').hide();
			$('himl body').css('overflow', 'auto');
		})
	})
</script>
</head>
<body>
	<div class="container_wide">
		<section class="display_main">
			<ul class="display_tab">
				<li class="title">
					<a href="#" class="active">전시중</a>
				</li>
				<li class="title">
					<a href="#">종료 예정</a>
				</li>
				<li class="title">
					<a href="#">예정 전시</a>
				</li>
			</ul>
			<div href="#" class="filter">
				<img alt="필터" src="../../images/icons/filter.png">
				<span>필터</span>
			</div>
			
			<!-- display list -->
			<div class="display_list">
				<ul>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img alt="포스터" src="../../images/dummy.gif">
							<div class="text_area">
								<p class="date">05/20(목) ~ 05/23(일)</p>
								<p class="dp_list_title">데이비드 호크니</p>
								<p class="location">대림미술관</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			
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
		</section>
	</div>
	
	<!-- modal -->
	<div class="filter_modal">
		<div class="dim_box"></div>
		<div class="modal_content">
			<img class="close" src="../../images/icons/close.png"></img>
			<div class="content_inner">
				<!-- left -->
				<div class="left">
					<div class="block">
						<p class="modal_title">지역</p>
						<div class="tag_box">
							<span class="tag active">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
						</div>
					</div>
					<div class="block">
						<p class="modal_title">태그</p>
						<div class="tag_box">
							<span class="tag active">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
							<span class="tag">서울</span>
						</div>
					</div>
				</div>
				<!-- right -->
				<div class="right">
					<p class="modal_title">날짜</p>
					<input type="text" placeholder="원하는 날짜를 선택해 주세요."
                    onfocus="(this.type='date')" name="date">
				</div>
			</div>
			<div class="btn_box"><button class="btn">확인</button></div>
		</div>
	</div>
</body>
</html>