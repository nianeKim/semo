package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyDao;
import model.Reply;
import service.CommandProcess;

public class BoardReplyUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// param으로 데이터 가져오기
		int bno = Integer.parseInt(request.getParameter("bno"));
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		String content = request.getParameter("content");
		
		// reply 세팅
		Reply reply = new Reply();
		reply.setRe_no(re_no);
		reply.setContent(content);
		
		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.update(reply);
		
		request.setAttribute("bno", bno);
		request.setAttribute("re_no", re_no);
		request.setAttribute("result", result);

		return "boardReplyUpdate";
	}

}
