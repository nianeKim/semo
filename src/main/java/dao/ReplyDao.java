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

	// BoardView.java 각 게시글의 댓글 수
	public int count(int bno) {
		return (int) session.selectOne("replyns.count", bno);
	}

	// BoardView.java 각 게시글의 댓글 목록
	public List<Reply> list(int bno) {
		return session.selectList("replyns.list", bno);
	}

	// BoardReplyWrite.java 댓글 입력
	public int insert(Reply reply) {
		int num = (int) session.selectOne("replyns.selectRe_no");
		if (reply.getRe_no() != 0) { // 답글일 때
			session.update("replyns.updateRef", reply);
			reply.setRef_step(reply.getRef_step() + 1);
			reply.setRef_level(reply.getRef_level() + 1);
		} else { // 답글 아닐 때(그냥 댓글)
			reply.setRef(num);
		}
		return session.insert("replyns.insert", reply);
	}

	// BoardReplyDelete.java 댓글 삭제
	public int delete(int re_no) {
		return session.update("replyns.delete", re_no);
	}

	// BoardReplyUpdate.java 댓글 수정
	public int update(Reply reply) {
		return session.update("replyns.update", reply);
	}

	// BdLikesCnt.java (좋아요수 +1)
	public void likesPlus(int re_no) {
		session.update("replyns.likesPlus", re_no);
	}

	// BdLikesCnt.java (좋아요수 -1)
	public void likesMinus(int re_no) {
		session.update("replyns.likesMinus", re_no);
	}

	public int selectLikes(int re_no) {
		return (int) session.selectOne("replyns.selectLikes", re_no);
	}
	
}
