package filter;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckInterceptor {
	/*
	 * redirect 경로는 login page로 
	 * 
	 */
	
	public boolean preHandler(HttpServletRequest req, HttpServletResponse resp) throws IOException	{
		
		HttpSession session = req.getSession(false);
		
		if(session == null) {
			resp.sendRedirect("");
			return false;
		}
		
		Map user = (LinkedHashMap)session.getAttribute("auth");
		
		if(user==null) {
			resp.sendRedirect("");
			return false;
		}
		
		return true;
	}

}
