package services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.FoodieMember;
import models.FoodieMemberMapper;

@Service
// DAO객체를 구현해주는 Service
// @Repository 서비스 대신 Repository(저장소)로 대체해도 가능
public class FoodieMemberImpl implements FoodieMemberMapper {

	// FoodieMemeberMapper interface를 구현

	@Autowired
	SqlSessionFactory factory;

	// SqlSession을 이용하여 mapping
	// SqlSession은 dispatcher-servlet.xml에 있는 SqlSessionFactory를 포함하고 있음
	// dispatcher-servlet.xml에 등록되어 있기 때문에 AutoWired

	@Override
	public List<FoodieMember> getAllMembers() {
		/*
		 * List<FoodieMember> members = new ArrayList<FoodieMember>();
		 * FoodieMemberMapper foodieMemberMapper =
		 * sqlSession.getMapper(FoodieMemberMapper.class); //FoodieMemberMapper 클래스에 있는
		 * 메소드를 이용하기 위해 맴버클래스를 얻어옴
		 * 
		 * members = foodieMemberMapper.getAllMembers(); return members;
		 */
		SqlSession sqlSession = factory.openSession();
		// 위의 작업을 코드단순화
		try {
			List<FoodieMember> listResult = sqlSession.selectList("getAllMembers");
			return listResult;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			sqlSession.close();
		}
		return null;

		// SqlSession에 있는 selectList 함수 사용 => return이 List로 넘어가서 코드가 간결
	}

	@Override
	public FoodieMember getMember(String nickname) {
		/*
		 * FoodieMemberMapper foodieMemberMapper =
		 * sqlSession.getMapper(FoodieMemberMapper.class); return
		 * foodieMemberMapper.getMember(nickname);
		 */

		SqlSession sqlSession = factory.openSession();

		try {
			FoodieMember foodieMemberResult = sqlSession.selectOne("getMember", nickname);
			return foodieMemberResult;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		sqlSession.close(); 
		}
		return null;

	}

	@Override
	public void insertMember(FoodieMember foodieMember) {
		/*
		 * FoodieMemberMapper foodieMemberMapper =
		 * sqlSession.getMapper(FoodieMemberMapper.class);
		 * foodieMemberMapper.insertMember(foodieMember);
		 */

		SqlSession sqlSession = factory.openSession();

		try {
			int insertResult = sqlSession.insert("insertMember", foodieMember);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.close();
		}

	}

	@Override
	public void updateMember(FoodieMember foodieMember) {
		/*
		 * FoodieMemberMapper foodieMemberMapper =
		 * sqlSession.getMapper(FoodieMemberMapper.class);
		 * foodieMemberMapper.updateMember(foodieMember);
		 */

		SqlSession sqlSession = factory.openSession();
		try {
			int updateResult = sqlSession.update("updateMember", foodieMember);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.close();
		}

	}

	@Override
	public void deleteMember(String nickname) {
		/*
		 * FoodieMemberMapper foodieMemberMapper =
		 * sqlSession.getMapper(FoodieMemberMapper.class);
		 * foodieMemberMapper.deleteMember(nickname);
		 */

		SqlSession sqlSession = factory.openSession();
		try {
			int deleteResult = sqlSession.delete("deleteMember", nickname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			sqlSession.close();
		}

	}
}
