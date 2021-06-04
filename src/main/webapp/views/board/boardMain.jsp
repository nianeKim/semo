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
			<a href="boardWriteForm.wo"
				class="btn btn_stroke btn_small btn_padding"> <img alt="연필"
				src="../../images/icons/write.png">글쓰기
			</a>
		</div>

		<!-- board list -->
		<div class="board_list">
			<ul>
				<c:forEach var="board" items="${list}">
					<li><a href="#"> <img alt="포스터"
							src="../../images/dummy.gif">
							<div class="text_area">
								<p class="bd_text_title">${board.title}</p>
								<pre class="bd_text_content">${board.content}</pre>
								<div class="bd_text_bottom">
									<img alt="하트" src="../../images/icons/heart.png"> <span>${board.likes }</span>
									<img alt="댓글" src="../../images/icons/comment.png"> <span>0</span>
									<div class="bd_text_bottom_right">
										<img alt="댓글" src="../../images/icons/by.svg"> <span>닉네임</span>
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- pre 태그 안의 css 요소 삭제 -->
		<script type="text/javascript">
			$(".bd_text_content").find("*").css({
				"all" : "unset",
				"color" : "#000"
			})
		</script>
		
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