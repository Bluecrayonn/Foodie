package services;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadService {
	public String thumbnailUpload(HttpServletRequest request, MultipartFile f) throws IllegalStateException, IOException {
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + File.separator + "upload_img";
		String orgFileName = f.getOriginalFilename();
		int lastIdx = orgFileName.lastIndexOf('.');
		String extension = orgFileName.substring(lastIdx, orgFileName.length());
		String dest = uploadPath + "/" + String.valueOf(System.currentTimeMillis()) + extension;
		File target = new File(dest);
		f.transferTo(target);
		return target.getName();
	}
}
