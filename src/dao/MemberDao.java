package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDto;
import mybatis.config.DBService;

public class MemberDao {
	private SqlSessionFactory factory;
	
	private MemberDao() {
		factory = DBService.getInstance().getFactory();
	}
	
	private static MemberDao mDao = new MemberDao();
	public static MemberDao getInstance() {
		return mDao;
	}
	
	// 기능
	// 1. 로그인
	public MemberDto selectBymIdmPw(MemberDto mDto) {
		SqlSession ss = factory.openSession();
		MemberDto resultDto = ss.selectOne("mybatis.mapper.member.selectBymIdmPw",mDto);
		ss.close();
		return resultDto;
	}
	
	// 2. 이메일로 아이디찾기
	public MemberDto selectBymEmail(String mEmail) {
		SqlSession ss = factory.openSession();
		MemberDto resultDto = ss.selectOne("mybatis.mapper.member.selectBymEmail",mEmail);
		ss.close();
		return resultDto;
	}
	
	
	// 3. 아이디 중복체크
	public MemberDto selectBymId(String mId) {
		SqlSession ss = factory.openSession();
		MemberDto resultDto = ss.selectOne("mybatis.mapper.member.selectBymId",mId);
		ss.close();
		return resultDto;
	}
	
	// 4. 회원가입
	public int insertMember(MemberDto mDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.member.insertMember", mDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 5. 비밀번호 찾기(변경)
	public int updateMemberInmPw(MemberDto mDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.member.updateMemberInmPw", mDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 6. 회원탈퇴
	public int deleteMember(String mId) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete("mybatis.mapper.member.deleteMember", mId);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
}
