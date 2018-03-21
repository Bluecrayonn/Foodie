package models;

import java.util.List;
import java.util.Map;

public interface postListDAO {
	
	public List<Map> getAllPostList();
 	public List<Map> getDatePostList();
	public List<Map> getBookmarksPostList();

	

}
