package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardDto;
import mybatis.config.DBService;

public class BoardDao {

	// SqlSession 을 생성할 수 있는 factory
	private SqlSessionFactory factory;
	
	// BBSDao 의 singleton 처리
	private BoardDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BoardDao bDao = new BoardDao();
	public static BoardDao getInstance() {
		return bDao;
	}

	// Method
	// 1. 전체 게시글
	public List<BoardDto> selectBoardList(Map<String, Integer> map){
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.selectBoardList", map);
		ss.close();
		return list;
	}
	
	// 2. 글개수
	public int selectBoardCount() {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.board.selectBoardCount");
		ss.close();
		return totalRecord;
	}
	
	public int boardInsert(BoardDto bDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.board.boardInsert", bDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public BoardDto selectBybNo(int bNo) {
		SqlSession ss = factory.openSession();
		BoardDto bDto = ss.selectOne("mybatis.mapper.board.selectBybNo", bNo);
		ss.close();
		return bDto;
	}

	// 조회수
	public int boardUpdatebHit(int bNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.boardUpdatebHit", bNo);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 댓글 삽입
	public int replyInsert(BoardDto rDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.board.replyInsert", rDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 댓글 수정
	public int replyUpdateGroupOrd(BoardDto bDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.replyUpdateGroupOrd", bDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}

	// 1. 전체 게시글
	public List<BoardDto> selectQueryBoardList(Map<String, String> map){
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.selectQueryBoardList", map);
		ss.close();
		return list;
	}
	
	// 2. 글개수
	public int selectQueryBoardCount(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		int totalQueryRecord = ss.selectOne("mybatis.mapper.board.selectQueryBoardCount", map);
		ss.close();
		return totalQueryRecord;
	}
	
	// 1. 내 게시글
	public List<BoardDto> selectMyBoardList(Map<String, String> map){
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.selectMyBoardList", map);
		ss.close();
		return list;
	}
	
	// 2. 내 글개수
	public int selectMyBoardCount(Map<String, String> map) {
		SqlSession ss = factory.openSession();
		int totalMyRecord = ss.selectOne("mybatis.mapper.board.selectMyBoardCount", map);
		ss.close();
		return totalMyRecord;
	}
	
	// 글 삭제
	public int boardDelete(int bNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.boardDelete", bNo);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
}
