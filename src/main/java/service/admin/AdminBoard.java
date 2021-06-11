package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class AdminBoard implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bd = BoardDao.getInstance();
		List<Board> list = bd.list();
		
		request.setAttribute("list", list);
		
		return "adminBoard";
	}

}
