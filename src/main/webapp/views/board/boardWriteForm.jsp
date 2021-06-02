<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/summernote-lite.css">
<script src="../../js/summernote-lite.js"></script>
<script src="../../js/lang/summernote-ko-KR.js"></script>
<style type="text/css">
.container_inner {
	width: 70%;
	margin: 0 auto;
}

.btn_area {
	width: 100%;
	text-align: center;
	margin-top: 30px;
}

.btn_right {
	vertical-align: top;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			height : 400, // 에디터 높이
			minHeight : 400, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		});
	});
</script>
</head>
<body>
	<div class="container_wide">
		<div class="container_inner">
			<h1 class="title">스토리 작성</h1>

			<form action="boardWriteResult.wo" method="post">
				<input type="text" name="title" placeholder="제목">
				<textarea id="summernote" name="content"></textarea>

				<div class="btn_area">
					<input class="btn btn_small" type="submit" value="글작성">
					<a class="btn btn_stroke btn_small btn_right" href="boardMain.wo">목록</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>