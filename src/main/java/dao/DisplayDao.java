package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
			session = ssf.openSession(true); // true로 해야 입력,수정,삭제한 후에 commit실행
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
}
