package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BdLikesDao;
import dao.BoardDao;
import dao.MemberDao;
import dao.ReplyDao;
import dao.RpLikesDao;
import model.BdLikes;
import model.Board;
import model.Member;
import model.Reply;
import service.CommandProcess;

public class RpLikesCnt implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {	
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");

		// param으로 re_no 가져옴
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		
		// rplikes에 회원이 좋아요한 게시글 있는지 조회
		RpLikesDao rld = RpLikesDao.getInstance();
		int rplikes = rld.select(mno, re_no);
		
		// rpLikesCnt.jsp에 보내줄 변수 생성
		String imgSrc = "";
		int likes = 0;

		// reply 테이블의 likes 변경하기 위해 객체 추가
		ReplyDao rd = ReplyDao.getInstance();
		
		if (rplikes > 0) { // 좋아요 한 게시글이 있으면
			rld.delete(mno, re_no); // bdlikes 테이블에서 데이터 삭제
			rd.likesMinus(re_no); // likes - 1
			imgSrc = "../../images/icons/heart.png";

		} else if (rplikes == 0) { // 좋아요 한 게시글이 없으면
			rld.insert(mno, re_no); // bdlikes 테이블에 데이터 추가
			rd.likesPlus(re_no); // likes + 1
			imgSrc = "../../images/icons/heart-fill.png";
		}			
		
		// board 테이블의 현재 likes 조회
		likes = rd.selectLikes(re_no);
		
		request.setAttribute("likes", likes);
		request.setAttribute("imgSrc", imgSrc);

		return "bdLikesCnt";
	}

}
