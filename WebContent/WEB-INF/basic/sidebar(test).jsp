<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<div id="fh5co-offcanvas">
	<a href="#" class="fh5co-close-offcanvas js-fh5co-close-offcanvas"><span>
			<i class="icon-cross3"></i> <span>Close</span>
	</span></a>
	<div class="fh5co-bio" id="sidebar">
		<c:choose>
			<c:when test="${empty sessionScope.auth}">
				<h2 style="margin-right: 20px;">로그인</h2>
				<div id="login-container" style="width: 250px">
					<form id="login-form" autocomplete="off" method="post">
						<p>
							<input id="login-email" type="text" name="id"
								class="form-control" placeholder="이메일 입력"
								style="padding: 5px; font-size: 14pt; width: 250px;"
								pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
								required />
						</p>
						<p>
							<input id="login-password" type="password"
								onkeydown="enterevent();" name="pass" class="form-control"
								placeholder="비밀번호 입력"
								style="padding: 5px; font-size: 14pt; width: 250px;" required />
						</p>
						<p>
							<button type="button" id="login-form-button"
								style="padding: 5px; font-size: 14pt; width: 250px;">로그인</button>
						</p>
						<p>
							<input type="checkbox" name="keep" value="on" />로그인 상태유지
						</p>

					</form>
					<font size="2em" color="FFA500" style="margin-right: 20px;">
						아직 회원이 아니신가요? </font> <br /> <font size="2em" color="FFA500"
						style="margin-right: 20px;"> 혹은 비밀번호가 기억나지 않으신가요? </font> <br />
					<a data-toggle="modal" href="#signupModal"
						class="js-fh5co-close-offcanvas">회원가입</a> | <a data-toggle="modal"
						href="#pwsettingModal" class="js-fh5co-close-offcanvas"
						style="margin-right: 20px;">비밀번호 찾기</a>
				</div>

			</c:when>
			<c:when test="${!empty sessionScope.auth}">

				<h1 style="margin-top: 70px">오예${empty sessionScope.auth}</h1>
				<div id="logon-container">
					<figure>
						<img src="/template/images/person1.jpg"
							alt="Free HTML5 Bootstrap Template" class="img-responsive">
					</figure>
					<h3 class="heading">사용자</h3>
					<h2>Test1</h2>
					<p>Im a ${sessionScope.auth.user[0].NAME}!</p>
					<ul style="list-style: none;">
						<li><a href="profile.do" style="margin-right: 50px;"><i
								class="icon-book3">프로필</i></a></li>
						<li><a href="admin.do" style="margin-right: 50px;"><i
								class="icon-pencil">관리/통계</i></a></li>
						<!--(마트관리자용)-->
						<li><a href="/authentication/logout.do"
							style="margin-right: 50px;"><i class="icon-log-out">LOG
									OUT</i></a></li>
					</ul>
				</div>
			</c:when>
		</c:choose>
	</div>
</div>
<!-- sign up Modal -->
<div class="modal fade" id="signupModal" role="dialog">
	<div class="modal-dialog">

		<!-- sign up Modal content-->
		<div class="modal-content" style="font-family: '나눔고딕'">
			<div class="modal-header" style="font-family: '나눔고딕'">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="text" align="center">회원가입</h4>
			</div>
			<div class="modal-body" style="font-family: '나눔고딕'">
				<form action="/foodie/profile.jsp" autocomplete="off">
					<h4 class="text">회원 종류를 선택하세요.</h4>
					<select class="form-control" id="user" style="font-size: 12pt;">
						<option>일반 유저</option>
						<option>마트 관리자</option>
					</select>
					<h4 class="text">성별을 선택하세요.</h4>
					<select class="form-control" id="sex" style="font-size: 12pt;">
						<option>여</option>
						<option>남</option>
					</select>
					<h4 class="text">태어난 연도를 선택하세요.</h4>
					<select class="form-control" id="year" style="font-size: 12pt;">
					</select>
					<h4 class="text">이메일을 입력하세요.</h4>
					<input id="email-input" type="text" name="email"
						class="form-control" placeholder="이메일 입력"
						style="font-size: 12pt; width: 100%;"
						pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
						required /> <!-- <br /> -->
						
						
						<div id="checkMsg"></div>   <!-- 이메일 중복유무 알림메세지 표시되는 공간 -->
						
						<h4 align="right">
						<button id="duplcheck-btn" type="button"  >중복체크</button>
					</h4>
					<p align="right">
						<button id="email-btn" type="button" style="display:none;"  >인증키 발급</button>
					</p>
				<!--  중복체크가 완료되기 전까지는 display:none 상태 -->
					
					
					
					<p align="left">
					<h4>
						발급받은 인증키를 입력해주세요: &nbsp;<form action="/mail/resultKey.do"><input type="text" id="email-text"
							placeholder="인증키 입력" /> &nbsp;
						<button id="email-check" type="button">인증확인</button></form>
					</h4>
					</p>








					<h4 class="text">비밀번호를 입력하세요.</h4>
					<input type="password" name="pass" class="form-control"
						placeholder="비밀번호 입력" style="font-size: 12pt; width: 100%;"
						required />
					<h4 class="text">닉네임을 입력하세요.</h4>
					<input type="text" name="id" class="form-control"
						placeholder="닉네임 입력" style="font-size: 12pt; width: 100%;"
						required />
				</form>
			</div>
			<div class="modal-footer">
				<button id=join-btn disabled="disabled" type="button" class="btn" data-toggle="modal"
					onclick="location='welcome.do'">가입</button>
					 
					<!-- disabled 설정 및 버튼 id 값 부여 -->
					
				<button type="button" class="btn" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- pw setting Modal -->
<div class="modal fade" id="pwsettingModal" role="dialog">
	<div class="modal-dialog">

		<!-- pw setting Modal content-->
		<div class="modal-content" style="font-family: '나눔고딕'">
			<div class="modal-header" style="font-family: '나눔고딕'">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="text" align="center">비밀번호 찾기</h4>
			</div>
			<div class="modal-body" style="font-family: '나눔고딕'">
				<form action="/foodie/profile.jsp" autocomplete="off">
					<h4 class="text">이메일을 입력하세요.</h4>
					<input type="text" name="id" class="form-control"
						placeholder="이메일 입력" style="font-size: 12pt; width: 100%;"
						pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
						required />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"
					onclick="location='pwreset.do'">전송</button>
			</div>
		</div>
	</div>
</div>
<script>
	/*   
	 $("#login-form-button").click(function(){
	 $.ajax("/authentication/login.do",{
	 "method": "POST",
	 "async": false ,
	 "data": {"email": $("#login-email").val()  , "password": $("#login-password").val() }
	 })
	 .done(function( msg ) {
	 console.log(msg)
	 })
	 })
	 */
	$("#login-form-button").click(function() {
		$.ajax("/authentication/login.do", {
			"method" : "post",
			"async" : false,
			"data" : {
				"email" : $("#login-email").val(),
				"password" : $("#login-password").val()
			}
		}).done(function(obj) {
			if (obj.auth == 0) {
				$("#login-container").hide();
				$("#logon-container").show();
				location.href = "/foodie/main.do"
			}else if (obj.auth==2){
				window.alert("이메일 혹은 패스워드가 잘못되었습니다.");
			}
		})
	})
	
	function enterevent(){
		if(event.keyCode == 13){
			$.ajax("/authentication/login.do", {
				"method" : "post",
				"async" : false,
				"data" : {
					"email" : $("#login-email").val(),
					"password" : $("#login-password").val()
				}
			}).done(function(obj) {
				if (obj.auth == 0) {
					$("#login-container").hide();
					$("#logon-container").show();
					location.href = "/foodie/main.do"
				}else if (obj.auth==2){
					window.alert("이메일 혹은 패스워드가 잘못되었습니다.");
				}
			})
		}
	}
	window.onload=function() {
		var sYear=2018
		var eYear=1968
		var strYear="";
		for(var i=eYear; i<=sYear; i++){
			strYear += "<option value="+i+">"+i+"</option>";
		}
		document.getElementById("year").innerHTML=strYear;
	};
	
	 //이메일 입력칸 유효성 체크
	$("#email-btn").click(function(){
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if($("#email-input").val()==""){
			window.alert("이메일을 입력해주세요");
			$("#email-input").focus();
			return false;
		 	} else {
		 		 
		 		if(!regEmail.test($("#email-input").val())) {
			alert("이메일 주소가 올바르지 않습니다");
			$("#email-input").focus();
			return false;
		} 
		 	};
		 		 
		
		
		$.ajax("/mail/sendKey.do", {
			"method":"post",
			"async":true,
			"data":{
				"email":$("#email-input").val()
			}
		}).done(function(obj){
			window.alert("입력하신 이메일로 인증키를 발송하였습니다.");
			/* var result = JSON.parse(obj);
			if(result == true){
				
			}else{
				
			} */
			
		})
	  });
	
		$("#email-check").click(function() {
			$.ajax("/mail/resultKey.do", {
				"method":"post",
				"async":true,
				"data":{
					"authKey":$("#email-text").val()
				}
		
			}).done(function(obj){
				if(obj == "true") {
					
					window.alert("인증에 성공하였습니다.");
					$("email-btn").removeAttr("disabled")
				}else if (obj == "false"){
					window.alert("인증키를 잘못 입력하였습니다.");
				
				}
			})
		 });
		
		
		//
		
		//$(document).ready(function(){
	        //$("duplcheck-btn").on('click', function(){
	        	
	        	$("duplcheck-btn").click(function() {
	        		console.log("?");
	            $.ajax("/mail/duplCheck.do", {
	            	"method":"post",
	                "data": {
	                    "email" : $('#email').val()
	                }
	            }).done(function(data){
	              
	                    if($.trim(data) == 0){
	                        $('#checkMsg').html('<p style="color:blue">이미 존재하는 email 입니다</p>');
	                    }
	                    else{
	                        $('#checkMsg').html('<p style="color:red">사용가능한 email 입니다</p>');
	                        $("#join-btn").removeAttr("display:none;")
	                    }
	            })
	            });    


		
		
		
		/* $("duplcheck-btn").click(function() {
			$.ajax("/mail/duplCheck.do", {
				"method":"post",
				 "async":true,
				"data":{
					"authKey":$("#email-text").val() 
				}
		
			}).done(function(obj){
				if(obj.data == true) {
					window.alert("이미 존재하는 email 입니다.");
				}else if (obj.data == false){
					window.alert("사용가능한 email 입니다.");
					$("#join-btn").removeAttr("display:none;")
				}
			})
		 }); */
		
		
		
		    

		    

	
	
	
	
</script>