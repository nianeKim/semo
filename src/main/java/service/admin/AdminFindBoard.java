package service.admin;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class AdminFindBoard implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		BoardDao bd = BoardDao.getInstance();
		
		List<Board> list = bd.searchBoard(searchKey, searchValue);

		request.setAttribute("list",list);
		return "adminFindBoard";
	}

}
