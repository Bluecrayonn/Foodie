package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import models.IngredientDao;
import models.PostDao;
import services.FileUploadService;

@Controller
@RequestMapping("/foodie/write")
public class WritePostController {
	@Autowired
	PostDao postDao;
	@Autowired
	IngredientDao ingredientDao;

	@RequestMapping("/writepost.do")
	public String write() {
		return "writepage";
	}

	@RequestMapping("/modifypost.do")
	public String modify(@RequestParam int pid, ModelMap map) {
		map.put("post", postDao.getOnePost(pid));
		map.put("ingredient", ingredientDao.getIngredientById(pid));
		return "writepage";
	}

	@RequestMapping("/editorcontents.do")
	@ResponseBody
	public String summernoteContents(@RequestParam int pid) {
		String contents = (String)postDao.getOnePost(pid).get("CONTENT");
		return contents;
	}
	
	@RequestMapping("/confirm.do")
	public String write_ok(@RequestParam("thumbnail") MultipartFile f, @RequestParam HashMap params,
			@RequestParam String[] ig_name, @RequestParam String[] ig_amount, @RequestParam String[] ig_unit,
			HttpServletRequest request, RedirectAttributes redirectAttributes) throws IllegalStateException, IOException {
		System.out.println("f empty?:" + f.isEmpty());
		System.out.println(params.get("prev_img"));
		int uid = (int) (long) ((Map) request.getSession().getAttribute("auth")).get("ACCOUNT_ID");
		params.put("writer", uid);
		if ((params.get("isMod").equals("YY") && !f.isEmpty()) || params.get("isMod").equals("NN")) {
			FileUploadService fileUploadService = new FileUploadService();
			params.put("mainimage", fileUploadService.thumbnailUpload(request, f));
		} else {
			params.put("mainimage", params.get("prev_img"));
		}
		List rst_name = new LinkedList();
		List rst_amount = new LinkedList();
		List rst_unit = new LinkedList();

		for (int i = 0; i < ig_name.length; i++) {
			if (!ig_name[i].isEmpty()) {
				rst_name.add(ig_name[i]);
				rst_amount.add(ig_amount.length > i ? ig_amount[i] : "");
				rst_unit.add(ig_unit[i]);
			}
		}
		params.replace("ig_name", rst_name);
		params.replace("ig_amount", rst_amount);
		params.replace("ig_unit", rst_unit);
		int postId;
		if (params.get("isMod").equals("YY")) {
			postId = postDao.modifyPost(params);
		} else {
			postId = postDao.writePost(params);
		}
		// }
		redirectAttributes.addAttribute("pid", postId);
		return "redirect:/foodie/detail.do";
	}

	@RequestMapping("/search_ig.do")
	@ResponseBody
	public List<String> startWith(@RequestParam String syllable) {
		List<LinkedHashMap> postList = ingredientDao.searchStartsWith(syllable);
		// postList에서 재료명만 추출
		List<String> ingredientList = new LinkedList<String>();
		Iterator<LinkedHashMap> iter = postList.iterator();
		while (iter.hasNext()) {
			HashMap post = iter.next();
			if (post.containsKey("ingredients")) {
				ArrayList<Map> arr = (ArrayList) post.get("ingredients");
				for (Map ig : arr) {
					if (((String) ig.get("name")).startsWith(syllable)) {
						ingredientList.add((String) ig.get("name"));
					}
				}
			}
		}
		return ingredientList;
	}
}
