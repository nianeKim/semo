<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="../../css/myPage/dpList.css">
<h3>등록한 전시</h3>
<ul>
	<c:forEach var="display" items="${list}">
		<li>
			<a href="../board/dpView.wo?dno=${display.dno}">
				<img alt="포스터"	src="/semojeon/upload/${display.poster}">
			</a>
			<div class="txt_area">
				<a class="cursor">
					<span class="txt_title">${display.dname}</span>
					<span class="txt_pre">${display.intro}</span>
				</a>
				<p class="txt"><span>장소</span>${display.loc}</p>
				<p class="txt"><span>기간</span>${display.start_date}~ ${display.end_date}</p>
				<p class="txt"><span>관람 가능 시간</span>${display.hours}</p>
				<p class="txt"><span>가격</span>${display.fee}</p>
				<!-- pre 태그 안에 있는 css 요소 삭제 -->
				<script type="text/javascript">
					$(".txt_pre").find("*").css({
						"font-family" : "inherit",
						"color" : "#000"
					});
				</script>
				<div class="txt_bottom">
					<img alt="하트" src="../../images/icons/heart.png"> <span>${board.likes}</span>
					<div class="btn_area">
						<a href="../board/boardUpdateForm.wo?bno=${board.bno}"
							class="btn btn_stroke btn_small">수정</a> <a onclick="delBoard()"
							class="btn btn_stroke btn_small">삭제</a>
					</div>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>

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