<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="../sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/myPage/myMain.css">
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<jsp:include page="myMainMenu.jsp"></jsp:include>
		<!-- 내용 -->
		<div class="content">
			<ul class="content_main">
				<li>
					<h3>북마크</h3>
					<c:if test="${bmList.size() == 0}">
						<p>북마크한 전시가 없습니다.</p>
					</c:if>
					<c:if test="${bmList.size() != 0}">
						<a href="myBookmarkList.wo">+ 자세히</a>
						<table>
							<tr>
								<th>전시명</th>
								<th>장소</th>
							</tr>
							<c:forEach items="${bmList}" var="bookmark">
								<tr>
									<td><a href="/semojeon/views/display/dpView.do?dno=${bookmark.dno}">${bookmark.dname}</a></td>
									<td><a href="/semojeon/views/display/dpView.do?dno=${bookmark.dno}">${bookmark.spot}</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3>예매내역</h3>
					<c:if test="${rsvList.size() == 0}">
						<p>예매한 전시가 없습니다.</p>
					</c:if>
					<c:if test="${rsvList.size() != 0}">
						<a href="myReserveList.wo">+ 자세히</a>
						<table>
							<tr>
								<th>전시명</th>
								<th>수량</th>
							</tr>
							<c:forEach items="${rsvList}" var="reservation">
								<tr>
									<td><a href="/semojeon/views/display/dpView.do?dno=${reservation.dno}">${reservation.dname}</a></td>
									<td><a href="/semojeon/views/display/dpView.do?dno=${reservation.dno}">${reservation.cnt_total}</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				<li>
					<h3>등록한 전시</h3>
					<c:if test="${dpList.size() == 0}">
						<p>등록한 전시가 없습니다.</p>
					</c:if>
					<c:if test="${dpList.size() != 0}">
						<a href="myRegistDisplayList.wo">+ 자세히</a>
						<table>
							<tr>
								<th>전시명</th>
								<th>장소</th>
							</tr>
							<c:forEach items="${dpList}" var="display">
								<tr>
									<td><a href="/semojeon/views/display/dpView.do?dno=${display.dno}">${display.dname}</a></td>
									<td><a href="/semojeon/views/display/dpView.do?dno=${display.dno}">${display.spot}</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3>작성한 스토리</h3>
					<c:if test="${bdList.size() == 0}">
						<p>작성한 스토리가 없습니다.</p>
					</c:if>
					<c:if test="${bdList.size() != 0}">
						<a href="myBoardList.wo">+ 자세히</a>
						<table>
							<tr>
								<th>제목</th>
								<th>작성날짜</th>
							</tr>
							<c:forEach items="${bdList}" var="board">
								<tr>
									<td><a href="/semojeon/views/board/boardView.wo?bno=${board.bno}">${board.title}</a></td>
									<td><a href="/semojeon/views/board/boardView.wo?bno=${board.bno}">${board.reg_date}</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>