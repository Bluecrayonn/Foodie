<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.center{
		margin: auto;
		text-align: center;
	}
</style>

<div class="center">
	비밀번호 재설정을 위한 이메일이 전송되었습니다.<br/>
	이메일에 전송된 코드를 입력하세요.<br/><br/>
	<input id="password-auth-key" type="text" name="id" class="form-control" placeholder="코드 입력"
	style="font-size: 12pt; width: 40%; margin: auto;" pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" required/> <br/>
	<button id="password-auth-button"class="btn btn-warning" onclick="">인증</button>
	<br/><br/><br/>
	
	<div class = "center" style="display: none">
 	<input id="email" type="password" name="email" class="form-control" placeholder="${sessionScope.emailPasswordCheck}"
	style="font-size: 12pt; width: 40%; margin: auto;" disabled="disabled" required/> <br/>
	
	<input id="new-password" type="password" name="new-password" class="form-control" placeholder="새로운 비밀번호 입력"
	style="font-size: 12pt; width: 40%; margin: auto;" required/> <br/>
	<input id="new-password-confirm" type="password" name="new-password" class="form-control" placeholder="비밀번호 확인"
	style="font-size: 12pt; width: 40%; margin: auto;" required/> <br/><button type="button"id="password-reset-button" class="btn " onclick="">비밀번호 변경</button>
 	</div>
	 
</div>


<script>
$("#password-auth-button").click(function(){
	$.ajax("/mail/passwordauthkeyconfirm.do",{
		"method":"post",
		"async":true,
		"data":{
			"authKey":$("#password-auth-key").val()
		}
	}).done(function(obj){
		if(obj=="confirmOk"){
			console.log(obj);
			$(".center").css("display","block");
			$("#password-auth-button").removeClass("btn-warning btn-danger");
			$("#password-auth-button").addClass("btn-success");
			$("#password-auth-button").html("인증완료");

		}else{
 			console.log(obj);
			
			$("#password-auth-button").removeClass("btn-warning");
			$("#password-auth-button").addClass("btn-danger");
			$("#password-auth-button").html("잘못된 인증번호");
		}
	})
})

$("#new-password-confirm").keyup(function(){
	var newpassword = $("#new-password").val();
	var confirmpassword = $(this).val();
	console.log("new:"+newpassword);
	console.log("confirm:"+confirmpassword);
	if(newpassword==confirmpassword){
		console.log("olleh");
	}else{
		console.log("wrong!")
	}
})

$("#password-reset-button").click(function(){
	console.log($("#email").attr("placeholder"));
	$.ajax("/account/passwordFind.do",{
		"method":"post",
		"async":true,
		"data":{
			"new-password":$("#new-password-confirm").val(),
			"email":$("#email").attr("placeholder")
		}
	}).done(function(obj){
		if(obj=="success" ){
			window.alert("비밀번호가 성공적으로 변경되었습니다.")
			location.assign("/foodie/main.do");
		}else{
			window.alert("에러발생 관리자에게 문의하세요")
			location.assign("/foodie/main.do");
		}
	})
	
})



</script>