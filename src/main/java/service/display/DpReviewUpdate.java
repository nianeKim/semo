package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;
import service.CommandProcess;

public class DpReviewUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		int rv_no = Integer.parseInt(request.getParameter("rv_no"));
		String content = request.getParameter("content");
		
		ReviewDao rd = ReviewDao.getInstance();
		
		// setting
		Review review = new Review();
		review.setRv_no(rv_no);
		review.setContent(content);
		
		int result = rd.update(review);
		
		request.setAttribute("result", result);
		request.setAttribute("dno", dno);
		
		return "dpReviewUpdate";
	}

}
