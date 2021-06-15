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
		String content = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		
		// reply 세팅
		Reply reply = new Reply();
		reply.setContent(content);
		reply.setMno(mno);
		reply.setBno(bno);
		reply.setRe_no(re_no);
		
		if (re_no != 0) { // 답변글일 때
			int ref = Integer.parseInt(request.getParameter("ref"));
			int ref_step = Integer.parseInt(request.getParameter("ref_step"));
			int ref_level = Integer.parseInt(request.getParameter("ref_level"));
			reply.setRef(ref);
			reply.setRef_step(ref_step);
			reply.setRef_level(ref_level);
		}
		
		
		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.insert(reply);
		
		request.setAttribute("result", result);
		request.setAttribute("bno", bno);

		return "boardReplyWrite";
	}

}
