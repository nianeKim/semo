<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/summernote-lite.css">
<script src="../../js/summernote-lite.js"></script>
<script src="../../js/lang/summernote-ko-KR.js"></script>
<style type="text/css">
input[name="title"] {
	width: 68%;
	display: inline-block;
}

.column {
	display: inline-block;
	width: 30%;
	float: right;
}

.file_label {
	display: inline-block;
	width: 100%;
	line-height: 43px;
	border: none;
	border: 1px solid var(--point-color);
	outline: 0;
	font-size: 15px;
	text-align: center;
	color: var(--point-color);
	cursor: pointer;
	padding: 2px 12px;
}

input[type="file"] { /* input 사라지게 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
}

.btn_area {
	width: 100%;
	text-align: center;
	margin-top: 30px;
}

.btn_right {
	vertical-align: top;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		// textarea
		$('#summernote').summernote({
			height : 400, // 에디터 높이
			minHeight : 400, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		});
		// input type file 파일명 변경 설정
		$("#f1").on('change', function() {
			var fileName = $(this).val();
			var realFileName = fileName.split("\\");
			$(".file_label").text(realFileName[2]);
		});
	});
</script>
</head>
<body>
	<div class="container_middle">
		<h1 class="title">스토리 작성</h1>
		
		<form method="post" enctype="multipart/form-data">
			<!-- 제목 -->
			<input type="text" name="title" placeholder="제목">

			<!-- 이미지 업로드 버튼 -->
			<div class="column">
				<label for="f1" class="file_label">썸네일 이미지 업로드</label> <input
					type="file" id="f1" name="thumbnail" required="required">
			</div>

			<!-- 내용 작성 -->
			<textarea id="summernote" name="content"></textarea>
			
			<!-- 하단 버튼 영역 -->
			<div class="btn_area">
				
				<button type="submit" class="btn btn_small" formaction="boardWriteResult.wo?action=insert">글작성</button>
				<button type="submit" class="btn btn_small" formaction="boardWriteResult.wo?action=save">임시저장</button>
				<a class="btn btn_stroke btn_small btn_right" href="boardMain.wo">목록</a>
			</div>
		</form>
	</div>
</body>
</html>