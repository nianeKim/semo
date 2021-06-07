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
		// 세션을 통해서 회원번호 가져옴
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();
		int mno = md.selectMno(id);		
		// param으로 게시글 번호 가져옴
		int bno = Integer.parseInt(request.getParameter("bno"));
		int msg = 0;
	
		// board likes 조회
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(bno);
		
		// bdlikes에 회원이 좋아요한 게시글 있는지 조회
		BdlikesDao bld = BdlikesDao.getInstance();
		int bdlikes = bld.select(mno, bno);

		
		if (bdlikes > 0) { // 좋아요 한 게시글이 있으면
			bd.likesMinus(bno);
			bld.delete(mno, bno);
			msg = board.getLikes();
		
		} else if (bdlikes == 0) { // 좋아요 한 게시글이 없으면
			bd.likesPlus(bno); // likes + 1
			bld.insert(mno, bno);
			msg = board.getLikes();
		}			
		
		request.setAttribute("msg", msg);

		return "bdLikesCnt";
	}

}
