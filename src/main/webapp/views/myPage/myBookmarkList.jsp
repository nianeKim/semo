<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="/views/sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/myPage/dpList.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#myBookmarkList .dot").css("display", "block");
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
	});
</script>
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		<!-- 내용 -->
		<div class="content">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">북마크한 전시가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<h3>북마크한 전시 ${total}</h3>
				<ul>
					<c:forEach var="bookmark" items="${list}">
						<li>
							<a href="../display/dpView.do?dno=${bookmark.dno}">
								<img alt="포스터" src="/semojeon/upload/${bookmark.poster}"> 
							</a>
							<div class="txt_area">
								<a href="../display/dpView.do?dno=${bookmark.dno}" class="cursor">
									<span class="txt_title">${bookmark.dname}</span>
									<span class="txt"><span>장소</span> ${bookmark.spot}</span>
									<span class="txt"><span>기간</span> ${bookmark.start_date}~ ${bookmark.end_date}</span>
									<span class="txt"><span>관람 가능 시간</span><br>${bookmark.hours}</span>
									<span class="txt"><span>가격</span> ${bookmark.fee}</span>
								</a>
								<!-- pre 태그 안에 있는 css 요소 삭제 -->
								<script type="text/javascript">
									$(".txt_pre").find("*").css({
										"font-family" : "inherit",
										"color" : "#000"
									});
								</script>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myBookmarkList.wo?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myBookmarkList.wo?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myBookmarkList.wo?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myBookmarkList.wo?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myBookmarkList.wo?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>