package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import model.Display;
import service.CommandProcess;

public class AdminFindDisplay implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		DisplayDao dd = DisplayDao.getInstance();
		
		List<Display> list = dd.searchDisplay(searchKey,searchValue);
		request.setAttribute("list", list);
		return "adminFindDisplay";
	}
}
