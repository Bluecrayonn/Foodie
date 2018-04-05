<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        var chk = -1;
        
        
        $("#auth_btn").click(function () {
            var data = {"email": $("#email").val()};
            var authNum = "";
            
            $.ajax({
                url : "emailAuth.do",
                data : data,
                success : function (data) {
                    authNum = data;
                    alert("인증번호 전송완료.");
                    
                    chk = checkNum(authNum);
                    
                    if( chk > 0){
                        alert("인증완료");
                        chk = 1;
                        $("#lab1").html("<label>인증완료</label>");
                    }else{
                        alert("인증실패");
                        $("#lab1").html("<label>인증실패</label>");
                    }
                    
                }
                
            });
            
        });// 이메일 인증 버튼 end
        
        // 회원가입
        $("#signUp_btn").click(function () {
            if( chk > 0  ){
                return true;
            }else{
                alert("이메일 인증을 완료하여 주세요.");
                return false;
            }
            
        });
        
    });
</script>
<script type="text/javascript">
    function checkNum(authNum) {
        var chk = 0;
        var user_authNum = prompt("인증번호를 입력하세요.");
        // 인증번호 비교
        if (authNum == user_authNum) {
            chk = 1;
            $("#user_authNum").val(user_authNum);
        } else {
            chk = -1;
        }
 
        return chk;
    };
 
</script>
<title>Insert title here</title>
</head>
<body>
    <h2>회원가입</h2>
    <hr>
    
    <form action="signOk.do" method="post">
        아이디 : <input type="text" name="id" id="id"><br>
        비밀번호 : <input type="password" name="pwd1" id="pwd1"><br>
        비밀번호 확인 : <input type="password" name="pwd2" id="pwd2"><br>
        이메일 주소 :  <input type="text" name="email" id="email">
        <button type="button" id="auth_btn">인증하기</button>
        <br>
        인증번호 : <input type="text" id="user_authNum" name="user_authNum" readonly="readonly"><div id="lab1"></div><br>
        
        <input type="submit" id="signUp_btn" value="가입하기">
        <input type="reset" value="지우기"><br>
    </form>
</body>
</html>

