<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="../../css/myPage/bdList.css">
<h3>작성한 스토리</h3>
<ul>
	<c:forEach var="board" items="${list}">
		<li>
			<a href="../board/boardView.wo?bno=${board.bno}">
				<img alt="썸네일"	src="/semojeon/upload/${board.thumbnail}">
			</a>
			<div class="txt_area">
				<p class="txt_small">${board.reg_date } | ${board.read_cnt } 읽음</p>
				<a href="../board/boardView.wo?bno=${board.bno}" class="cursor">
					<span class="txt_title">${board.title}</span>
					<span class="txt_pre">${board.content}</span>
				</a>
	
				<!-- pre 태그 안에 있는 css 요소 삭제 -->
				<script type="text/javascript">
					$(".txt_pre").find("*").css({
						"all" : "unset",
						"color" : "#000"
					});
					$(".txt_pre").find("img").css("display","none");
					// 게시글 삭제
					function delBoard() {
						var con = confirm("삭제 하시겠습니까?");
						if(con) {
							location.href="../board/boardDelete.wo?bno=${board.bno}";
						}
					}
				</script>
				
				<div class="txt_bottom">
					<img alt="하트" src="../../images/icons/heart.png"> <span>${board.likes}</span>
					<div class="btn_area">
						<a href="../board/boardUpdateForm.wo?bno=${board.bno}" class="btn btn_stroke btn_small">수정</a>
						<a onclick="delBoard()" class="btn btn_stroke btn_small">삭제</a>
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