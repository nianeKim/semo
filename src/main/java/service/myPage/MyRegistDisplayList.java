package service.myPage;

import service.CommandProcess;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DisplayDao;
import model.Display;

public class MyRegistDisplayList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno"); // session mno

		DisplayDao bd = DisplayDao.getInstance();
		List<Display> list = bd.mpList(mno);

		request.setAttribute("list", list);

		return "myRegistDisplayList";
	}
}
