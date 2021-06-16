package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;
import dao.RvLikesDao;
import model.Review;
import model.RvLikes;
import service.CommandProcess;

public class ReviewLikes implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// login한 회원 번호 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		int rv_no = Integer.parseInt(request.getParameter("rv_no"));
		
		// 해당 리뷰에 해당 회원이 있는지 조회
		RvLikesDao rvld = RvLikesDao.getInstance();
		RvLikes rvlikes = rvld.select(mno, rv_no);
		
		String imgSrc = "";
		
		ReviewDao rd = ReviewDao.getInstance();
		
		if (rvlikes == null) { // 회원이 없으면 -> 좋아요 함
			rvld.insert(mno, rv_no);
			rd.likesPlus(rv_no);
			imgSrc = "../../images/icons/heart-fill.png";
		} else { // 회원이 있으면 -> 좋아요 취소
			rvld.delete(mno, rv_no);
			rd.likesMinus(rv_no);
			imgSrc = "../../images/icons/heart.png";
		}
		
		int likes = rd.selectLikes(rv_no);
		System.out.println("update likes"+ likes);
		
		request.setAttribute("likes", likes);
		request.setAttribute("imgSrc", imgSrc);
		
		return "reviewLikes";
	}

}
