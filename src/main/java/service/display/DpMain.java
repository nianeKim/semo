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
		List<Display> list = dd.list();
		String tab = request.getParameter("tab");
		String loc[] = request.getParameterValues("loc");
		
		// 지역 태그 조회
		List<Display> listLoc = null;
		if (loc != null) {
			listLoc = dd.listLoc(loc);
		}
		
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
		
		return "dpMain";
	}
}
