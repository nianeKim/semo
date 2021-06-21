package dao;

import java.io.Reader;
import java.util.HashMap;
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
	public List<Display> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Display>)session.selectList("displayns.selectList", hm);
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
	public List<Display> listLoc(String[] loc, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("loc", loc);
		return session.selectList("displayns.selectLoc", hm);
	}
	
	// 마이페이지 등록한 전시 리스트
	public List<Display> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("displayns.myList", hm);
	}
	
	// 전시 리스트 통합 조회(관리자페이지)
	public List<Display> adminlist(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Display>) session.selectList("displayns.adminlist", hm);
	}
   
	// AdminMember - 총 전시수
	public int getTotal() {
		return (int) session.selectOne("displayns.getTotal");
	}
   
	// display paging total
	public int getTotalD() {
		return (int) session.selectOne("displayns.getTotalD");
	}
	
	// 마이페이지 paging total
	public int getTotalMy(int mno) {
		return (int) session.selectOne("displayns.getTotalMy", mno);
	}
	
	// display loc 필터 total
	public int getTotalLoc(String[] loc) {
		return (int) session.selectOne("displayns.getTotalLoc", loc);
	}
	
	// 태그로 리스트 조회
	public List<Display> listTag(String[] tag, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("tag", tag);
		return session.selectList("displayns.selectTag", hm);
	}
	
	// tag total
	public int getTotalTag(String[] tag) {
		return (int) session.selectOne("displayns.getTotalTag", tag);
	}
	
	//AdminFindDisplay 
	public List<Display> searchDisplay(String searchKey, String searchValue) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("searchKey", searchKey);
		hm.put("searchValue", searchValue);
		return (List<Display>)session.selectList("displayns.searchDisplay",hm);
	}
	
	// 마이페이지 - 메인
	public List<Display> myMain(int mno) {
		return session.selectList("displayns.myMain", mno);
	}

	// 검색
	public List<Display> search(String srch) {
		return session.selectList("displayns.search", srch);
	}
}
