package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import model.Display;
import service.CommandProcess;

public class Confirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String dname = request.getParameter("dname");
		String msg = "";
		
		DisplayDao dd = DisplayDao.getInstance();
		Display dp = dd.select(dname);
		
		if (dp == null) {
			msg = "등록 가능한 전시입니다.";
		} else if (dp.getDname().equals(dname)) {
			msg = "이미 등록된 전시입니다.";
		}

		request.setAttribute("msg", msg);
		
		return "confirm";
	}

}
