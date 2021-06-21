<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/board/bdWrite.css">
<link rel="stylesheet" href="../../css/summernote-lite.css">
<script src="../../js/summernote-lite.js"></script>
<script src="../../js/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// content 입력 폼
		$('#summernote').summernote({
			height : 400, // 에디터 높이
			minHeight : 400, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		});
		
		// input type file 파일명 변경 설정
		$('#f1').on('change', function() {
			var fileName = $(this).val();
			var realFileName = fileName.split('\\');
			$('.file_label').text(realFileName[2]);
		});
		
		// modal open
		$('.btn_modal').on('click', function() {
			$('.modal').show();
			$('html body').css('overflow', 'hidden');
			$('.top_edit').text('편집');
			$('.check').css('display', 'none');
			$('input[name=bs_no]').siblings("label").removeClass('active');
		});

		// modal close
		$('.close, .dim_box').on('click', function() {
			$('.modal').hide();
			$('html body').css('overflow', 'auto');
		});
		
		// checkbox active
		$('input[name=bs_no]').on('change', function() {
			if ($(this).is(":checked")) {
				$(this).siblings("label").addClass('active');
			} else {
				$(this).siblings("label").removeClass('active');
			}
		});
		
		//checkbox show/hide
		$('.top_edit').on('click', function() {
			if ($('.check').css('display') == 'none') {
				$(this).text('완료');
				$('.check').css('display', 'table-cell');
				$('.top_hide').css('display', 'block');
				$('.content_inner').css({
					'height' : '284px',
					'margin-top' : '6px'
				});
				$('input[name=bs_no]').siblings(".label").removeClass('active');
			} else {
				$(this).text('편집');
				$('.check').css('display', 'none');
				$('.top_hide').css('display', 'none');
				$('.content_inner').css({
					'height' : '285px',
					'margin-top' : '15px'
				});
			}
		});
		
		// checkbox 전체 선택
    	var chk = false;
	    $("#chk_all").click(function(){
	        if(chk == false){
	        	chk = true;
	            $(".label").addClass('active');
	            $("input[name=bs_no]").prop("checked", true);
	        }else if (chk == true){
	        	chk = false;
	            $(".label").removeClass('active');
	            $("input[name=bs_no]").prop("checked", false);
	        }
	    });
	});
	
	// bs_no가 있으면 로드될 때 저장된 데이터 입력
	window.onload = function() {
		if (${not empty bdsave}) {
			$("input[name=title]").val("${bdsave.title}");
			$("#summernote").text("${bdsave.content}");
			if (${not empty bdsave.thumbnail}) {
				$(".file_label").text("${bdsave.thumbnail}");
			}
		}
	}
	
	// 글작성일 때 required 확인
	function insertChk() {
		if ($("input[name=title]").val() == "" || $("input[name=title]").val() == null) {
			alert("제목 입력란을 작성하세요");
			return false;
		} else if ($("input[type=file]").val() == "" || $("input[type=file]").val() == null) {
			alert("썸네일 이미지를 선택하세요");
			return false;
		} else 	if ($(".note-editable").text() == "" || $(".note-editable").text() == null) {
			alert("내용 입력란을 작성하세요");
			return false;
		}
	}
	
	// 임시저장일 때 required 확인
	function saveChk() {
		if ($("input[name=title]").val() == "" || $("input[name=title]").val() == null) {
			alert("제목 입력란을 작성하세요");
			return false;
		}
	}
	
	// 임시저장 삭제하기 전 확인
	function bdSave_del() {
		if ($("input[name=bs_no]:checked").length == 0) {
			alert("선택된 글이 없습니다");
			return false;
		} 
	}
</script>
</head>
<body>
	<div class="container_middle">
		<h1 class="title">스토리 작성</h1>
		
		<form method="post"	enctype="multipart/form-data">
			<!-- 제목 -->
			<input type="text" name="title" placeholder="제목">

			<!-- 상단 버튼 영역 -->
			<div class="column">
				<label for="f1" class="btn_stroke file_label">썸네일 이미지 업로드</label>
				<input type="file" id="f1" name="thumbnail">
				<p class="btn_stroke btn_modal">임시저장 불러오기</p>
			</div>

			<!-- 내용 작성 -->
			<textarea id="summernote" name="content" class="clear"></textarea>
			
			<!-- 처음 저장하는게 아닌 임시저장 일 때 bs_no 넘겨줌 -->			
			<c:if test="${not empty bdsave}">
				<input type="hidden" name="bs_no" value="${bdsave.bs_no}">
			</c:if>
			
			<!-- 하단 버튼 영역 -->
			<div class="btn_area">
			<c:if test="${empty bdsave}"> <!-- boardMain페이지에서 폼 불러올 때 -->
				<button type="submit" class="btn btn_small" onclick="return insertChk()"
					formaction="boardWriteResult.wo?action=insert">글작성</button>
				<button type="submit" class="btn btn_stroke btn_small btn_right"  onclick="return saveChk()"
					formaction="boardWriteResult.wo?action=save_first">임시저장</button>
			</c:if>
			<c:if test="${not empty bdsave}"> <!-- 저장된 데이터 불러올 때 -->
				<button type="submit" class="btn btn_small" onclick="return insertChk()"
					formaction="boardWriteResult.wo?action=save_delete&bs_no=${bdsave.bs_no}">글작성</button>
				<button type="submit" class="btn btn_stroke btn_small btn_right"  onclick="return saveChk()"
					formaction="boardWriteResult.wo?action=save_again&bs_no=${bdsave.bs_no}">임시저장</button>
			</c:if>
				<a class="btn btn_stroke btn_small btn_right" href="boardMain.wo">취소</a>
			</div>
		</form>
	</div>
	
	<!-- 임시저장 목록 모달 -->
	<div class="modal">
		<div class="dim_box"></div>
		<div class=modal_content>
			<img class="close" src="../../images/icons/close.png"></img>
			<c:if test="${list.size() == 0}">
				<p class="no_list">임시저장 한 스토리가 없습니다.</p>
			</c:if>
			<c:if test="${list.size() != 0 }">
				<form method="post">
					<div class="content_top">
						<h2 class="top_title">임시저장 글</h2>
						<div class="top_show">
							<p class="top_cnt">총 <span>${list.size()}</span> 개</p>
							<p class="top_edit">편집</p>
						</div>
						<div class="top_hide">
							<span id="chk_all"><span class="label"></span> 전체선택</span> | 
							<button type="submit" class="del" onclick="return bdSave_del()" formaction="bdSaveDelete.wo">삭제</button>
						</div>
					</div>
					<div class="content_inner">
						<table>
							<c:forEach var="bdSave" items="${list}">
								<tr>
									<td class="check"><div class="label_box">
										<label class="label" for="bs_no${bdSave.bs_no}"></label>
										<input type="checkbox" name="bs_no" id="bs_no${bdSave.bs_no}" value="${bdSave.bs_no}">
									</div></td>
									<td><a href="boardWriteForm.wo?action=save&bs_no=${bdSave.bs_no}">${bdSave.title}</a></td>
									<td><a href="boardWriteForm.wo?action=save&bs_no=${bdSave.bs_no}">${bdSave.reg_date}</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>