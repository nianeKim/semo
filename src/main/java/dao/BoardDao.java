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
	public List<Board> list() {
		return session.selectList("boardns.list");
	}

	// BoardMain.java : order by read_cnt desc
	public List<Board> list2() {
		return session.selectList("boardns.list2");
	}

	// BoardMain.java : order by likes desc
	public List<Board> list3() {
		return session.selectList("boardns.list3");
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
}
