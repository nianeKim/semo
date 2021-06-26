package service.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BdSaveDao;
import dao.BoardDao;
import dao.MemberDao;
import model.BdSave;
import model.Board;
import service.CommandProcess;

public class BoardWriteResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 세션으로 mno 가져오기
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
				
		// board, bdSave 생성
		Board board = new Board();
		BdSave bdSave = new BdSave();

		// board, bdSave에 세션에서 가져온 mno 세팅
		board.setMno(mno);
		bdSave.setMno(mno);
		
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

			// bdSave 세팅
			bdSave.setThumbnail(thumbnail);
			bdSave.setTitle(title);
			bdSave.setContent(content);
		
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		
		// boardDao, bdSaveDao 생성 및 insert
		BoardDao bd = BoardDao.getInstance();
		BdSaveDao bsd = BdSaveDao.getInstance();
	
		// action 값 가져오기
		String action = request.getParameter("action");
		
		if (action.equals("insert")) { // 글작성
			result = bd.insert(board);
		
		} else if (action.equals("save_delete")) { // 글작성 + 임시저장 삭제
			result = bd.insert(board);
			int bs_no = Integer.parseInt(request.getParameter("bs_no"));
			bsd.deleteOne(bs_no);
			
		} else if (action.equals("save_first")) { // 임시저장 처음
			result = bsd.insert(bdSave);
			int bs_no = bsd.selectBsno();
			request.setAttribute("bs_no", bs_no);
		
		} else if (action.equals("save_again")) { // 임시저장 또
			int bs_no = Integer.parseInt(request.getParameter("bs_no"));
			bdSave.setBs_no(bs_no);
			result = bsd.update(bdSave);
			request.setAttribute("bs_no", bs_no);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("action", action);

		return "boardWriteResult";
	}

}
