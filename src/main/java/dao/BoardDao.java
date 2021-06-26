package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;

public class BoardDao {
	private static BoardDao instance = new BoardDao();

	private BoardDao() {
	}

	public static BoardDao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
//			openSession(true) : 입력/삭제/수정 후에 commit
			session = ssf.openSession(true);
			reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// BoardWriteResult.java
	public int insert(Board board) {
		return session.insert("boardns.insert", board);
	}
	
	// BoardMain.java : order by bno desc
	public List<Board> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("boardns.list", hm);
	}

	// BoardMain.java : order by read_cnt desc
	public List<Board> list2(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("boardns.list2", hm);
	}

	// BoardMain.java : order by likes desc
	public List<Board> list3(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("boardns.list3", hm);
	}
	
	// BoardMain.java 게시글 메인페이지 게시글 수
	public int getTotalB() {
		return (int) session.selectOne("boardns.getTotalB");
	}

	// BoardView.java 게시글 상세 페이지
	public Board select(int bno) {
		return (Board) session.selectOne("boardns.selectOne", bno);
	}

	// BoardView.java 조회수 업데이트
	public void readcountUpdate(int bno) {
		session.update("boardns.readcountUpdate", bno);
	}

	// BdLikesCnt.java 좋아요수 +1
	public void likesPlus(int bno) {
		session.update("boardns.likesPlus", bno);
	}

	// BdLikesCnt.java 좋아요수 -1
	public void likesMinus(int bno) {
		session.update("boardns.likesMinus", bno);
	}
	
	// BoardDelete.java 게시글 삭제
	public int delete(int bno) {
		return session.update("boardns.delete", bno);
	}

	// BoardUpdateResult.java 게시글 수정
	public int update(Board board) {
		return session.update("boardns.update", board);
	}

	// MyMain.java 마이페이지 - 메인
	public List<Board> myMain(int mno) {
		return session.selectList("boardns.myMain", mno);
	}
	
	// MyBoardList.java 회원이 작성한 게시글 목록
	public List<Board> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("boardns.myList", hm);
	}
	
	// MyBoardList.java 회원이 작성한 게시글 수
	public int getTotalMy(int mno) {
		return (int) session.selectOne("boardns.getTotalMy", mno);
	}

	// AdminBoard.java 전체 게시글 목록(관리자)
	public List<Board> adminList(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return (List<Board>)session.selectList("boardns.adminList",hm);
	}

	// AdminBoard.java 전체 게시글 수(관리자)
	public int getTotal() {
	    return (int) session.selectOne("boardns.getTotal");
	}
	
	// adminFindBoard.java 관리자계정으로 board 검색
	public List<Board> searchBoard(String searchKey, String searchValue) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("searchKey", searchKey);
		hm.put("searchValue", searchValue);
		return (List<Board>)session.selectList("boardns.searchBoard",hm);
	}

	// SearchResult.java 검색 
	public List<Board> search(String srch) {
		return session.selectList("boardns.search", srch);
	}

}
