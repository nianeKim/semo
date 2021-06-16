package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return session.update("displayns.delete", dno);
	}
	
	// 지역 태그로 리스트 조회
	public List<Display> listLoc(String[] loc) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("loc", loc);
		return session.selectList("displayns.selectLoc", loc);
	}
	
	// 마이페이지 등록한 전시 리스트
	public List<Display> mpList(int mno) {
		return session.selectList("displayns.mpList", mno);
	}
	
	// 전시 리스트 통합 조회(관리자페이지)
   public List<Display> adminlist(int startRow, int endRow) {
      HashMap<String, Integer> hm = new HashMap<>();
      hm.put("startRow", startRow);
      hm.put("endRow", endRow);
      return (List<Display>)session.selectList("displayns.adminlist", hm);
   }
   
   //AdminMember - 총 전시수
   public int getTotal() {
      return (int) session.selectOne("displayns.getTotal");
   }
}
