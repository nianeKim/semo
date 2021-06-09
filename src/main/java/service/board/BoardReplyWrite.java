package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyDao;
import model.Reply;
import service.CommandProcess;

public class BoardReplyWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		// param으로 데이터 가져오기
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");
		
		// reply 세팅
		Reply reply = new Reply();
		reply.setMno(mno);
		reply.setBno(bno);
		reply.setContent(content);
		
		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.insert(reply);
		
		request.setAttribute("result", result);
		request.setAttribute("bno", bno);

		return "boardReplyWrite";
	}

}
