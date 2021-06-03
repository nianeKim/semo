package dao;

import java.io.Reader;

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
	
	public int insert(Display dp) {
		return session.insert("displayns.insert", dp); 
	}
}
