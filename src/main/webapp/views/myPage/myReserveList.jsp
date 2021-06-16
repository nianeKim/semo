<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="../../css/myPage/dpList.css">
<c:if test="${list.size() == 0}">
	<ul class="noItems">
		<li><span class="txt_title">예매한 전시가 없습니다.</span></li>
	</ul>
</c:if>
<c:if test="${list.size() != 0}">
	<h3>등록한 전시</h3>
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