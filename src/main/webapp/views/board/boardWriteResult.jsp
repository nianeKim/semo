<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			if (${action == 'insert' || action == 'save_delete'}) { // 글작성 + 임시저장 삭제
				location.href = "boardMain.wo?pageNum=1";
			} else { // 임시저장
				alert("저장되었습니다");
				location.href = "boardWriteForm.wo?action=insert";
			}
		</script>
	</c:if>
	
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			history.back();
		</script>
	</c:if>
</body>
</html>