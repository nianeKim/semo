<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
 h3{
 	margin-top: 28px;
    margin-bottom: 10px;
 
 }
.topView{
	overflow: hidden;
	width:100%;
	height: 146px;
	margin-bottom: 56px;
	border-bottom: solid 1px #e6e6e6;
}

.mp-profile{
	float:left;
	width: 40%;
}

.mp-menu{
	float:left;
	width: 60%;

}
.profile{
	float:left;
	margin-right: 20px;
}

.profile-right{
	float:left;
	text-align: center;
	width: 100px;
}

.profileImg{
	width:136px;
	height:136px;
 	border-radius: 70px;
 	margin-right: 20px;
}

.update-btn{
	color: #666666;
	font-size: 13px;
	text-decoration: underline;
}

.icons{
	width: 35px;
	height: 35px;
}

.mp-menu ul{
	list-style:none;

}

.mp-menu li{
	float:left;
	margin-right: 50px;

}


</style>
</head>
<body>
<div class="container_middle">

	<!-- 페이지 상단 -->
	<div class="topView">
	
		<!-- 프로필 영역 -->
		<div class="mp-profile">
			<div class="profile">
				<img class="profileImg" alt="프로필사진" src="/semojeon/upload/${member.profile }" >
			</div>
			<div class="profile-right">
				<h3>${member.nick_nm}님,<br>안녕하세요</h3>
				<p><a class="update-btn" href="../member/updateForm.na" >내 정보 수정</a></p>
			</div>
		</div>
		
		<!-- 메뉴 영역 -->
		<div class="mp-menu">
		<ul>
			<li>
				<div>
					<img class="icons" id="bookmark" src="../../images/icons/my_bookmark.png" ><a>북마크</a></div>
			</li>
			<li>
				<div><img class="icons" id="buy_list" src="../../images/icons/buy_list.png" ><a>구매내역</a></div>
			</li>
			<li>
				<div><img class="icons" id="regist_display" src="../../images/icons/regist_display.png" ><a>등록한 전시</a></div>
			</li>
			<li>
				<div><img class="icons" id="written_story" src="../../images/icons/written_story.png" ><a>작성한 스토리</a></div>
			</li>	
		</ul>
		</div>
	</div>
	
	
	<!-- 페이지 하단 -->
	<div class="bottomView">
	구매내역
	</div>
</div>
</body>
</html>