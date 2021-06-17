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

	// BoardView.java
	public Board select(int bno) {
		return (Board) session.selectOne("boardns.selectOne", bno);
	}

	// BoardView.java (조회수 업데이트)
	public void readcountUpdate(int bno) {
		session.update("boardns.readcountUpdate", bno);
	}

	// BdLikesCnt.java (좋아요수 +1)
	public void likesPlus(int bno) {
		session.update("boardns.likesPlus", bno);
	}

	// BdLikesCnt.java (좋아요수 -1)
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

	// MyBoardList.java 작성한 스토리 목록
	public List<Board> mpList(int mno) {
		return session.selectList("boardns.mpList", mno);
	}
	
	// AdminBoard.java 작성한 스토리 목록
	public List<Board> adminList(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return (List<Board>)session.selectList("boardns.adminList",hm);
	}

	// AdminBoard.java 게시글 전체 개수 조회(페이징)
	public int getTotal() {
	      return (int) session.selectOne("boardns.getTotal");
	}

}
