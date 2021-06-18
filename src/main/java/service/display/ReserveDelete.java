package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import service.CommandProcess;

public class ReserveDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		ReservationDao rd = ReservationDao.getInstance();
		int result = rd.delete(dno);
		
		request.setAttribute("result", result);
		
		return "reserveDelete";
	}

}
