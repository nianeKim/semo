package service.display;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import model.Bookmark;
import service.CommandProcess;

public class BookmarkUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		// 회원이 해당 전시를 북마크 했는지 체크
		BookmarkDao bmd = BookmarkDao.getInstance();
		Bookmark bm = bmd.select(dno, mno);
		String color = "";
		
		if (bm == null) { // 북마크 해줌
			bmd.insert(dno, mno);
			color = "var(--point-color)";
		} else { // 북마크 뺌
			bmd.delete(dno, mno);
			color = "none";
		}
		
		request.setAttribute("color", color);
		
		return "bookmarkUpdate";
	}

}
