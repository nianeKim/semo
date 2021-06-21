package service.myPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.BookmarkDao;
import dao.DisplayDao;
import dao.MemberDao;
import dao.ReservationDao;
import model.Board;
import model.Bookmark;
import model.Display;
import model.Member;
import model.Reservation;
import service.CommandProcess;

public class MyMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("mno") != null) {

			int mno = (int) session.getAttribute("mno"); // session mno

			/////// 마이페이지 공통 시작 ///////
			// 로그인 한 회원 정보 가져오기
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(mno);
			// 북마크 개수
			BookmarkDao bmd = BookmarkDao.getInstance();
			int bmTotal = bmd.getTotalMy(mno);
			/////// 마이페이지 공통 끝 ///////

			// 북마크 리스트
			List<Bookmark> bmList = bmd.myMain(mno);

			// 예매 리스트
			ReservationDao rsvd = ReservationDao.getInstance();
			List<Reservation> rsvList = rsvd.myMain(mno);

			// 등록한 전시 리스트
			DisplayDao dd = DisplayDao.getInstance();
			List<Display> dpList = dd.myMain(mno);

			// 작성한 스토리 리스트
			BoardDao bd = BoardDao.getInstance();
			List<Board> bdList = bd.myMain(mno);

			request.setAttribute("member", member);
			request.setAttribute("bmTotal", bmTotal);
			request.setAttribute("bmList", bmList);
			request.setAttribute("rsvList", rsvList);
			request.setAttribute("dpList", dpList);
			request.setAttribute("bdList", bdList);
		}
		return "myMain";

	}
}
