package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/foodie")
public class WritePostController {
	@RequestMapping("/write.do")
	public String write() {
		return "write";
	}
	@RequestMapping("/write_confirm.do")
	public String write_ok(String[] ig_name, String[] ig_amount, String[] ig_unit
			,@RequestParam("thumbnail") MultipartFile f
			,String editordata, String elapsedtime 
			,HttpServletRequest request) throws IllegalStateException, IOException {
		String ct = f.getContentType();
		
		if (!f.isEmpty() && ct.startsWith("image")) {
			String uploadPath = request.getSession().getServletContext().getRealPath("") + File.separator + "image";
			String orgFileName = f.getOriginalFilename();
			int lastIdx = orgFileName.lastIndexOf('.');
			String extension = orgFileName.substring(lastIdx, orgFileName.length());
			String dest = uploadPath + "\\" + String.valueOf(System.currentTimeMillis()) + extension;
			File target = new File(dest);
			f.transferTo(target);
		}
		System.out.println(editordata);
		
		return "main";
	}
}
