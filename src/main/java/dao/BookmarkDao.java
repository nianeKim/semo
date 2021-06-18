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
import model.Bookmark;
import model.Display;
import service.display.BookmarkUpdate;

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

	// 회원이 해당 전시를 북마크 했는지 체크
	public Bookmark select(int dno, int mno) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("dno", dno);
		hm.put("mno", mno);
		return (Bookmark) session.selectOne("bookmarkns.select", hm);
	}

	// 북마크하면 insert
	public void insert(int dno, int mno) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("dno", dno);
		hm.put("mno", mno);
		session.insert("bookmarkns.insert", hm);
	}

	// 북마크 취소
	public void delete(int dno, int mno) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("dno", dno);
		hm.put("mno", mno);
		session.delete("bookmarkns.delete", hm);
	}
	
	// 마이페이지 - 북마크 한 수
	public int getTotalMy(int mno) {
		return (int) session.selectOne("bookmarkns.getTotalMy", mno);
	}

	public List<Display> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mno", mno);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("bookmarkns.myList", hm);
	}
	
	
}
