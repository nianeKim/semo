package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;
import model.Reply;

public class ReplyDao {
	private static ReplyDao instance = new ReplyDao();

	private ReplyDao() {
	}

	public static ReplyDao getInstance() {
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

	// BoardView 각 게시글의 댓글 수
	public int count(int bno) {
		return (int) session.selectOne("replyns.count", bno);
	}
	// BoardReplyWrite 댓글 입력
	public int insert(Reply reply) {
		return session.insert("replyns.insert", reply);
	}

	// BoardView 댓글 목록
	public List<Reply> list(int bno) {
		return session.selectList("replyns.list", bno);
	}


	
}
