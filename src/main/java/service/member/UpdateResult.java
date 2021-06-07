package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String nick_nm=request.getParameter("nick_nm");
		String phone=request.getParameter("phone");
		String gender = request.getParameter("gender");
		String loc = request.getParameter("loc");
		int age = Integer.parseInt(request.getParameter("age"));
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setNick_nm(nick_nm);
		member.setPhone(phone);
		member.setGender(gender);
		member.setLoc(loc);
		member.setAge(age);
		
		MemberDao md = MemberDao.getInstance();
		int result = md.update(member);
		request.setAttribute("result", result);
		
		return "updateResult";
	}

}
