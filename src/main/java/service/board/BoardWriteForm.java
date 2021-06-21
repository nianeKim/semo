package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BdSaveDao;
import dao.BoardDao;
import model.BdSave;
import model.Board;
import service.CommandProcess;

public class BoardWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();

		if (session.getAttribute("mno") != null) {

			int mno = (int) session.getAttribute("mno");
			// 임시저장 글 리스트 조회
			BdSaveDao bsd = BdSaveDao.getInstance();
			List<BdSave> list = bsd.list(mno);
			
			// 임시저장 글 불러올 때
			String action = request.getParameter("action");
			if (action.equals("save")) {
				int bs_no = Integer.parseInt(request.getParameter("bs_no"));
				BdSave bdsave = bsd.select(bs_no);
				
				request.setAttribute("bdsave", bdsave);
			}

			request.setAttribute("list", list);
		}
		
		return "boardWriteForm";
	}

}
