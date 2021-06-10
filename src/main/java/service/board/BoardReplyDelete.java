package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import service.CommandProcess;

public class BoardReplyDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int re_no = Integer.parseInt(request.getParameter("re_no"));

		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.delete(re_no);
		
		request.setAttribute("result", result);
		request.setAttribute("bno", bno);
		
		return "boardReplyDelete";
	}
}
