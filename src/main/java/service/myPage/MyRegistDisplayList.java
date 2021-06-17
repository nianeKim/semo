package service.myPage;

import service.CommandProcess;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DisplayDao;
import dao.MemberDao;
import model.Display;
import model.Member;

public class MyRegistDisplayList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno"); // session mno

		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mno);
		
		DisplayDao bd = DisplayDao.getInstance();
		List<Display> list = bd.mpList(mno);

		request.setAttribute("member", member);
		request.setAttribute("list", list);

		return "myRegistDisplayList";
	}
}
