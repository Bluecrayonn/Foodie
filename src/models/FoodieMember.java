package models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

//DAO 역할

@Entity
//컨트롤러에서 JPA를 이용하여 유효성체크를 하기에 앞서 어노테이션을 이용하여 DB에 존재하는 컬럼과 대응이 되도록 처리
public class FoodieMember {

	//어노테이션을 이용한 유효성 체크
	@Id
	@Size(min=6, max=50, message="닉네임은 3~50자리로 입력해주세요")
	//해당 프로퍼티가 테이블에서 primary key 역할을 한다는 것을 나타냄
   private String nickname;
	
	
	@Size(min=6, max=20, message="비밀번호는 6~50자리로 입력해주세요")
   private String pwd;
	
	@Pattern(regexp="^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", message="올바른 이메일 형식이 아닙니다")
	//이메일 정규식 
	// 역슬래시가 들어가면 이스캐이프 문자로 인식하므로 역슬래시를 사용하려면 두개씩 필요
   private String email;

	

   public String getNickname() {
       return nickname;
   }
   public void setNickname(String nickname) {
       this.nickname = nickname;
   }
   public String getPwd() {
       return pwd;
   }
   public void setPwd(String pwd) {
       this.pwd = pwd;
   }
   public String getEmail() {
       return email;
   }
   public void setEmail(String email) {
       this.email = email;
   }	
}
