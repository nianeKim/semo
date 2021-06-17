package service.display;

import java.sql.Date;
import java.time.LocalDate;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import model.Display;
import service.CommandProcess;

public class DpMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// dp 리스트 조회
		DisplayDao dd = DisplayDao.getInstance();
		String tab = request.getParameter("tab");
		String loc[] = request.getParameterValues("loc"); // 지역 태그

		// paging : start
		final int ROW_PER_PAGE = 10; // 한 페이지에 10개씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 10페이지

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
		
		// 총 갯수
		int total = dd.getTotalD();

		// 시작번호 : (페이지번호 - 1) * 페이지당 갯수+ 1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 끝번호 : 시작번호 + 페이지당개수 - 1
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		// 페이징 리스트로 기존 리스트 수정
		List<Display> list = dd.list(startRow, endRow);

		// 지역 태그 조회
		List<Display> listLoc = null;
		if (loc != null) {
			listLoc = dd.listLoc(loc, startRow, endRow);
		}
		
		// Math.ceil : 현재 실수보다 큰 정수
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수
		// 시작페이지 : 현재페이지 - (현재페이지 - 1) % 10			
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		// 끝페이지 : 시작페이지 + 블록당페이지 수 -1			
		int endPage = startPage + PAGE_PER_BLOCK -1;
		// 총 페이지보다 큰 endPage는 나올 수 없다.
		if (endPage > totalPage) endPage = totalPage;
		// paging : end

		// 날짜 비교 전달 값 세팅
		Date today = Date.valueOf(LocalDate.now());
		Date todayAfter7 = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();

		// 오늘 날짜를 util date로 변환
		java.util.Date utilDate = today;
		cal.setTime(utilDate);
		// 오늘 날짜 + 7
		cal.add(Calendar.DATE, 7);
		String strTodayAfter7 = sdf.format(cal.getTime());

		// sql date로 변환
		todayAfter7 = Date.valueOf(strTodayAfter7);

		request.setAttribute("today", today);
		request.setAttribute("todayAfter7", todayAfter7);
		request.setAttribute("tab", tab);
		request.setAttribute("list", list);

		request.setAttribute("listLoc", listLoc);
		
		// paging param
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);

		return "dpMain";
	}
}
