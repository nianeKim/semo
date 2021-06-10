package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DisplayDao;
import model.Display;
import service.CommandProcess;

public class AdminDisplay implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		DisplayDao dd = DisplayDao.getInstance();
		List<Display> list = dd.list();
		
		return "adminDisplay";
	}

}
