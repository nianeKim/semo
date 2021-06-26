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
import model.RpLikes;

public class RpLikesDao {
	private static RpLikesDao instance = new RpLikesDao();

	private RpLikesDao() {
	}

	public static RpLikesDao getInstance() {
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
	public int select(int mno, int re_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("re_no", re_no);
		return (int) session.selectOne("rpLikesns.select", hm);
	}
	
	// BdLikesCnt.java 회원이 게시글 좋아요 클릭
	public void insert(int mno, int re_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("re_no", re_no);
		session.insert("rpLikesns.insert", hm);
	}
	
	// BdLikesCnt.java 회원이 게시글 좋아요 취소
	public void delete(int mno, int re_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("re_no", re_no);
		session.delete("rpLikesns.delete", hm);	
	}

	public List<RpLikes> list() {
		return session.selectList("rpLikesns.list");
	}
}
