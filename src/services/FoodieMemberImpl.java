package services;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.FoodieMember;
import models.FoodieMemberMapper;

@Service
// DAO객체를 구현해주는 Service
// @Repository 서비스 대신 Repository(저장소)로 대체해도 가능
public class FoodieMemberImpl implements FoodieMemberMapper{

	
	//FoodieMemeberMapper interface를 구현
	
	
	
	@Autowired
	SqlSession sqlSession;
	//SqlSession을 이용하여 mapping
	//SqlSession은 dispatcher-servlet.xml에 있는 SqlSessionFactory를 포함하고 있음
	// dispatcher-servlet.xml에 등록되어 있기 때문에 AutoWired
	

	@Override
	public List<FoodieMember> getAllMembers() {
		/* List<FoodieMember> members = new ArrayList<FoodieMember>();
		FoodieMemberMapper foodieMemberMapper 
		= sqlSession.getMapper(FoodieMemberMapper.class);
		//FoodieMemberMapper 클래스에 있는 메소드를 이용하기 위해 맴버클래스를 얻어옴
		
		members = foodieMemberMapper.getAllMembers();
		return members; */
		
		// 위의 작업을 코드단순화 
		
		return sqlSession.selectList("getAllMembers");
		//SqlSession에 있는 selectList 함수 사용 => return이 List로 넘어가서 코드가 간결	
	}

	@Override
	public FoodieMember getMember(String nickname) {
		/*FoodieMemberMapper foodieMemberMapper 
		= sqlSession.getMapper(FoodieMemberMapper.class);
		return foodieMemberMapper.getMember(nickname);*/
	return sqlSession.selectOne("getMember", nickname);
	}

	@Override
	public void insertMember(FoodieMember foodieMember) {
		/*FoodieMemberMapper foodieMemberMapper 
		= sqlSession.getMapper(FoodieMemberMapper.class);
		foodieMemberMapper.insertMember(foodieMember);*/
		sqlSession.insert("insertMember", foodieMember);
	}

	@Override
	public void updateMember(FoodieMember foodieMember) {
		/*FoodieMemberMapper foodieMemberMapper 
		= sqlSession.getMapper(FoodieMemberMapper.class);
		foodieMemberMapper.updateMember(foodieMember);*/
		sqlSession.update("updateMember", foodieMember);
	}

	@Override
	public void deleteMember(String nickname) {
		/*FoodieMemberMapper foodieMemberMapper 
		= sqlSession.getMapper(FoodieMemberMapper.class);
		foodieMemberMapper.deleteMember(nickname);*/
		sqlSession.delete("deleteMember", nickname);
	}

	
	
}
