package services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import models.post.postListImpl;

public class PostListController {

	Gson gson;

	@Autowired
	postListImpl postlist;

	@RequestMapping("/postList.do")
	@ResponseBody
	public String postListHandler(String type) {
		
		gson = new Gson();
		String result = null;
		
		
		switch (type) {
		case "all": {
			List<Map> resultList = postlist.getAllPostList();
			result = gson.toJson(resultList);

		}
			break;
		case "date": {
			List<Map> resultList = postlist.getDatePostList();
			result = gson.toJson(resultList);
		}
			break;
		case "bookmark": {
			List<Map> resultList = postlist.getBookmarksPostList();
			result = gson.toJson(resultList);
		}
			break;

		}

		return result;
	}

}
