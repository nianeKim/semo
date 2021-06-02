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
.btnArea {
	width: 100%;
	text-align: center;
	margin-top: 30px;
}
.btnArea input, .btnArea p {
    display: inline-block;
    vertical-align: middle;
    width: 60px;
    height: 32px;
    font-size: 14px;
    padding: 6px 0; 
    border: 1px solid #000;
    margin: 0;
    background: none;
    cursor: pointer;
}
.btnArea input:hover, .btnArea p:hover {
	color: var(--point-color);
	border: 1px solid var(--point-color);;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			height : 400, // 에디터 높이
			minHeight : null, // 최소 높이
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
			
			<form action="boardWriteResult.wo">
				<input type="text" name="title" placeholder="제목">
				<textarea id="summernote" name="content"></textarea>
				
				<div class="btnArea">
					<input type="submit" value="글작성">
					<p onclick="location.href='boardMain.wo'">목록</p>
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>