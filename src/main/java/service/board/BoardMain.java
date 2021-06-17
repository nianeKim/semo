package service.board;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BdLikesDao;
import dao.BoardDao;
import dao.MemberDao;
import dao.ReplyDao;
import model.Board;
import model.Member;
import model.Reply;
import service.CommandProcess;

public class BoardMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bd = BoardDao.getInstance();
		
		final int ROW_PER_PAGE = 15; // 한 페이지에 게시글 10개 씩

		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지

		int total = bd.getTotal(); // 총 게시글 수
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(내림차순이니까 변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)
		
		List<Board> list = bd.list(startRow, endRow); // order by bno (최신순)
		List<Board> list2 = bd.list2(startRow, endRow); // order by read_cnt (조회순)
		List<Board> list3 = bd.list3(startRow, endRow); // order by likes (인기순)

		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);

		return "boardMain";
	}

}
