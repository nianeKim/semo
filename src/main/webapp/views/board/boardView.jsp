<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board/bdView.css">
<c:set var="id" value='${sessionScope.id}'></c:set>
<script type="text/javascript">
	/* 	window.onload = function() {
	 var url = "boardView.wo";
	 history.pushState(null, null, url);
	 } */
	 function likesCnt() {
		if (${empty id}) {
				alert("로그인 후 이용해 주시기 바랍니다.");
				location.href = "/semojeon/views/login/loginForm.na";
		} else {
			$.post("bdLikesCnt.wo", "bno=${board.bno}", function(data) {
				$('.likes_cnt').html(data);
			});
		}
	}
</script>
</head>
<body>
	<div class="container_middle">
		<div class="container_top">
			<img alt="썸네일" src="../../upload/${board.thumbnail}">
			<p class="blackBox"></p>
			<h2>${board.title }</h2>
			<h5>${nick_nm}| ${board.reg_date }</h5>
		</div>

		<div class="contents">
			<pre>${board.content }</pre>
		</div>

		<div class="container_bottom">
			<p>
				<img onclick="likesCnt()" alt="하트"
					src="../../images/icons/heart.png"> <a class="likes_cnt"
					href="bdLikesView.wo?bno=${bno}">${board.likes}</a>
			</p>
			<p>
				<img alt="댓글" src="../../images/icons/comment.png"> <a
					href="bdReplyView.wo?bno=${bno}">${reply_cnt}</a>
			</p>
		</div>

		<div class="reply"></div>
	</div>
</body>
</html>