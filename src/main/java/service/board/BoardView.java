package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import model.Member;
import service.CommandProcess;

public class BoardView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {	
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDao bd = BoardDao.getInstance();
//		bd.readcountUpdate(dno);
		Board board = bd.select(bno);
		int mno = board.getMno();
		
		MemberDao md = MemberDao.getInstance();
		String nick_nm = md.selectNick(mno); 
		
		request.setAttribute("nick_nm", nick_nm);
		request.setAttribute("bno", bno);
		request.setAttribute("board", board);
		
		return "boardView";
	}

}
