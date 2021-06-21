<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../sessionChk.jsp" %>
<link rel="stylesheet" type="text/css" href="../../css/myPage/myCommon.css">
<script type="text/javascript">
	function showCon(id) {
		location.href = id + ".wo";
	}
</script>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul>
		<!-- 프로필 영역 -->
		<li><img alt="프로필사진" src="/semojeon/upload/${member.profile}"></li>
		<li class="profile_txt">
			<h2>${member.nick_nm}님,<br>안녕하세요.</h2>
			<a href="../member/updateForm.na?mno=${member.mno}">
				<img alt="연필" src="../../images/icons/write-gray.png">
				<span>내 정보 수정</span>
			</a>
		</li>
		<!-- 메뉴 영역 -->
		<li class="category">
			<ul>
				<li id="myBookmarkList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../images/icons/my_bookmark.png">북마크 <span class="point-color">${bmTotal}</span>
				</li>
				<li id="myReserveList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../images/icons/buy_list.png">예매내역
				</li>
				<li id="myRegistDisplayList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../images/icons/regist_display.png">등록한 전시
				</li>
				<li id="myBoardList" onclick="showCon(this.id)">
					<span class="dot"></span><img src="../../images/icons/written_story.png">작성한 스토리
				</li>
			</ul>
		</li>
	</ul>
</div>