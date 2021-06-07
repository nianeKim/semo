package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.MemberDao;
import dao.ReplyDao;
import model.Board;
import model.Member;
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
		
		// 댓글테이블에서 댓글 수 가져오기
		ReplyDao rd = ReplyDao.getInstance();
		int reply_cnt = rd.count(bno);
		
		request.setAttribute("bno", bno);
		request.setAttribute("board", board);
		request.setAttribute("nick_nm", nick_nm);
		request.setAttribute("reply_cnt", reply_cnt);

		return "boardView";
	}

}
