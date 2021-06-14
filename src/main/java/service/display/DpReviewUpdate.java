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
		String content = request.getParameter("content");
		System.out.println(content);
		
		ReviewDao rd = ReviewDao.getInstance();
		
		// setting
		Review review = new Review();
		review.setContent(content);
		review.setDno(dno);
		
		int result = rd.update(review);
		
		request.setAttribute("result", result);
		request.setAttribute("dno", dno);
		
		return "dpReviewUpdate";
	}

}
