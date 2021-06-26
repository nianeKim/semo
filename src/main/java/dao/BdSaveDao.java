package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BdSave;
import model.Board;

public class BdSaveDao {
	private static BdSaveDao instance = new BdSaveDao();

	private BdSaveDao() {
	}

	public static BdSaveDao getInstance() {
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

	// BoardWriteResult.java 임시저장 테이블에 입력
	public int insert(BdSave bdSave) {
		return session.insert("bdSavens.insert", bdSave);
	}

	// BoardWriteResult.java 임시저장 리스트 조회
	public List<BdSave> list(int mno) {
		return session.selectList("bdSavens.list", mno);
	}

	public BdSave select(int bs_no) {
		return (BdSave) session.selectOne("bdSavens.select", bs_no);
	}

	public int update(BdSave bdSave) {
		return session.update("bdSavens.update", bdSave);
	}

	public int selectBsno() {
		return (int) session.selectOne("bdSavens.selectBsno");
	}

	public void deleteOne(int bs_no) {
		session.delete("bdSavens.deleteOne", bs_no);
	}

	public int deleteList(int[] bs_no) {
		return session.delete("bdSavens.deleteList", bs_no);
	}

}
