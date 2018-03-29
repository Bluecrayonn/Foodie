package models;

import java.util.List;
import java.util.Map;

public interface SocialAddDAO {

	/*
	 * NoSQL(Mongo) 
	 */
	public List<Map> addFollowing(long targetId, long ownerId);
	public List<Map> removeFollowing(long targetId, long ownerId);

	public List<Map> addBookmarks(long postId, long userId);
	public List<Map> removeBookmarks(long postId, long userId);
	
	
	/*
	 * RDB 
	 */
	public int addFollowingRDB(Map map);
	public int removeFollowingRDB(Map map);

	public int addBookmarksRDB(Map map);
	public int removeBookmarksRDB(Map map);

}
