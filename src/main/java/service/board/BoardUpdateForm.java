package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(bno);
		
		request.setAttribute("board", board);
	
		return "boardUpdateForm";
	}
	
}
