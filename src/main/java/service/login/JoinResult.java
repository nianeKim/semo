package service.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class JoinResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nick_nm = request.getParameter("nick_nm");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String loc = request.getParameter("loc");
		int age = Integer.parseInt(request.getParameter("age"));
		return null;
	}

}
