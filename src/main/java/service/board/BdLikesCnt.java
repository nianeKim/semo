package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BdlikesDao;
import dao.BoardDao;
import dao.MemberDao;
import dao.ReplyDao;
import model.Bdlikes;
import model.Board;
import model.Member;
import service.CommandProcess;

public class BdLikesCnt implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {	
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");

		// param으로 bno 가져옴
		int bno = Integer.parseInt(request.getParameter("bno"));
	
		// bdlikes에 회원이 좋아요한 게시글 있는지 조회
		BdlikesDao bld = BdlikesDao.getInstance();
		int bdlikes = bld.select(mno, bno);
		
		// bdLikesCnt.jsp에 보내줄 변수 생성
		String imgSrc = "";
		int msg = 0;

		// board 테이블의 likes 변경하기 위해 객체 추가
		BoardDao bd = BoardDao.getInstance();
		
		if (bdlikes > 0) { // 좋아요 한 게시글이 있으면
			bld.delete(mno, bno); // bdlikes 테이블에서 데이터 삭제
			bd.likesMinus(bno); // likes - 1
			imgSrc = "../../images/icons/heart.png";

		} else if (bdlikes == 0) { // 좋아요 한 게시글이 없으면
			bld.insert(mno, bno); // bdlikes 테이블에 데이터 추가
			bd.likesPlus(bno); // likes + 1
			imgSrc = "../../images/icons/heart-fill.png";
		}			
		
		// board 테이블의 현재 likes 조회
		Board board = bd.select(bno);
		msg = board.getLikes();
		
		request.setAttribute("msg", msg);
		request.setAttribute("imgSrc", imgSrc);

		return "bdLikesCnt";
	}

}
