package controllers;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import models.PostDao;

@Controller
@RequestMapping("/foodie")
public class WritePostController {
	@Autowired
	PostDao postDao;
	@RequestMapping("/write.do")
	public String write() {
		return "write";
	}
	@RequestMapping("/write_confirm.do")
	public String write_ok(
			@RequestParam("thumbnail") MultipartFile f,
			@RequestParam HashMap params,
			@RequestParam String[] ig_name,
			@RequestParam String[] ig_amount,
			@RequestParam String[] ig_unit,
			HttpServletRequest request) throws IllegalStateException, IOException {
		String ct = f.getContentType();
		if (!f.isEmpty() && ct.startsWith("image")) {
			String uploadPath = request.getSession().getServletContext().getRealPath("") + File.separator + "image";
			String orgFileName = f.getOriginalFilename();
			int lastIdx = orgFileName.lastIndexOf('.');
			String extension = orgFileName.substring(lastIdx, orgFileName.length());
			String dest = uploadPath + "\\" + String.valueOf(System.currentTimeMillis()) + extension;
			File target = new File(dest);
			f.transferTo(target);
			params.put("mainimage", target.getName());
			System.out.println(params.get("title"));
			System.out.println(ig_name[1]);
			System.out.println(ig_amount[1]);
			System.out.println(ig_unit.length);
			postDao.writePost(params);
			// TODO: ig_name, ig_amount, ig_unit을 post_id에 맞게 몽고에 저장할 것
		} 
		return "main";
	}
}
