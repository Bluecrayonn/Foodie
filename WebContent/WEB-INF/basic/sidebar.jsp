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
				<form action="/account/insertOk.do" autocomplete="off" method="post">
					<!-- <h4 class="text">회원 종류를 선택하세요.</h4>
					<select class="form-control" id="user" style="font-size: 12pt;">
						<option>일반 유저</option>
						<option>마트 관리자</option>
					</select> -->
					<h4 class="text">성별을 선택하세요.</h4>
					<select class="form-control" id="sex" style="font-size: 12pt;">
						<option>여</option>
						<option>남</option>
					</select>
					<h4 class="text">태어난 연도를 선택하세요.</h4>
					<select class="form-control" id="year" style="font-size: 12pt;">
					</select>
					<h4 id="emailchecktext" class="text">이메일을 입력하세요.</h4>
					<input id="email-check" type="text" name="email"
						class="form-control" placeholder="이메일 입력"
						style="font-size: 12pt; width: 70%; display: inline;"
						pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
						required />
					<button id="email-auth-btn" class="btn btn-primary"
						style="width: 28%; height: 54px; margin-left: 3px; vertical-align: middle"
						type="button">인증번호전송</button>
					<div  id="email-check-auth-div" style="display: none">
						<input id="email-check-auth" type="text" name="authkey"
							class="form-control" placeholder="전송받은 인증번호를 입력하세요"
							style="font-size: 12pt; width: 70%; display: inline;margin-top:20px;"
							required />
						<button id="email-auth-check-btn" class="btn btn-primary"
							style="margin-top:20px;width: 28%; height: 54px; margin-left: 3px; vertical-align: middle"
							type="button">인증확인</button>
					</div>
					<h4 class="text">비밀번호를 입력하세요.</h4>
					<input type="pwd" name="pwd" class="form-control signup-form"
						placeholder="비밀번호 입력" style="font-size: 12pt; width: 100%;"
						disabled="disabled" required />
					<h4 class="text">닉네임을 입력하세요.</h4>
					<input type="text" name="nickname" class="form-control signup-form"
						disabled="disabled" placeholder="닉네임 입력"
						style="font-size: 12pt; width: 100%;" required />
					<div class="modal-footer">
						<button type="submit" class="btn signup-form" data-toggle="modal"
							disabled="disabled">가입</button>
						<button type="button" class="btn" data-dismiss="modal"
							disabled="disabled">닫기</button>
					</div>
			</div>
			</form>
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
<script >
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
			} else if (obj.auth == 2) {
				window.alert("이메일 혹은 패스워드가 잘못되었습니다.");
			}
		})
	})

	function enterevent() {
		if (event.keyCode == 13) {
			$.ajax("/authentication/login.do", {
				"method" : "post",
				"async" : true,
				"data" : {
					"email" : $("#login-email").val(),
					"password" : $("#login-password").val()
				}
			}).done(function(obj) {
				if (obj.auth == 0) {
					$("#login-container").hide();
					$("#logon-container").show();
					location.href = "/foodie/main.do"
				} else if (obj.auth == 2) {
					window.alert("이메일 혹은 패스워드가 잘못되었습니다.");
				}
			})
		}
	}
	window.onload = function() {
		var sYear = 2018
		var eYear = 1968
		var strYear = "";

		for (var i = eYear; i <= sYear; i++) {
			strYear += "<option value="+i+">" + i + "</option>";
		}
		document.getElementById("year").innerHTML = strYear
	}

	$("#email-check")
			.keyup(
					function() {
						var regid = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
						if (!regid.test($(this).val())) {
							$("#emailchecktext").css("color", "red");
							$("#emailchecktext").html("형식에 맞지 않습니다.");
						} else if (regid.test($(this).val())) {

							$.ajax("/account/emailcheck.do", {
								"method" : "post",
								"async" : true,
								"data" : {
									"email" : $(this).val()
								}
							}).done(
									function(obj) {
										console.log(obj)
										if (obj == "exists") {
											$("#emailchecktext").css("color",
													"red");
											$("#emailchecktext").html(
													"이미 존재하는 아이디 입니다.");
										} else if (obj == "possible") {
											$("#emailchecktext").css("color",
													"green");
											$("#emailchecktext").html(
													"사용가능한 아이디 입니다.")
										}
									})
						}

					})
	//인증번호 발송 
	$("#email-auth-btn").click(function() {
		$.ajax("/mail/emailauthkey.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"receiver" : $("#email-check").val()
			}

		}).done(function(obj) {
			if (obj == "sendfail") {

				$("#email-auth-btn").removeClass("btn-primary");
				$("#email-auth-btn").addClass("btn-danger");
				$("#email-auth-btn").html("인증메일 발송 실패")

			} else if (obj == "sendsucc") {

				$("#email-auth-btn").html("메일 발송 성공")
				$("#email-auth-btn").removeClass("btn-primary");
				$("#email-auth-btn").addClass("btn-success");
				$("#email-check-auth-div").css("display", "inline");
			}

		})
	})

	//전송받은 인증번호 확인
	$("#email-auth-check-btn").click(function() {
		$.ajax("/mail/emailauthkeyconfirm.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"email" : $("#email-check").val(),
				"authKey" : $("#email-check-auth").val()
			}
		}).done(function(obj) {
			if (obj = "confirmOk") {
				$(".signup-form").removeAttr("disabled");
				$("#email-auth-check-btn").removeClass("btn-primary");
				$("#email-auth-check-btn").addClass("btn-success");
				$("#email-auth-check-btn").html("인증성공");

			} else if ("confirmFail") {
				$("#email-auth-check-btn").removeClass("btn-primary");
				$("#email-auth-check-btn").addClass("btn-danger");
				$("#email-auth-check-btn").html("인증실패");

			}

		})
	})
</script>