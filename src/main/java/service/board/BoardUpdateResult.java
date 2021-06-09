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

public class BoardUpdateResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// boardDao, board 생성
		Board board = new Board();
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈
		
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String thumbnail = mr.getFilesystemName("thumbnail"); // thumbnail input 내용 불러오기
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			
			// board 세팅
			board.setThumbnail(thumbnail);
			board.setTitle(title);
			board.setBno(bno);
			board.setContent(content);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
				
		BoardDao bd = BoardDao.getInstance();
		int result = bd.update(board);		
		
		request.setAttribute("result", result);
		request.setAttribute("bno", bno);

		return "boardUpdateResult";
	}

}
