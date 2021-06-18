package service.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDao;
import dao.MemberDao;
import model.Board;
import service.CommandProcess;

public class BoardWriteResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
				
		// board 생성
		Board board = new Board();

		// board에 세션에서 가져온 mno 세팅
		board.setMno(mno);
		
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈
		
		int result = 0;
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String thumbnail = mr.getFilesystemName("thumbnail"); // thumbnail input 내용 불러오기
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			
			// board 세팅
			board.setThumbnail(thumbnail);
			board.setTitle(title);
			board.setContent(content);
		
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		
		// boardDao 생성 및 insert
		BoardDao bd = BoardDao.getInstance();
		// insert/save 값 가져오기
		String action = request.getParameter("action");
		
		if (action.equals("insert")) {
			result = bd.insert(board);
		} else if (action.equals("save")) {
			result = bd.save(board);
		}
		
		request.setAttribute("result", result);

		return "boardWriteResult";
	}

}
