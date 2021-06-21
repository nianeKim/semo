package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DisplayDao;
import model.Display;
import service.CommandProcess;

public class DpUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//관리자가 수정하는 경우를 위해 세션체크 추가
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		DisplayDao dd = DisplayDao.getInstance();
		Display dp = dd.select(dno);
		
		request.setAttribute("display", dp);
		request.setAttribute("id", id);
		return "dpUpdateForm";
	}

}
