package service.display;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DisplayDao;
import dao.ReviewDao;
import dao.RvLikesDao;
import model.Display;
import model.Review;
import model.RvLikes;
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

		// 평균 별점
		float star_rate = 0;

		// 리뷰가 없을때 제어
		if (list.size() == 0) {
			star_rate = 0;
		} else {
			star_rate = (float) rd.selectStar(dno);
		}

		// 리뷰 갯수
		int reviewCnt = list.size();

		// 회원이 좋아요한 리뷰가 있는지 체크
		RvLikesDao rvld = RvLikesDao.getInstance();
		
		
		request.setAttribute("display", dp);
		request.setAttribute("list", list);
		request.setAttribute("star_rate", star_rate);
		request.setAttribute("reviewCnt", reviewCnt);

		return "dpView";
	}

}
