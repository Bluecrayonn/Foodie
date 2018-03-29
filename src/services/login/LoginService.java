package services.login;

import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthScrollBarUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;

import models.login.LoginImpl;
import models.social.SocialInfoImpl;

@Service
public class LoginService {

	@Autowired
	LoginImpl loginImpl;
	@Autowired
	SocialInfoImpl followInfoImpl;

	public int confirmEmail(Map<String, String> map) {

		String email = (String) map.get("email");
		String password = (String) map.get("password");

		if (loginImpl.emailCheck(email) == 1) {
			return 1;

		} else if (loginImpl.emailCheck(email) == 2) {

			Map rst =  loginImpl.accountSearch(email);
			System.out.println(rst.toString());

			int result = loginImpl.accountCheck(rst, email, password);
			return result;

		}

		return 2;

	}

	public HashMap<String, String> setAuth(String email) {

		LinkedHashMap<String, List> result = new LinkedHashMap<>();
		Map user = loginImpl.accountSearch(email);
		  
		return (HashMap<String, String>) user;

	}

}
