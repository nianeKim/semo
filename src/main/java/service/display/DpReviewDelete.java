package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import service.CommandProcess;

public class DpReviewDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.delete(dno, mno);
		
		request.setAttribute("result", result);
		request.setAttribute("dno", dno);
		
		return "dpReviewDelete";
	}

}
