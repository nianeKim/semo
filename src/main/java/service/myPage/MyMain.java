package service.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class MyMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno"); // session mno
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mno);
	
		BookmarkDao bmd = BookmarkDao.getInstance();
		int bmTotal = bmd.getTotalMy(mno); // 총 게시글 수
		
		request.setAttribute("member", member);
		request.setAttribute("bmTotal", bmTotal);
		
		return "myMain";
		
	}
}
