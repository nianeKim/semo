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
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		// 해당 리뷰에 해당 회원이 있는지 조회
		RvLikesDao rvld = RvLikesDao.getInstance();
		RvLikes rvl = rvld.select(mno, rv_no);
		
		String imgSrc = "";
		
		// 해당 리뷰의 좋아요 초기값 가져오기
		ReviewDao rd = ReviewDao.getInstance();
		int likes = rd.selectLikes(rv_no);
		System.out.println("likes 초기 : "+likes);
		
		if (rvl == null) { // 회원이 없으면 -> 좋아요 함
			rvld.insert(mno, rv_no, dno);
			imgSrc = "../../images/icons/heart-fill.png";
			
			likes += 1; // 좋아요 증가
			System.out.println("likes plus : "+ likes);
			
			
		} else { // 회원이 있으면 -> 좋아요 취소
			rvld.delete(mno, rv_no);
			imgSrc = "../../images/icons/heart.png";
			
			if (likes != 0) {
				likes -= 1; // 좋아요 감소
			} else {				
				likes = 0;
			}
			System.out.println("likes minus : "+ likes);
		}
		
		// 수정된 likes를 update를 해줘야함
		rd.updateLikes(likes, rv_no);
		
		// setting된 값 다시 가져오기
		likes = rd.selectLikes(rv_no);
		System.out.println("likes 최종 : "+likes);
		
		request.setAttribute("likes", likes);
		request.setAttribute("imgSrc", imgSrc);
		
		return "reviewLikes";
	}

}
