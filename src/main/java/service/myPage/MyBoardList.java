package service.myPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class MyBoardList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno"); // session mno
		
		BoardDao bd = BoardDao.getInstance();
		List<Board> list = bd.mpList(mno);
		
		request.setAttribute("list", list);
		
		return "myBoardList";
	}

}
