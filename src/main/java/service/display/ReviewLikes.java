package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;
import service.CommandProcess;

public class ReviewLikes implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		int rv_no = Integer.parseInt(request.getParameter("rv_no"));
		
		ReviewDao rd = ReviewDao.getInstance();
		//Review review = rd.
		
		return "reviewLikes";
	}

}
