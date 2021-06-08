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
<c:set var="mno" value='${sessionScope.mno}'></c:set>
<script type="text/javascript">
	// 좋아요 클릭 함수 
	function likesCnt() {
		if (${empty id}) { // 세션 없을 때
				alert("로그인 후 이용해 주시기 바랍니다.");
				location.href = "/semojeon/views/member/loginForm.na";
		} else { // 세션 있을 때
			$.post("bdLikesCnt.wo", "bno=${board.bno}", function(data) {
				$('.likes_cnt').html(data);
			});
		}
	}
	
	function del() {
		var con = confirm("게시글을 삭제 하시겠습니까?");
		if(con) location.href="boardDelete.wo?bno=${board.bno}";
		else alert("삭제가 취소 되었습니다.");
	}
</script>
</head>
<body>
	<div class="container_middle">
		<!-- 상단 내용(썸네일, 타이틀, 닉네임, 날짜) -->
		<div class="container_top">
			<img alt="썸네일" src="../../upload/${board.thumbnail}">
			<p class="blackBox"></p>
			<h2>${board.title }</h2>
			<h5>${nick_nm} | ${board.reg_date }</h5>
		</div>

		<!-- 메인(textarea 내용) -->
		<div class="contents">
			<pre>${board.content }</pre>
		</div>

		<!-- 하단 버튼 -->
		<div class="container_bottom">
			<div class="container_bottom_left">
				<p> <!-- 좋아요 -->
					<img onclick="likesCnt()" alt="하트" src="../../images/icons/heart.png">
					<span class="likes_cnt">${board.likes}</span>
				</p>
				<p> <!-- 댓글 수 -->
					<img alt="댓글" src="../../images/icons/comment.png">
					<span>${reply_cnt}</span>
				</p>
			</div>
			
			<c:if test="${mno == board.mno}">
				<div class="container_bottom_right">
					<a href="boardUpdateForm.wo?bno=${board.bno }" class="btn btn_stroke btn_small">수정</a>
					<a onclick="del()" class="btn btn_stroke btn_small">삭제</a>
				</div>
			</c:if>
		</div>

		<!-- 댓글 -->
		<div class="reply">
			<h4 class="sub_title">댓글 ${reply_cnt}</h4>
			
			<form action="boardReplyWrite.wo" mehotd="post">
				<textarea name="content" required></textarea>
				<div class="submit_box">
					<input type="submit" class="btn" value="등록하기">
				</div>
			</form>
		</div>
		
	</div>
</body>
</html>