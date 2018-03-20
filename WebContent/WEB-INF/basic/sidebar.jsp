<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="fh5co-offcanvas">
	<a href="#" class="fh5co-close-offcanvas js-fh5co-close-offcanvas"><span>
			<i class="icon-cross3"></i> <span>Close</span>
	</span></a>
	<div class="fh5co-bio">
		<c:choose>
			<c:when test="${empty sessionScope.auth}">
				<h1>로그인을 해주세요~</h1>
				<div id="login-container">
					<form id="login-form" autocomplete="off">
						<p>
							<input id="login-email" type="text" name="id"
								class="form-control" placeholder="이메일 입력"
								style="padding: 5px; font-size: 14pt; width: 250px;"
								pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
								required />
						</p>
						<p>
							<input id="login-password" type="password" name="pass"
								class="form-control" placeholder="비밀번호 입력"
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
					<font size="2em" color="FFA500"> 아직 회원이 아니신가요? </font> <br /> <a
						data-toggle="modal" href="#myModal"
						class="js-fh5co-close-offcanvas">회원가입</a> | <a href="">아이디찾기</a> |
					<a href="">비밀번호찾기</a>
				</div>

			</c:when>
			<c:when test="${!empty sessionScope.auth}">

				<h1>오예${empty sessionScope.auth}</h1>
				<div id="logon-container" >
					<figure>
						<img src="/templet/images/person1.jpg"
							alt="Free HTML5 Bootstrap Template" class="img-responsive">
					</figure>
					<h3 class="heading">사용자</h3>
					<h2>Test1</h2>
					<h2>${sessionScope.auth}</h2>
					<p>Im a ${sessionScope.auth.user[0].NAME}!</p>
					<ul class="fh5co-social">
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-facebook"></i></a></li>
						<li><a href="#"><i class="icon-instagram"></i></a></li>
					</ul>

				</div>

			</c:when>

		</c:choose>







	</div>
	<div class="fh5co-menu">
		<div class="fh5co-box">
			<h3 class="heading">Categories</h3>
			<ul>
				<li><a href="#">프로필</a></li>
				<li><a href="#">레시피</a></li>
				<li><a href="#">북마크</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content" style="font-family: '나눔고딕'">
			<div class="modal-header" style="font-family: '나눔고딕'">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="modal-title">Modal Header</h4>
			</div>
			<div class="modal-body" style="font-family: '나눔고딕'">
				<form action="/foodie/profile.jsp" autocomplete="off">
					<p>
						<input type="text" name="id" class="form-control"
							placeholder="이메일 입력"
							style="padding: 5px; font-size: 14pt; width: 250px;"
							pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
							required />
					</p>
					<p>
						<input type="password" name="pass" class="form-control"
							placeholder="비밀번호 입력"
							style="padding: 5px; font-size: 14pt; width: 250px;" required />
					</p>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#" class="button" style="font-family: '나눔고딕'">회원가입</a>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					style="font-family: '나눔고딕'">닫기</button>
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
			}
		})
	})
</script>