<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="../../css/myPage/dpList.css">
<c:if test="${list.size() == 0}">
	<ul class="noItems">
		<li><span class="txt_title">등록한 전시가 없습니다.</span></li>
	</ul>
</c:if>
<c:if test="${list.size() != 0}">
	<h3>등록한 전시</h3>
	<ul>
		<c:forEach var="display" items="${list}">
			<li>
				<a href="../display/dpView.do?dno=${display.dno}">
					<img alt="포스터" src="/semojeon/upload/${display.poster}"> 
				</a>
				<div class="txt_area">
					<a href="../display/dpView.do?dno=${display.dno}" class="cursor">
						<span class="txt_title">${display.dname}</span>
						<span class="txt"><span>장소</span> ${display.spot}</span>
						<span class="txt"><span>기간</span> ${display.start_date}~ ${display.end_date}</span>
						<span class="txt"><span>관람 가능 시간</span><br>${display.hours}</span>
						<span class="txt"><span>가격</span> ${display.fee}</span>
					</a>
					<!-- pre 태그 안에 있는 css 요소 삭제 -->
					<script type="text/javascript">
						$(".txt_pre").find("*").css({
							"font-family" : "inherit",
							"color" : "#000"
						});
						//게시글 삭제
						function del() {
							var con = confirm("삭제 하시겠습니까?");
							if(con) {
								location.href="../display/dpDelete.do?dno=${display.dno}";
							}
						}
					</script>
					<div class="txt_bottom">
						<div class="btn_area">
							<a href="../display/dpUpdateForm.do?dno=${display.dno}"	class="btn btn_stroke btn_small">수정</a>
							<a onclick="del()" class="btn btn_stroke btn_small">삭제</a>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</c:if>

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