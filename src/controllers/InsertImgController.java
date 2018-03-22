package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/foodie/write")
public class InsertImgController {
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="/insertimg.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertImg(MultipartHttpServletRequest request) 
			throws IllegalStateException, IOException {
		Iterator<String> itr = request.getFileNames(); 
		if(itr.hasNext()) { 
			MultipartFile mpf = request.getFile(itr.next());
			String ct = mpf.getContentType();
			if (!mpf.isEmpty() && ct.startsWith("image")) {
				String uploadPath = request.getSession().getServletContext().getRealPath("") + File.separator + "image";
				String orgFileName = mpf.getOriginalFilename();
				int lastIdx = orgFileName.lastIndexOf('.');
				String extension = orgFileName.substring(lastIdx, orgFileName.length());
				String dest = uploadPath + "\\" + String.valueOf(System.currentTimeMillis()) + extension;
				File target = new File(dest);
				mpf.transferTo(target);
				
				return servletContext.getAttribute("path")+"/image/"+target.getName();
			}
		}		
		return null;		
	}
}
