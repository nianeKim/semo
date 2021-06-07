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
		DisplayDao dd = DisplayDao.getInstance();
		List<Display> list = dd.list();
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
		// System.out.println(todayAfter7);
		
		request.setAttribute("today", today);
		request.setAttribute("todayAfter7", todayAfter7);
		request.setAttribute("list", list);
		//request.setAttribute("servletPath", request.getServletPath());
		
		return "dpMain";
	}
}
