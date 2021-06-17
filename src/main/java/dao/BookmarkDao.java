package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BdLikes;
import model.Board;

public class BookmarkDao {
	private static BookmarkDao instance = new BookmarkDao();

	private BookmarkDao() {
	}

	public static BookmarkDao getInstance() {
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
	
	// BdLikesCnt.java mno가 좋아요 한 bno 있는지 확인
	public int select(int mno, int dno) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("dno", dno);
		return (int) session.selectOne("bookmarkns.select", hm);
	}
	
	// BdLikesCnt.java 회원이 게시글 좋아요 클릭
	public void insert(int mno, int dno) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("dno", dno);
		session.insert("bookmarkns.insert", hm);
	}
	
	// BdLikesCnt.java 회원이 게시글 좋아요 취소
	public void delete(int mno, int dno) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("dno", dno);
		session.delete("bookmarkns.delete", hm);	
	}
}
