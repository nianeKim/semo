package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Review;

public class ReviewDao {
	// singletone
	private static ReviewDao instance = new ReviewDao ();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return instance;
	}
	
	// mybatis
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
	
	// 리뷰 등록
	public int insert(Review review) { 
		return session.insert("reviewns.insert", review);
	}
	
	// 해당 전시의 review list
	public List<Review> select(int dno) {
		return session.selectList("reviewns.select", dno);
	}
	
	// 평균 별점 가져오기
	public float selectStar(int dno) {
		return (float) session.selectOne("reviewns.selectStar", dno);
	}
	
	// 리뷰 수정
	public int update(Review review) {
		return session.update("reviewns.update", review);
	}
	
	// 리뷰 삭제
	public int delete(int dno, int mno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("dno", dno);
		map.put("mno", mno);
		return session.update("reviewns.delete", map);
	}
	
}
