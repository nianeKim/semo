package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class AdminMember implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MemberDao md = MemberDao.getInstance();
		List<Member> list = md.list();
		
		request.setAttribute("list", list);
		return "adminMember";
	}

}
