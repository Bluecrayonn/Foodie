package models;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public interface FollowInfoDAO {
	
	
	//유저의 email 정보를 이용해서 나를 following 하고 있는 사람 정보 가지고 오기
	public List<Map> getFollower(long accountId) ;
	//유저의 email 정보를 이용해서 내가 following 하고 있는 사람 정보 가지고 오기
	public List<Map> getFollowing(long accountId);
	//유저의 email 정보를 이용해서 내가 bookmark 한 posting 가지고 오기
	public List<Map> getBookmarks(long accountId);
	
	

}
