<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/bdMain.css">
</head>
<body>
	<div class="container_wide">
		<h1 class="title">세모들의 이야기</h1>
		
		<!-- 글쓰기 버튼 -->
		<div class="write">
			<a href="boardWriteForm.wo" class="btn btn_stroke btn_small btn_padding">
				<img alt="연필" src="../../images/icons/write.png">글쓰기
			</a>
		</div>

		<!-- board list -->
		<div class="board_list">
			<ul>
				<c:forEach var="board" items=${list }>
					<li><a href="#"> <img alt="포스터"
							src="../../images/dummy.gif">
							<div class="text_area">
								<p class="bd_text_title">앤디워홀은 언제나 옳다</p>
								<p class="bd_text_content">달궈진 팬에 고기를 넣어서 볶아줍니다. 센불에서 볶아주면 물도
									안나오고 좋아요! 센불에서 볶다 …</p>
								<div class="bd_text_bottom"></div>
							</div>
					</a></li>
				</c:forEach>
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
	</div>
</body>
</html>