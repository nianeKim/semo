package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import model.Reservation;
import service.CommandProcess;

public class ReserveResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		System.out.println("fff");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		System.out.println(cnt);
		int cnt_adult = Integer.parseInt(request.getParameter("cnt_adult"));
		int cnt_teen = Integer.parseInt(request.getParameter("cnt_teen"));
		int cnt_child = Integer.parseInt(request.getParameter("cnt_child"));
		
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
		
		return "reserveResult";
	}

}
