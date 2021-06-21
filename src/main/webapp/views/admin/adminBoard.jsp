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
select {
	border: none;
    width: 80px;
    height: 40px;
    border-bottom: 1px solid #000;
}

input {
	width: 170px;
	height: 40px;
	border: none;
	border-bottom: 1px solid #000;
}
</style>

<script type="text/javascript">
	function del(delBno) {
		var con = confirm("해당 스토리를 삭제 하시겠습니까?");
		if(con) {
			location.href="../board/boardDelete.wo?bno="+delBno;
		}
	}
	
	$(document).ready(function() {
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		}); 
	});
	
	function chk(){
		if(!frm.searchValue.value){
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
</script>
</head>

<body>
<section class="container_wide">
	<div class="top">
		<div class="searchForm">
			<form action="adminFindBoard.na" name="frm" onsubmit="return chk();" >
				<select name="searchKey" class="searchTab">
					<option value="title" >제목</option>
					<option value="nick_nm">작성자</option>
				</select>
				<input type="text" name="searchValue" class="searchTab">
				<input type="submit" value="검색" class="searchTab">
			</form>
		</div>
		<div class="btn_box">
			<a class="btn btn_stroke" href="/semojeon/views/board/boardWriteForm.wo">등록</a>	
		</div>
	</div>	
	<div class="container-table">
		<table>
			<tr>
				<th>글번호</th><th>제목</th><th>게시일자</th><th>조회수</th><th>좋아요 수</th><th>작성자</th><th>삭제여부</th><th>수정</th><th>삭제</th>
			</tr>
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
						<td><a onclick="del(${board.bno})" class="btn btn_small">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>		
		</table>
	</div>
	<!-- paging -->
	<div class="paging nums">
		<div class="items">
			<div class="prev_btn">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<button class="first" onclick="location.href='adminBoard.na?pageNum=${startPage-1}'">
						<img alt="이전" src="../../images/icons/arrow_left1.png">
						<img alt="이전" src="../../images/icons/arrow_left1.png">
					</button> 
				</c:if>
				<c:if test="${pageNum > 1}">
					<button class="prev" onclick="location.href='adminBoard.na?pageNum=${currentPage - 1}'">
						<img alt="이전" src="../../images/icons/arrow_left1.png">
					</button>
				</c:if>
			</div>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<span id="page${i}" class="page_num" onclick="location.href='adminBoard.na?pageNum=${i}'">${i}</span>
			</c:forEach>
			<div class="next_btn">
				<c:if test="${currentPage < totalPage}">
					<button class="next" onclick="location.href='adminBoard.na?pageNum=${currentPage + 1}'">
						<img alt="다음" src="../../images/icons/arrow_right.png">
					</button>
				</c:if>
				<c:if test="${endPage < totalPage}">
					<button class=last onclick="location.href='adminBoard.na?pageNum=${endPage + 1}'">
						<img alt="다음" src="../../images/icons/arrow_right.png">
						<img alt="다음" src="../../images/icons/arrow_right.png">
					</button> 
				</c:if>
			</div> <!-- next_btn -->
		</div> <!-- number -->
	</div> <!-- paging -->
</section>
</body>
</html>