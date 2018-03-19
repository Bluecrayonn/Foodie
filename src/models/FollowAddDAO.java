package models;

import java.util.List;
import java.util.Map;

public interface FollowAddDAO {

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
	public List<Map> addFollowingRDB(long targetId, long ownerId);
	public List<Map> removeFollowingRDB(long targetId, long ownerId);

	public List<Map> addBookmarksRDB(long postId, long userId);
	public List<Map> removeBookmarksRDB(long postId, long userId);

}
