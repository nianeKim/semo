package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import model.Display;
import service.CommandProcess;

public class DpMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		DisplayDao dd = DisplayDao.getInstance();
		List<Display> list = dd.list();
		
		request.setAttribute("list", list);
		
		return "dpMain";
	}

}
