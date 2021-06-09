package service.board;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
//		bno와 mno 가져오기
		Board board = new Board();
		int bno = board.getBno();
		int mno = board.getMno();
		
		BoardDao bd = BoardDao.getInstance();
		List<Board> list = bd.list(); // order by bno (최신순)
		List<Board> list2 = bd.list2(); // order by read_cnt (조회순)
		List<Board> list3 = bd.list3(); // order by likes (인기순)

//		board에 있는 mno를 통해 member에 있는 nick_nm 가져오기
		MemberDao md = MemberDao.getInstance();
		String nick_nm = md.selectNick(mno); 
		
//		board에 있는 bno를 통해 reply의 수 가져오기
//		ReplyDao rd = ReplyDao.getInstance();
//		List<Reply> reply_cnt = rd.reply_cnt();

		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("nick_nm", nick_nm);
//		request.setAttribute("reply_cnt", reply_cnt);

		return "boardMain";
	}

}
