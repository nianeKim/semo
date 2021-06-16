<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("../../css/admin/admins.css");
</style>

<script type="text/javascript">
function del() {
	var con = confirm("해당 스토리를 삭제 하시겠습니까?");
	if(con) {
		location.href="../board/boardDelete.wo?bno=${board.bno}";
	}
}
</script>
</head>

<body>
<div class="container">
	<h1 class="title">스토리</h1>
	<div>
		<a class="btn" href="/semojeon/views/display/dpRegistForm.do">등록</a>	
	</div>
	
	<div class="container container-table">
		<table>
			<tr>
			<th>글번호</th><th>제목</th><th>게시일자</th><th>조회수</th><th>좋아요 수</th><th>작성자</th><th>삭제여부</th><th>수정</th><th>삭제</th>
			<c:if test="${empty list} ">
				<tr><th colspan="7">데이터가 존재하지 않습니다</th></tr>
			</c:if>
				
			<c:if test="${not empty list }">
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${board.bno} </td>
						<td>${board.title} </td>
						<td>${board.reg_date} </td>
						<td>${board.read_cnt} </td>
						<td>${board.likes} </td>
						<td>${board.nick_nm} </td>
						<td>${board.del} </td>
						<td><a href="../board/boardUpdateForm.wo?bno=${board.bno}" class="btn btn_stroke btn_small">수정</a></td>
						<td><a onclick="del()" class="btn btn_small">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>		
		</table>
	</div>
	<div class="nums">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<a onclick="location.href='adminBoard.na?pageNum=${startPage-1}'" class="pageNums" >이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a onclick="location.href='adminBoard.na?pageNum=${i}'" class="pageNums" >${i}　　</a>
		</c:forEach>
		<c:if test="${endPage < totalPage }">
			<a onclick="location.href='adminBoard.na?pageNum=${endPage+1}'" class="pageNums">다음</a>
		</c:if>	
	</div>
</div>
</body>
</html>