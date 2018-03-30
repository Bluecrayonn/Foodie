package models;

import java.util.List;
import java.util.Map;

public interface ProfileListDao {

	public List<Map> getRecipeidList(long userId);
	//public List<Map> getCommentidList();
	public List<Map> getBookmarkidList();
	public List<Map> getFollowingidList();
	public List<Map> getFolloweridList();
}
