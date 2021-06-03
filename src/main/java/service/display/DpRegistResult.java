package service.display;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class DpRegistResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberDao md = MemberDao.getInstance();
		int mno = md.selectMno(id); // login된 id로 mno select
		
		String dname = request.getParameter("dname");
		Date start_date = Date.valueOf(request.getParameter("start_date"));
		Date end_date = Date.valueOf(request.getParameter("end_date"));
		String hours = request.getParameter("hours");
		String loc = request.getParameter("loc");
		int fee = Integer.parseInt(request.getParameter("fee"));
		int fee_adult = Integer.parseInt(request.getParameter("fee_adult"));
		int fee_teen = Integer.parseInt(request.getParameter("fee_teen"));
		int fee_child = Integer.parseInt(request.getParameter("fee_child"));
		String intro = request.getParameter("intro");
		String tag = request.getParameter("tag");
		String artist = request.getParameter("artist");
		String tel = request.getParameter("tel");
		String home_pg = request.getParameter("home_pg");
		
		
		return "dpRegistResult";
	}

}
