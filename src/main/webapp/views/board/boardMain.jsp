<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board/bdMain.css">
<c:set var="id" value='${sessionScope.id}'></c:set>
<script type="text/javascript">
	// 페이지 로드 시 board_list1로 세팅
	window.onload = function() {
		$('#board_list1').css("display", "block");
	}
	// 필터 변경 될 때 함수
	function filterChange() {
		var filter = document.getElementById("filter");
		var value = filter.options[filter.selectedIndex].value;
		$('.board_list').css("display", "none");
		$('#board_list' + value).css("display", "block");
	}
	
	/* // 클릭했을 때 세션 확인
	function sessionChk() {
		if (${empty id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			if (con) {
				location.href = "/semojeon/views/member/loginForm.na";
			}
		} else {
			location.href="boardWriteForm.wo"	
		}
	} */
</script>
</head>
<body>
	<div class="container_wide">
		<h1 class="title">세모들의 이야기</h1>

		<!-- 필터, 글쓰기 버튼 -->
		<div class="button_box">
			<div class="filter">
				<select id="filter" onchange="filterChange()">
					<option value="1">최신순</option>
					<option value="2">조회순</option>
					<option value="3">인기순</option>
				</select>
			</div>

			<a href="boardWriteForm.wo" class="btn btn_stroke btn_small btn_padding">
				<img alt="연필"	src="../../images/icons/write.png">글쓰기
			</a>
		</div>

		<!-- board list 최신순 -->
		<div class="board_list" id="board_list1">
			<ul>
				<c:forEach var="board" items="${list}">
					<li><a href="boardView.wo?bno=${board.bno}"> <span
							class="bd_text">${board.reg_date } | ${board.read_cnt } 읽음</span>
							<img alt="썸네일" src="../../upload/${board.thumbnail}">
							<div class="bd_text_area">
								<p class="bd_text_title">${board.title}</p>
								<pre class="bd_text_content">${board.content}</pre>
								<div class="bd_text_bottom">
									<img alt="하트" src="../../images/icons/heart.png"> <span>${board.likes}</span>
									<img alt="댓글" src="../../images/icons/comment.png"> <span>${board.cnt}</span>
									<div class="bd_text_bottom_right">
										<img alt="닉네임" src="../../images/icons/by.svg"> <span>${board.nick_nm}</span>
									</div>
								</div>
							</div></a></li>
				</c:forEach>
			</ul>
		</div>

		<!-- board list 조회순 -->
		<div class="board_list" id="board_list2">
			<ul>
				<c:forEach var="board" items="${list2}">
					<li><a href="boardView.wo?bno=${board.bno}"> <span
							class="bd_text">${board.reg_date } | ${board.read_cnt } 읽음</span>
							<img alt="포스터" src="../../upload/${board.thumbnail}">
							<div class="bd_text_area">
								<p class="bd_text_title">${board.title}</p>
								<pre class="bd_text_content">${board.content}</pre>
								<div class="bd_text_bottom">
									<img alt="하트" src="../../images/icons/heart.png"> <span>${board.likes}</span>
									<img alt="댓글" src="../../images/icons/comment.png"> <span>${board.cnt}</span>
									<div class="bd_text_bottom_right">
										<img alt="닉네임" src="../../images/icons/by.svg"> <span>${board.nick_nm}</span>
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>

		<!-- board list 인기순 -->
		<div class="board_list" id="board_list3">
			<ul>
				<c:forEach var="board" items="${list3}">
					<li><a href="boardView.wo?bno=${board.bno}"> <span
							class="bd_text">${board.reg_date } | ${board.read_cnt } 읽음</span>
							<img alt="포스터" src="../../upload/${board.thumbnail}">
							<div class="bd_text_area">
								<p class="bd_text_title">${board.title}</p>
								<pre class="bd_text_content">${board.content}</pre>
								<div class="bd_text_bottom">
									<img alt="하트" src="../../images/icons/heart.png"> <span>${board.likes}</span>
									<img alt="댓글" src="../../images/icons/comment.png"> <span>${board.cnt}</span>
									<div class="bd_text_bottom_right">
										<img alt="닉네임" src="../../images/icons/by.svg"> <span>${board.nick_nm}</span>
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>

		<!-- pre 태그 안에 있는 css 요소 삭제 -->
		<script type="text/javascript">
			$(".bd_text_content").find("*").css({
				"all" : "unset",
				"color" : "#000"
			})
		</script>

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
	</div>
</body>
</html>