package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;
import service.member.MailResult;

public class ConfirmIdResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("mail_chk");
		/*
		 * String key = request.getAttribute(code);
		 * 
		 * 
		 * boolean isRight = (MailResult("key") )
		 */
		
		
		
		
		return null;
	}

}
