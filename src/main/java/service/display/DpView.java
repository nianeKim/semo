package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import dao.ReviewDao;
import model.Display;
import model.Review;
import service.CommandProcess;

public class DpView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		DisplayDao dd = DisplayDao.getInstance();
		Display dp = dd.select(dno);
		
		// 해당 전시 리뷰 리스트 셀렉
		ReviewDao rd = ReviewDao.getInstance();
		List<Review> list = rd.select(dno);
		float star_rate = (float) rd.selectStar(dno);
		
		request.setAttribute("display", dp);
		request.setAttribute("list", list);
		request.setAttribute("star_rate", star_rate);
		
		return "dpView";
	}

}
