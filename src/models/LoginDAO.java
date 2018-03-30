package models;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.util.LinkedMultiValueMap;

public interface LoginDAO {
	public int emailCheck(String email);
	
	public Map accountSearch(String email);
	/*
	 * 전달받는 정보를 통해서 email과 PASSWORD 비교하기 아... email 없으면?
	 */
	public int accountCheck(ArrayList<Map> list,String email, String password);
}
