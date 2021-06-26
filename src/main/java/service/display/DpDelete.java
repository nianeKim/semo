package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import service.CommandProcess;

public class DpDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		DisplayDao dd = DisplayDao.getInstance();
		int result = dd.delete(dno);
		
		request.setAttribute("result", result);
		
		return "dpDelete";
	}

}
