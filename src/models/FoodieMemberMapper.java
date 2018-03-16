package models;

import java.util.List;



public interface FoodieMemberMapper {
	public List<FoodieMember> getAllMembers(); //여러명 가져올 때
	public FoodieMember getMember(String nickname); //한명 가져올 때
	public void insertMember(FoodieMember foodieMember); //데이터를 DB에 저장
	public void updateMember(FoodieMember foodieMember); //데이터 수정
	public void deleteMember(String nickname); //데이터 삭제
	
    
}
