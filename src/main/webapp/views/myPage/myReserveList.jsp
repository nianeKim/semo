<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="../sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/myPage/dpList.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#myReserveList .dot").css("display", "block");
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
					<li><span class="txt_title">예매한 전시가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<h3>예한 전시 ${total}</h3>
				<ul>
					<c:forEach var="reserve" items="${list}">
						<li>
							<a href="../display/dpView.do?dno=${reserve.dno}">
								<img alt="포스터" src="/semojeon/upload/${reserve.poster}">
							</a>
							<div class="txt_area">
								<a href="../display/dpView.do?dno=${reserve.dno}" class="cursor">
									<span class="txt_title">${reserve.dname}</span>
									<c:if test="${reserve.cnt != 0 }">
										<span class="txt"><span>수량</span> ${reserve.cnt}개</span>
									</c:if>
									<c:if test="${reserve.cnt_adult != 0 }">
										<span class="txt"><span>성인 수량</span> ${reserve.cnt_adult}개</span>
									</c:if>
									<c:if test="${reserve.cnt_teen != 0 }">
										<span class="txt"><span>청소년 수량</span> ${reserve.cnt_teen}개</span>
									</c:if>
									<c:if test="${reserve.cnt_child != 0 }">
										<span class="txt"><span>어린이 수량</span> ${reserve.cnt_child}개</span>
									</c:if>
								</a>
								<div class="txt_bottom">
									<div class="btn_area">
										<a href="../display/reserveDelete.do?dno=${reserve.dno}" class="btn btn_stroke btn_small">예매 취소</a>
									</div>
								</div>
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
						<button class="first" onclick="location.href='myReserveList.wo?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myReserveList.wo?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myReserveList.wo?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myReserveList.wo?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myReserveList.wo?pageNum=${endPage + 1}'">
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