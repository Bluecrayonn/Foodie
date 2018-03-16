package services.login;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;

import models.login.LoginImpl;

@Service
public class LoginService {
	
	@Autowired
	LoginImpl loginImpl;
	
	public int confirmEmail(Map<String, String>  map) {
		
		
		String email = (String) map.get("email");
		String password = (String) map.get("password");
		
		
		
		if(loginImpl.emailCheck(email)==1) {
			return 1;
			
		}else if(loginImpl.emailCheck(email)==2) {
			
			ArrayList<Map> rst  = (ArrayList<Map>) loginImpl.accountSearch(email);
			System.out.println(rst.toString());
			
			int result =  loginImpl.accountCheck(rst, email, password);
			return result;
			
		}
		
		return 2;
		
	}

}
