package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	 
	public static MemberDao getInstance() {
		return instance;
	}

	private static SqlSession session;
		static {
			try {
				Reader reader = Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
				reader.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		// joinResult, IdConfirm, loginResult
		public Member select(String id) {
			return (Member) session.selectOne("memberns.select", id);
		}
		//confirmNick_nm
		public Member confirmNick(String nick_nm) {
			return (Member) session.selectOne("memberns.confirmNick", nick_nm);
		}
		// joinResult
		public int insert(Member member) {			
			return session.insert("memberns.insert", member);
		}

		// 다른 테이블에서 회원번호를 활용한 닉네임 찾기
		public Member selectNick(int mno) {
			return (Member) session.selectOne("memberns.selectNick", mno);
		}
		// 다른 테이블에서 세션 아이디를 활용한 회원번호 찾기
		public int selectMno(String id) {
			return (int) session.selectOne("memberns.selectMno", id);
		}
}
