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
	$(document).ready(function () {
		// 로드될 때 댓글 textarea 속성 세팅
		if (${empty id}) {
			$(".reply_insert_frm textarea").attr("placeholder", "댓글을 작성하려면 로그인해 주세요");
			$(".reply_insert_frm textarea").attr("readonly", true);
			$(".likes_cnt").siblings("img").attr("src", "../../images/icons/heart.png");
		} else {
			$(".reply_insert_frm textarea").attr("placeholder", "댓글을 입력해주세요(주제와 무관한 댓글, 악플은 삭제될 수 있습니다)");
			$(".reply_insert_frm textarea").attr("readonly", false);
		}
		
		// 댓글 더보기 버튼 클릭
		var show_more_area = false;
		$(".more_btn").click(function() {
			if (show_more_area == false) {
				$(this).siblings(".more_area").css("display", "block");
				show_more_area = true;
			} else {
				$(this).siblings(".more_area").css("display", "none");
				show_more_area = false;
			}
		});
		
		// 댓글 수정 폼 show
		$(".update_frm_show").click(function() {
			$(this).parents(".replys").children(".reply_update_frm").css("display", "block");
		});
		// 댓글 수정 폼 hide
		$(".update_frm_hide").click(function() {
			show_more_area = false;
			$(this).parents(".replys").find(".more_area").css("display", "none");
			$(this).parents(".replys").children(".reply_update_frm").css("display", "none");
		});
		
		// scroll top
		$('.scroll_top').on('click', function(e) {
			e.preventDefault();
			$('html, body').animate({scrollTop: 0}, 200);
		});
		
		// scroll top button show/hide
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('.scroll_top').fadeIn(500);
			} else {
				$('.scroll_top').fadeOut('slow');
			}
		});
	})

	// 클릭했을 때 세션 확인
	function sessionChk(name) {
		if (${empty id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			if (con) {
				location.href = "/semojeon/views/member/loginForm.na";
			} else {
				return false;
			}
		} else {
			// 좋아요 클릭
			if (name == "like") {
				$.post("bdLikesCnt.wo", "bno=${board.bno}", function(data) {
					var likes = data.split(",")[0];
					var imgSrc = data.split(",")[1];
					$(".likes_cnt").text(likes);
					$(".likes_cnt").siblings("img").attr("src", imgSrc);
				});
			}
		}
	}
	
	// 게시글 삭제
	function delBoard() {
		var con = confirm("삭제 하시겠습니까?");
		if(con) {
			location.href="boardDelete.wo?bno=${board.bno}";
		} else alert("삭제가 취소 되었습니다.");
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
			<!-- pre 태그 안에 있는 css 요소 삭제 -->
			<script type="text/javascript">
				$(".contents").find("*").css({
					"font-family" : "'Apple SD Gothic Neo', 'AppleSDGothicNeo'",
					"line-height" : "1.5em"
				});
				$(".contents").find("img").css("width", "100%");
			</script>
		</div>

		<!-- 하단 버튼 -->
		<div class="container_bottom">
			<div class="container_bottom_left">
				<p> <!-- 좋아요 -->
					<img onclick="sessionChk('like')" alt="하트" src="${imgSrc}">
					<span class="likes_cnt">${board.likes}</span>
				</p>
				<p> <!-- 댓글 수 -->
					<img alt="댓글" src="../../images/icons/comment.png">
					<span>${reply_cnt}</span>
				</p>
			</div>
			
			<c:if test="${mno == board.mno}">
				<div class="container_bottom_right">
					<a href="boardUpdateForm.wo?bno=${board.bno}" class="btn btn_stroke btn_small">수정</a>
					<a onclick="delBoard()" class="btn btn_stroke btn_small">삭제</a>
				</div>
			</c:if>
		</div>

		<!-- 댓글 -->
		<div class="reply">
			<h4 class="sub_title">댓글 ${reply_cnt}</h4>
			
			<!-- 댓글 입력 폼 -->
			<form action="boardReplyWrite.wo?bno=${board.bno}" method="post" onsubmit="return sessionChk()" class="reply_insert_frm">
				<pre><textarea name="content" required onclick="sessionChk()"></textarea></pre>
				<div class="submit_box">
					<input type="submit" class="btn" value="등록하기">
				</div>
			</form>
			
			<!-- 댓글 목록 -->
			<div class="reply_list">
				<c:forEach var="reply" items="${list}">
					<div class="replys">
						<p class="re_top">
							<img alt="프로필" src="/semojeon/upload/${reply.profile}">
							<span>${reply.nick_nm}</span>
							<c:if test="${mno == reply.mno}">
								<span class="updatebtn_area">
									<span class="more_btn">
										<span class="dot"></span>
										<span class="dot"></span>
										<span class="dot"></span>
									</span>
									<span class="more_area">
										<span class="more_area_txt update_frm_show">수정</span>
										<span class="more_area_txt" onclick="delReply()">삭제</span>
										<script type="text/javascript">
											function delReply() {
												var con = confirm("삭제 하시겠습니까?");
												if(con) {
													location.href="boardReplyDelete.wo?bno=${board.bno}&re_no=${reply.re_no}";
												} else alert("삭제가 취소 되었습니다.");
											}
										</script>
									</span>
								</span>
							</c:if>
						</p>
						<pre class="re_con">${reply.content}</pre>
						<p class="re_date">${reply.reg_date}</p>
						<div class="reply_btn_area">
							<p class="replys_btn">답글</p>
							<p class="like_btn">
								<img alt="좋아요" src="../../images/icons/like.png">
								<span>${reply.likes}</span>
							</p>
						</div>
						
						<!-- 수정 폼 -->
						<form action="boardReplyUpdate.wo?bno=${board.bno}&re_no=${reply.re_no}" method="post" class="reply_update_frm">
							<textarea name="content" required onclick="sessionChk()">${reply.content}</textarea>
							<div class="submit_box">
								<input type="submit" class="btn btn_small" value="수정">
								<p class="btn btn_small update_frm_hide" >취소</p>
							</div>
						</form>
					</div>
					
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="scroll_top"><div class="arrow"></div></div>
</body>
</html>