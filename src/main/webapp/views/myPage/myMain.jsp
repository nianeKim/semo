<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="/views/sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		<!-- 내용 -->
		<div class="content">
			<%-- <ul>
				<li>
					<h3>북마크</h3>
					<ul>
						<c:forEach items="${bmList}" var="bookmark">
							<li>
								<a href="dpView.do?dno=${bookmark.dno}"> 
									<img alt="포스터" src="/semojeon/upload/${bookmark.poster }">
								</a>
								<div class="text_area">
									<a href="dpView.do?dno=${bookmark.dno}">
										<span class="date">${bookmark.start_date } ~ ${bookmark.end_date }</span>
										<span class="dp_list_title">${bookmark.dname }</span>
										<span class="location">${bookmark.loc }</span>
									</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</li>
				<li>
					<h3>예매내역</h3>
					<ul>
						<c:forEach items="${rsvList}" var="reservation">
							<li>
								<a href="dpView.do?dno=${reservation.dno}"> 
									<img alt="포스터" src="/semojeon/upload/${reservation.poster }">
								</a>
								<div class="text_area">
									<a href="dpView.do?dno=${reservation.dno}">
										<span class="date">${reservation.start_date } ~ ${reservation.end_date }</span>
										<span class="dp_list_title">${reservation.dname }</span>
										<span class="location">${reservation.loc }</span>
									</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</li>
				<li>
					<h3>등록한 전시</h3>
					<c:forEach items="${dpList}" var="display">
						<li>
							<a href="dpView.do?dno=${display.dno}"> 
								<img alt="포스터" src="/semojeon/upload/${display.poster }">
							</a>
							<div class="text_area">
								<a href="dpView.do?dno=${display.dno}">
									<span class="date">${display.start_date } ~ ${display.end_date }</span>
									<span class="dp_list_title">${display.dname }</span>
									<span class="location">${display.loc }</span>
								</a>
							</div>
						</li>
					</c:forEach>
				</li>
				<li>
					<h3>작성한 스토리</h3>
					<c:forEach items="${bdList}" var="board">
						<li>
							<a href="boardView.wo?bno=${board.bno}"> 
								<img alt="포스터" src="/semojeon/upload/${board.thumbnail }">
							</a>
							<div class="text_area">
								<a href="boardView.wo?bno=${board.bno}">
									<span class="date">${board.reg_date } | ${board.read_cnt } 읽음</span>
									<span class="txt_title">${board.title}</span>
									<span class="txt_con">${board.content}</span>
								</a>
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
				</li>
			</ul> --%>
		</div>
	</div>
</body>
</html>