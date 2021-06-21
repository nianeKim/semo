<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semojeon/css/searchResult.css">
</head>
<body>
	<div class="container_wide">
		<!-- display -->
		<div class="container_inner">
			<h1 class="title">전시</h1>
			<div class="display_list">
				<c:if test="${dpList.size() == 0}">
					<h4>검색 결과가 없습니다.<br>다른 검색어를 입력하시거나 철자와 띄어쓰기를 확인해보세요.</h4>
				</c:if>
				<c:if test="${dpList.size() != 0}">
					<ul>
						<c:forEach var="display" items="${dpList}">
							<li>
								<a href="/semojeon/views/display/dpView.do?dno=${display.dno }">
									<img style="background: url(/semojeon/upload/${display.poster}) no-repeat center; background-size: cover;">
									<div class="dp_text_area">
										<p class="date">${display.start_date} ~ ${display.end_date}</p>
										<p class="dp_list_title">${display.dname}</p>
										<p class="location">${display.spot}</p>
									</div> <!-- text_area -->
								</a>
							</li>
						</c:forEach>
					</ul>
				</c:if>
			</div> <!-- display_list -->
		</div> <!-- container_inner -->
		
		<!-- board -->
		<div class="container_inner">
			<h1 class="title">세모들의 이야기</h1>
			<div class="board_list" id="board_list1">
				<c:if test="${bdList.size() == 0}">
					<h4>검색 결과가 없습니다.<br>다른 검색어를 입력하시거나 철자와 띄어쓰기를 확인해보세요.</h4>
				</c:if>
				<c:if test="${bdList.size() != 0}">
					<ul>
						<c:forEach var="board" items="${bdList}">
							<li>
								<a href="/semojeon/views/board/boardView.wo?bno=${board.bno}">
									<span class="bd_text">${board.reg_date } | ${board.read_cnt } 읽음</span>
									<img alt="썸네일" src="/semojeon/upload/${board.thumbnail}">
									<div class="bd_text_area">
										<p class="bd_text_title">${board.title}</p>
										<pre class="bd_text_content">${board.content}</pre>
										<div class="bd_text_bottom">
											<img alt="하트" src="/semojeon/images/icons/heart.png"> <span>${board.likes}</span>
											<img alt="댓글" src="/semojeon/images/icons/comment.png"> <span>${board.cnt}</span>
											<div class="bd_text_bottom_right">
												<img alt="닉네임" src="/semojeon/images/icons/by.svg"> <span>${board.nick_nm}</span>
											</div>
										</div> <!-- text_bottom -->
									</div> <!-- text_area -->
								</a>
							</li>
						</c:forEach>
					</ul>
				</c:if>
			</div> <!-- board_list -->
		</div> <!-- container_inner -->
	</div> <!-- container_wide -->
</body>
</html>