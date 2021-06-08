package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindIdResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
	
		MemberDao md = MemberDao.getInstance();
		Member member = md.findId(name, phone);		
		
		request.setAttribute("member", member);
		return "findIdResult";
	}

}
