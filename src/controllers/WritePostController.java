package controllers;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

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
			
			// rearrange ingredient parameter
			// if name is null, remove index
			List rst_name = new LinkedList();
			List rst_amount = new LinkedList();
			List rst_unit = new LinkedList();
			
			for(int i=0; i < ig_name.length; i++) {
				if (!ig_name[i].isEmpty()) {
					rst_name.add(ig_name[i]);
					rst_amount.add(ig_amount[i]);
					rst_unit.add(ig_unit[i]);
				}
			}
			params.replace("ig_name", rst_name);
			params.replace("ig_amount", rst_amount);
			params.replace("ig_unit", rst_unit);
			postDao.writePost(params);
		} 
		return "mainpage";
	}
}
