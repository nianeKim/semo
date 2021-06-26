package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import dao.ReservationDao;
import model.Display;
import model.Reservation;
import service.CommandProcess;

public class ReserveResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		int cnt = 0;
		int cnt_adult = 0;
		int cnt_teen = 0;
		int cnt_child = 0;
		
		DisplayDao dd = DisplayDao.getInstance();
		Display display = dd.select(dno);
		
		if (display.getFee() != 0) {
			cnt = Integer.parseInt(request.getParameter("cnt"));
		}
		
		if (display.getFee_adult() != 0) {
			cnt_adult = Integer.parseInt(request.getParameter("cnt_adult"));
		}
		
		if (display.getFee_teen() != 0) {
			cnt_teen = Integer.parseInt(request.getParameter("cnt_teen"));			
		}
		
		if (display.getFee_child() != 0) {
			cnt_child = Integer.parseInt(request.getParameter("cnt_child"));			
		}
		
		// setting
		Reservation reserve = new Reservation();
		reserve.setDno(dno);
		reserve.setMno(mno);
		reserve.setCnt(cnt);
		reserve.setCnt_adult(cnt_adult);
		reserve.setCnt_teen(cnt_teen);
		reserve.setCnt_child(cnt_child);
		
		ReservationDao rv = ReservationDao.getInstance();
		int result = rv.insert(reserve);
		
		request.setAttribute("result", result);
		
		return "reserveResult";
	}

}
