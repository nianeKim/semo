package service.board;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import model.Member;
import service.CommandProcess;

public class BoardMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		int mno = board.getMno();
		
		BoardDao bd = BoardDao.getInstance();
		List<Board> list = bd.list();
		
		MemberDao md = MemberDao.getInstance();
		String nick_nm = md.selectNick(mno); 

		request.setAttribute("list", list);
		request.setAttribute("nick_nm", nick_nm);

		return "boardMain";
	}

}
