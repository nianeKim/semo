package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.RvLikes;

public class RvLikesDao {
	// singletone
	private static RvLikesDao instance = new RvLikesDao();
	private RvLikesDao() {}
	public static RvLikesDao getInstance() {
		return instance;
	}

	// MyBatis
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 회원이 리뷰에 좋아요했는지
	public RvLikes select(int mno, int rv_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mno", mno);
		hm.put("rv_no", rv_no);
		return (RvLikes) session.selectOne("rvLikesns.select", hm);
	}
	
	// 리뷰 좋아요한 회원 insert
	public void insert(int mno, int rv_no, int dno) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mno", mno);
		hm.put("rv_no", rv_no);
		hm.put("dno", dno);
		session.insert("rvLikesns.insert", hm);
	}
	
	// 리뷰 좋아요 했으면 취소
	public void delete(int mno, int rv_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mno", mno);
		hm.put("rv_no", rv_no);
		session.delete("rvLikesns.delete", hm);
	}
	
	// 해당 전시에
//	public List<Map<String, Integer>> selectList(int mno, int dno) {
//		return session.delete("rvLikesns.selectRvno", );
//	}
	
}
