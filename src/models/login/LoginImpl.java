package models.login;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import models.LoginDAO;
/*
 * 1. 등록되지 않은 이메일일 경우 return 1;
 * 
 * 2. 패스워드가 일치하지 않을경우 = return 2;
 * 3. 성공한경우 return =0;
 */
@Repository
public class LoginImpl    {
   
   @Autowired 
   SqlSessionFactory sqlFactory;
    
   //입력받은 EMAIL 에 해당하는 정보 가지고 오기
   //SESSION 에 현재 EMAIL, SESSION, 저장해놓기
   
   
   public int emailCheck(String email){
      SqlSession sqlsession = sqlFactory.openSession();
      try {
          if(sqlsession.selectList("dummy.email",email).size()==0) {
             return 1;
          }else {
             return 2;
          }
      } finally {
         sqlsession.close();
      }
      
      
   }
   
   public Map accountSearch(String email){
      SqlSession sqlsession = sqlFactory.openSession();
      try {
         return sqlsession.selectOne("dummy.login",email);
      } finally {
         sqlsession.close();
      }
      
      
   }
   /*
    * 전달받는 정보를 통해서 email과 PASSWORD 비교하기 아... email 없으면?
    */
   public int accountCheck(Map list,String email, String password) {
      LinkedHashMap<String, String > result = new LinkedHashMap<>();
       
         result.putAll(list);
       
      System.out.println(result.toString());
      if(((String)result.get("EMAIL")).equals(email) &&  ((String)result.get("PASSWORD")).equals(password)) {
         return 0;
      }
      
      
      return 2;
   }

}