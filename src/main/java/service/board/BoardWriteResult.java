package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardWriteResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board board = new Board();
		board.setTitle(title);
		board.setContent(content);
		
		BoardDao bd = BoardDao.getInstance();
		int result = bd.insert(board);
		
		request.setAttribute("result", result);

		return "boardWriteResult";
	}

}
