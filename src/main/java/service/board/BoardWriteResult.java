package service.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import service.CommandProcess;

public class BoardWriteResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		세션으로 회원 id 가져온 후 mno select
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();
		int mno = md.selectMno(id);		
		
//		board 생성
		Board board = new Board();
		
//		input 내용 불러오기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
//		파일 업로드
		String real = request.getSession().getServletContext().getRealPath("/upload");
		try {
			MultipartRequest mr = new MultipartRequest(request, real, "utf-8");
			String poster = mr.getFilesystemName("poster");
			File file = new File(real + "/" + poster);
			InputStream is = new FileInputStream(file);
//			board에 poster 세팅
			board.setPoster(poster);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		board 세팅
		board.setTitle(title);
		board.setContent(content);
		board.setMno(mno);
		
//		boardDao 생성 및 insert
		BoardDao bd = BoardDao.getInstance();
		int result = bd.insert(board);
		
		request.setAttribute("result", result);

		return "boardWriteResult";
	}

}
