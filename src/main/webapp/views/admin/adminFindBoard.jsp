<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/admin/admins.css">
<style type="text/css">
	.container-table{
		height: 300px;
		overflow-x: auto;
		overflow-y: auto;
		margin: 75px auto 0 auto;	
	}
</style>
<script type="text/javascript">
function del(delBno) {
	var con = confirm("해당 스토리를 삭제 하시겠습니까?");
	if(con){
		location.href="../board/boardDelete.wo?bno"+delBno;
	}
}

</script>

</head>
<body>
<section class="container_wide">
	<div class="container-table">
		<table>
			<tr>
				<th>글번호</th><th>제목</th><th>게시일자</th><th>조회수</th><th>좋아요 수</th><th>작성자</th><th>삭제여부</th><th>수정</th><th>삭제</th>
			</tr>
			<c:if test="${empty list}">
				<tr><td colspan="9">검색된 스토리가 없습니다</td></tr>
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
						<td><a onclick="del(${board.bno})" class="btn btn_small">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>		
		</table>
	</div>
	<div class="backDiv">
		<a href="adminBoard.na" class="btn btn_stroke">이전</a>
	</div>
</section>
</body>
</html>