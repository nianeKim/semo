package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Reservation;

public class ReservationDao {
	// singleton
	private static ReservationDao instance = new ReservationDao();
	private ReservationDao() {}
	public static ReservationDao getInstance() {
		return instance;
	}
	
	// Mybatis
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
	
	public int insert(Reservation reserve) {
		return session.insert("reservationns", reserve);
	}
	
	
}
