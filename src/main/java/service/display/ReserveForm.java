package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DisplayDao;
import dao.MemberDao;
import model.Display;
import model.Member;
import service.CommandProcess;

public class ReserveForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		DisplayDao dd = DisplayDao.getInstance();
		Display display = dd.select(dno);
		
		// session mno로 회원 정보 조회
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mno);
		
		request.setAttribute("dno", dno);
		request.setAttribute("display", display);
		request.setAttribute("member", member);
		
		return "reserveForm";
	}

}
