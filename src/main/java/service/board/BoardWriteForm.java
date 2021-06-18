package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * // 세션으로 mno 가져오기 HttpSession session = request.getSession(); int mno = (int)
		 * session.getAttribute("mno"); String bno = request.getParameter("bno");
		 * 
		 * if (bno != null || !bno.equals("")) { BoardDao bd = BoardDao.getInstance();
		 * Board board = bd.select(bno); }
		 */
		
		return "boardWriteForm";
	}

}
