package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BdlikesDao;
import dao.BoardDao;
import dao.MemberDao;
import dao.ReplyDao;
import model.Board;
import model.Reply;
import service.CommandProcess;

public class BoardView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));

		BoardDao bd = BoardDao.getInstance();
		// 조회수 카운트
		bd.readcountUpdate(bno);

		// 데이터 가져오기
		Board board = bd.select(bno);

		// 회원테이블에서 닉네임 데이터 가져오기
		int mno = board.getMno(); // board에 저장된 mno
		MemberDao md = MemberDao.getInstance();
		String nick_nm = md.selectNick(mno);

		// bdlikes에 회원이 좋아요한 게시글 있는지 조회
		BdlikesDao bld = BdlikesDao.getInstance();
		HttpSession session = request.getSession();
		String imgSrc = "";
		if (session.getAttribute("mno") != null) {
			mno = (int) session.getAttribute("mno"); // session mno
			int bdlikes = bld.select(mno, bno);
			if (bdlikes > 0) { // 좋아요 한 게시글이면
				imgSrc = "../../images/icons/heart-fill.png";
				
			} else if (bdlikes == 0) { // 좋아요 한 게시글이 아니면
				imgSrc = "../../images/icons/heart.png";
			}
		}

		// 댓글테이블에서 댓글 수 가져오기
		ReplyDao rd = ReplyDao.getInstance();
		List<Reply> list = rd.list(bno); // 댓글 목록
		int reply_cnt = list.size(); // 게시글에 해당하는 댓글 수

		request.setAttribute("bno", bno);
		request.setAttribute("board", board);
		request.setAttribute("nick_nm", nick_nm);
		request.setAttribute("list", list);
		request.setAttribute("reply_cnt", reply_cnt);
		request.setAttribute("imgSrc", imgSrc);

		return "boardView";
	}

}
