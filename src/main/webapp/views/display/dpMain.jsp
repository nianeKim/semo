<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/display/dpMain.css");</style>
<script type="text/javascript">
	$(function() {
		//tab active : page가 로드됐을때 바로 실행
		$('.display_tab li').removeClass("active");
		$('#tab'+${tab}).addClass("active");
		
		// 페이징 현재페이지 설정
		$('#page'+${currentPage}).css({
			"color" : "var(--point-color)",
			"font-weight" : "600"
		});
		
		// filter modal open
		$('.filter').on('click', function() {
			$('.filter_modal').show();
			$('html body').css('overflow', 'hidden');
		})

		// filter modal close
		$('.close, .dim_box, .btn').on('click', function() {
			$('.filter_modal').hide();
			$('html body').css('overflow', 'auto');
		})

		// tag active : loc
		$('input[name="loc"]').on('change', function() {
			if ($(this).is(":checked")) {
				$(this).siblings("label").addClass('active');
			} else {
				$(this).siblings("label").removeClass('active');
			}
		})

		// tag active : tag
		$('input[name="tag"]').on('change', function() {
			if ($(this).is(":checked")) {
				$(this).siblings("label").addClass('active');
			} else {
				$(this).siblings("label").removeClass('active');
			}
		})
	})
	
	// 세션 확인
   function sessionChk() {
      if (${empty id}) {
         var con = confirm("로그인 후 이용해 주시기 바랍니다.");
         if (con) {
            location.href='dpRegistForm.do';
         }
      } else {
         location.href='dpRegistForm.do';
      }
   }
</script>
</head>
<body>
	<div class="container_wide">
		<section class="display_main">
			<ul class="display_tab">
				<li class="title" id="tab1" onclick="location.href='dpMain.do?tab=1'">전시중</li>
				<li class="title" id="tab2" onclick="location.href='dpMain.do?tab=2'">종료 예정</li>
				<li class="title" id="tab3" onclick="location.href='dpMain.do?tab=3'">예정 전시</li>
			</ul>

			<div class="button_box">
				<!-- 필터 -->
				<a class="filter"> <img alt="필터" src="../../images/icons/filter.png"> <span>필터</span>
				</a>
				<!-- 전시 등록 버튼 -->
				<div class="confirm_btn">
					<button class="btn btn_stroke" onclick="sessionChk()">전시 등록하기</button>
				</div>
			</div>

			<!-- display list -->
			<div class="display_list">
				<ul>
					<!-- 전체 전시중 -->
					<c:if test="${tab == 1 }">
						<c:if test="${empty listLoc && empty listTag }">
							<c:forEach var="display" items="${list }">
								<c:if test="${display.start_date <= today && display.end_date >= today }">
									<li>
										<a href="dpView.do?dno=${display.dno }">
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 지역별 조회 -->
						<c:if test="${not empty listLoc && empty listTag }">
							<c:forEach var="display" items="${listLoc }">
								<c:if test="${display.start_date <= today && display.end_date >= today }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 태그별 조회 -->
						<c:if test="${empty listLoc && not empty listTag }">
							<c:forEach var="display" items="${listTag }">
								<c:if test="${display.start_date <= today && display.end_date >= today }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 태그, 지역 둘다 조회 -->
						<c:if test="${not empty listLoc && not empty listTag }">
							<c:forEach var="display" items="${listJoin }">
								<c:if test="${display.start_date <= today && display.end_date >= today }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
					</c:if>
					
					<!-- 종료 예정 -->
					<c:if test="${tab == 2 }">
						<c:if test="${empty listLoc && empty listTag }">
							<c:forEach var="display" items="${list }">
								<c:if test="${display.end_date >= today && display.end_date <= todayAfter7 }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 지역별 조회 -->
						<c:if test="${not empty listLoc && empty listTag }">
							<c:forEach var="display" items="${listLoc }">
								<c:if test="${display.end_date >= today && display.end_date <= todayAfter7 }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 태그별 조회 -->
						<c:if test="${empty listLoc && not empty listTag }">
							<c:forEach var="display" items="${listTag }">
								<c:if test="${display.end_date >= today && display.end_date <= todayAfter7 }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 태그, 지역 둘다 조회 -->
						<c:if test="${not empty listLoc && not empty listTag }">
							<c:forEach var="display" items="${listJoin }">
								<c:if test="${display.end_date >= today && display.end_date <= todayAfter7 }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
					</c:if>
					
					<!-- 예정 전시 -->
					<c:if test="${tab == 3 }">
						<c:if test="${empty listLoc && empty listTag }">
							<c:forEach var="display" items="${list }">
								<c:if test="${display.start_date > today }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 지역별 조회 -->
						<c:if test="${not empty listLoc && empty listTag }">
							<c:forEach var="display" items="${listLoc }">
								<c:if test="${display.start_date > today }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 태그별 조회 -->
						<c:if test="${empty listLoc && not empty listTag }">
							<c:forEach var="display" items="${listTag }">
								<c:if test="${display.start_date > today }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
						<!-- 태그, 지역 둘다 조회 -->
						<c:if test="${not empty listLoc && not empty listTag }">
							<c:forEach var="display" items="${listJoin }">
								<c:if test="${display.start_date > today }">
									<li>
										<a href="dpView.do?dno=${display.dno }"> 
											<img style="background: url(/semojeon/upload/${display.poster }) no-repeat center; background-size: cover;">
											<div class="text_area">
												<p class="date">${display.start_date } ~ ${display.end_date }</p>
												<p class="dp_list_title">${display.dname }</p>
												<p class="location">${display.spot }</p>
											</div>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
					</c:if>
				</ul>
			</div>

			<!-- paging -->
			<div class="paging">
				<div class="items">
					<div class="prev_btn">
						<c:if test="${startPage > PAGE_PER_BLOCK}">
							<button class="first" onclick="location.href='dpMain.do?tab=${tab }&pageNum=${startPage - 1}'">
								<img alt="이전" src="../../images/icons/arrow_left1.png">
								<img alt="이전" src="../../images/icons/arrow_left1.png">
							</button> 
						</c:if>
						<c:if test="${pageNum > 1}">
							<button class="prev" onclick="location.href='dpMain.do?tab=${tab }&pageNum=${currentPage - 1}'">
								<img alt="이전" src="../../images/icons/arrow_left1.png">
							</button>
						</c:if>
					</div>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<span id="page${i}" class="page_num" onclick="location.href='dpMain.do?tab=${tab }&pageNum=${i}'">${i}</span>
					</c:forEach>
					<div class="next_btn">
						<c:if test="${currentPage < totalPage}">
							<button class="next" onclick="location.href='dpMain.do?tab=${tab }&pageNum=${currentPage + 1}'">
								<img alt="다음" src="../../images/icons/arrow_right.png">
							</button>
						</c:if>
						<c:if test="${endPage < totalPage}">
							<button class=last onclick="location.href='dpMain.do?tab=${tab }&pageNum=${endPage + 1}'">
								<img alt="다음" src="../../images/icons/arrow_right.png">
								<img alt="다음" src="../../images/icons/arrow_right.png">
							</button> 
						</c:if>
					</div> <!-- next_btn -->
				</div> <!-- number -->
			</div> <!-- paging -->
		</section>
	</div>

	<!-- modal -->
	<form class="filter_modal" action="dpMain.do?tab=${tab }" method="post">
		<div class="dim_box"></div>
		<div class="modal_content">
			<img class="close" src="../../images/icons/close.png"></img>
			<div class="content_inner">
				<!-- left -->
				<div class="block">
					<p class="modal_title">지역</p>
					<div class="tag_box">
						<!-- tag -->
						<div class="label_box">
							<label class="tag" for="l1">서울</label><input
								type="checkbox" name="loc" id="l1" value="서울">
						</div>
						<div class="label_box">
							<label class="tag" for="l2">세종</label><input type="checkbox"
								name="loc" id="l2" value="세종">
						</div>
						<div class="label_box">
							<label class="tag" for="l3">광주</label><input type="checkbox"
								name="loc" id="l3" value="광주">
						</div>
						<div class="label_box">
							<label class="tag" for="l4">대구</label><input type="checkbox"
								name="loc" id="l4" value="대구">
						</div>
						<div class="label_box">
							<label class="tag" for="l5">대전</label><input type="checkbox"
								name="loc" id="l5" value="대전">
						</div>
						<div class="label_box">
							<label class="tag" for="l6">부산</label><input type="checkbox"
								name="loc" id="l6" value="부산">
						</div>
						<div class="label_box">
							<label class="tag" for="l7">울산</label><input type="checkbox"
								name="loc" id="l7" value="울산">
						</div>
						<div class="label_box">
							<label class="tag" for="l8">인천</label><input type="checkbox"
								name="loc" id="l8" value="인천">
						</div>
						<div class="label_box">
							<label class="tag" for="l9">강원</label><input type="checkbox"
								name="loc" id="l9" value="강원">
						</div>
						<div class="label_box">
							<label class="tag" for="l10">경기</label><input type="checkbox"
								name="loc" id="l10" value="경기">
						</div>
						<div class="label_box">
							<label class="tag" for="l11">경북</label><input type="checkbox"
								name="loc" id="l11" value="경북">
						</div>
						<div class="label_box">
							<label class="tag" for="l12">경남</label><input type="checkbox"
								name="loc" id="l12" value="경남">
						</div>
						<div class="label_box">
							<label class="tag" for="l13">전북</label><input type="checkbox"
								name="loc" id="l13" value="전북">
						</div>
						<div class="label_box">
							<label class="tag" for="l14">전남</label><input type="checkbox"
								name="loc" id="l14" value="전남">
						</div>
						<div class="label_box">
							<label class="tag" for="l15">충북</label><input type="checkbox"
								name="loc" id="l15" value="충북">
						</div>
						<div class="label_box">
							<label class="tag" for="l16">충남</label><input type="checkbox"
								name="loc" id="l16" value="충남">
						</div>
						<div class="label_box">
							<label class="tag" for="l17">제주</label><input type="checkbox"
								name="loc" id="l17" value="제주">
						</div>
					</div>
				</div>
				<div class="block">
					<p class="modal_title">태그</p>
					<div class="tag_box">
						<!-- tag -->
						<div class="label_box">
							<label class="tag" for="t1">혼자보기좋은</label><input
								type="checkbox" name="tag" id="t1" value="혼자보기좋은">
						</div>
						<div class="label_box">
							<label class="tag" for="t2">감성</label><input type="checkbox"
								name="tag" id="t2" value="감성">
						</div>
						<div class="label_box">
							<label class="tag" for="t3">미디어</label><input type="checkbox"
								name="tag" id="t3" value="미디어">
						</div>
						<div class="label_box">
							<label class="tag" for="t4">회화</label><input type="checkbox"
								name="tag" id="t4" value="회화">
						</div>
						<div class="label_box">
							<label class="tag" for="t5">사진</label><input type="checkbox"
								name="tag" id="t5" value="사진">
						</div>
						<div class="label_box">
							<label class="tag" for="t6">조각</label><input type="checkbox"
								name="tag" id="t6" value="조각">
						</div>
						<div class="label_box">
							<label class="tag" for="t7">설치미술</label><input type="checkbox"
								name="tag" id="t7" value="설치미술">
						</div>
						<div class="label_box">
							<label class="tag" for="t8">공예</label><input type="checkbox"
								name="tag" id="t8" value="공예">
						</div>
						<div class="label_box">
							<label class="tag" for="t9">디지털</label><input type="checkbox"
								name="tag" id="t9" value="디지털">
						</div>
						<div class="label_box">
							<label class="tag" for="t10">누아르</label><input type="checkbox"
								name="tag" id="t10" value="누아르">
						</div>
						<div class="label_box">
							<label class="tag" for="t11">디자인</label><input type="checkbox"
								name="tag" id="t11" value="디자인">
						</div>
						<div class="label_box">
							<label class="tag" for="t12">예술</label><input type="checkbox"
								name="tag" id="t12" value="예술">
						</div>
						<div class="label_box">
							<label class="tag" for="t13">공연</label><input type="checkbox"
								name="tag" id="t13" value="공연">
						</div>
					</div>
				</div>
			</div>
			<div class="btn_box">
				<input class="btn" type="submit" value="확인">
			</div>
		</div>
	</form>
</body>
</html>