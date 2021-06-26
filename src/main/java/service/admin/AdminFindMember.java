package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class AdminFindMember implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
			
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		MemberDao md = MemberDao.getInstance();
		
		List<Member> list = md.searchMember(searchKey,searchValue);

		request.setAttribute("list",list);
		return "adminFindMember";
	}
}
