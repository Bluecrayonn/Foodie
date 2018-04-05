package models;

import java.util.List;
import java.util.Map;


// DAO 역할
//Interfact 역할이기 때문에 이걸 구현한 실제 DAO에서 메서드 구현을 해주어야 한다.

 
public interface FoodieMemberMapper {
	public List<FoodieMember> getAllMembers(); //여러명 가져올 때
	public Map getMember(String email,String password); //한명 가져올 때
	public void insertMember(FoodieMember foodieMember); //데이터를 DB에 저장
	public int updateMember(Map<String,String> map  ); //데이터 수정
	public void deleteMember(String nickname); //데이터 삭제
	
    
}
