package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import service.CommandProcess;

public class BoardWriteResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MemberDao md = MemberDao.getInstance();
		int mno = md.selectMno(id);		
			
		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		board.setMno(mno);
		
		BoardDao bd = BoardDao.getInstance();
		int result = bd.insert(board);
		
		request.setAttribute("result", result);

		return "boardWriteResult";
	}

}
