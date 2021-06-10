<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="../../css/myPage/bdList.css">
<h3>작성한 스토리</h3>
<div class="tbl">
	<div class="tbl-row">
		<c:forEach var="board" items="${list}">
			<div class="tbl-cell">
				<img class="thumbnail" alt="썸네일" src="/semojeon/upload/${board.thumbnail}">
				<div class="txt_area">
					<p class="txt_small">${board.reg_date } | ${board.read_cnt } 읽음</p>
					<h5 class="txt_title">${board.title}</h5>
					<pre class="con">${board.content}</pre>
					<div class="text_bottom">
						<img alt="하트" src="../../images/icons/heart.png"> <span>${board.likes}</span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>