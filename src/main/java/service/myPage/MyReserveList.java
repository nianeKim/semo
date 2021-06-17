package service.myPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ReservationDao;
import model.Member;
import model.Reservation;
import service.CommandProcess;

public class MyReserveList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno"); // session mno
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mno);
		
		ReservationDao rd = ReservationDao.getInstance();
		List<Reservation> list = rd.mpList(mno);
		
		request.setAttribute("member", member);
		request.setAttribute("list", list);
		
		return "myReserveList";
	}

}
