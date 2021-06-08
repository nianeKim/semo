package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Display;



public class DisplayDao {
	// singletone
	private static DisplayDao instance = new DisplayDao();
	private DisplayDao() {}
	public static DisplayDao getInstance() {
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
	
	// 전시 등록
	public int insert(Display dp) {
		return session.insert("displayns.insert", dp); 
	}
	
	// 전시 리스트 통합 조회
	public List<Display> list() {
		return (List<Display>)session.selectList("displayns.selectList");
	}
	
	// dname 중복 체크
	public Display select(String dname) {
		return (Display) session.selectOne("displayns.select", dname);
	}
	
	// 전시 상세 select
	public Display select(int dno) {
		return (Display) session.selectOne("displayns.selectView", dno);
	}
	
	// 전시 수정
	public int update(Display display) {
		return session.update("displayns.update", display);
	}
	
	// 전시 삭제
	public int delete(int dno) {
		return session.delete("displayns.delete", dno);
	}
}
