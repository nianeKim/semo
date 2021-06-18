<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="/views/sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/myPage/bdList.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#myBoardList .dot").css("display", "block");
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
			<h3>저장한 스토리 ${total_save}</h3>
			<c:if test="${list_save.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">저장한 스토리가 없습니다.</span></li>
				</ul>
			</c:if>
			<c:if test="${list_save.size() != 0}">
				<ul>
					<c:forEach var="save" items="${list_save}">
						${save.thumbnail }
						${save.reg_date }
						${save.title }
						${save.content }
					</c:forEach>
				</ul>
			</c:if>			
			
			<h3>작성한 스토리 ${total}</h3>
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">작성된 스토리가 없습니다.<br>첫 스토리를 올려보세요.</span></li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
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
									function del() {
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
										<a onclick="del()" class="btn btn_stroke btn_small">삭제</a>
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
						<button class="first" onclick="location.href='myBoardList.wo?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myBoardList.wo?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myBoardList.wo?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myBoardList.wo?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myBoardList.wo?pageNum=${endPage + 1}'">
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